import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../modal_sheets/add_job_modal.dart';
import '../modal_sheets/show_job_details_model.dart';
import 'package:intl/intl.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  late TextEditingController _locationController;
  late Stream<QuerySnapshot> _jobsStream;
  bool _isFilterExpanded = false; // Track if filter is expanded
  String _sortBy = 'date-posted'; // Default sort by date-posted
  bool _isSortingByLocation = false; // Track if sorting by location

  Future<void> goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  void initState() {
    super.initState();
    _locationController = TextEditingController();
    _updateJobsStream();
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  String convertDateFormat(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    DateFormat outputFormat = DateFormat('dd-MM-yyyy');
    return outputFormat.format(dateTime);
  }

  Widget loadingIndicator() {
    var loadingIndicators = const [
      CircularProgressIndicator(
        strokeWidth: 5,
      ),
    ];
    var index = Random().nextInt(loadingIndicators.length);
    return loadingIndicators[index];
  }

  void _updateJobsStream() {
    setState(() {
      bool isDescending = _sortBy == 'date-posted';
      _jobsStream = FirebaseFirestore.instance
          .collection("Jobs")
          .orderBy(_sortBy, descending: isDescending)
          .snapshots();
    });
  }

  void filterJobs(String location) {
    print('Filtering jobs for location: $location');
    location = location.trim();
    setState(() {
      _jobsStream = FirebaseFirestore.instance
          .collection("Jobs")
          .orderBy(_sortBy)
          .startAt([location])
          .snapshots();
    });
  }

  void resetSearch() {
    _locationController.clear();
    _updateJobsStream();
  }

  Color _getColorIndicator(String dateStr) {
    DateTime postedDate = DateTime.parse(dateStr);
    DateTime currentDate = DateTime.now();
    int daysDifference = currentDate.difference(postedDate).inDays;
    daysDifference = daysDifference.clamp(0, 30);
    double fraction = daysDifference / 30.0;
    int r = (255 * fraction).round();
    int g = (100 + (155 * (1 - fraction))).round();
    int b = 0;
    return Color.fromARGB(255, r, g, b);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/job_bg.jpg'), // Update the path to your image
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              title: Text(
                "Job Opportunities",
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              centerTitle: true,
              actions: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    setState(() {
                      if (value == 'location') {
                        _sortBy = 'location';
                        _isSortingByLocation = true;
                        _isFilterExpanded = true;
                        FocusScope.of(context).requestFocus(FocusNode());
                      } else {
                        _sortBy = 'date-posted';
                        _isSortingByLocation = false;
                        _isFilterExpanded = false;
                        resetSearch();
                      }
                      _updateJobsStream();
                    });
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'location',
                      child: Text('Sort by Location'),
                    ),
                    // const PopupMenuItem(
                    //   value: 'date-posted',
                    //   child: Text('Sort by Date (latest)'),
                    // ),
                  ],
                ),
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _isFilterExpanded ? 100 : 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: _locationController,
                          decoration: const InputDecoration(
                            hintText: 'Sort by location...',
                            border: InputBorder.none,
                          ),
                          focusNode: _isSortingByLocation ? FocusNode() : null,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        String location = _locationController.text;
                        location = location.isNotEmpty
                            ? location[0].toUpperCase() + location.substring(1)
                            : location;
                        location = location.trim();
                        if (location.isNotEmpty) {
                          filterJobs(location);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please enter a location to filter.'),
                            ),
                          );
                        }
                      },
                      child: const Text('Search'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: _jobsStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: loadingIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        String datePosted = snapshot.data!.docs[index]["date-posted"];
                        Color colorIndicator = _getColorIndicator(datePosted);
                        return Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white, // Background color of the card
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () => showModalBottomSheet(
                                      context: context,
                                      builder: (context) => JobDetailsModal(snapshot.data!.docs[index]),
                                    ),
                                    title: Text(
                                      "${snapshot.data!.docs[index]["title"]}",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Exp: ${snapshot.data!.docs[index]["experience"]}",
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "${snapshot.data!.docs[index]["location"]}",
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    trailing: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(Radius.circular(500)),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.double_arrow_rounded,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                        onPressed: () async {
                                          await goToWebPage(snapshot.data!.docs[index]["apply-link"]);
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 4, // Thickness of the border
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.vertical(
                                        bottom: Radius.circular(20), // Increase the curvature here
                                      ),
                                      color: colorIndicator, // Color based on the date difference
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Ribbon indicating "New Job"
                            if (DateTime.parse(snapshot.data!.docs[index]["date-posted"]).isToday)
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                                  decoration: const BoxDecoration(
                                    color: Colors.redAccent, // Red background for the ribbon
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    'New',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                      itemCount: snapshot.data!.docs.length,
                    );
                  } else {
                    return const Center(
                      child: Text('No jobs available.'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showModalBottomSheet(
      //       context: context,
      //       builder: (context) => const AddJobModal(),
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

extension DateTimeExtension on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return this.year == now.year && this.month == now.month && this.day == now.day;
  }
}
