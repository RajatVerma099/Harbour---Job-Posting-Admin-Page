import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import '../global_constants.dart';
import 'resume_maker_websites_page.dart';
import '../tools/link_tools.dart';

class Resume extends StatefulWidget {
  const Resume({super.key});

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  final List<String> imageUrls = resumeThumbnails;
  final List<String> pdfFileUrls = resumeLinks;

  late CarouselSliderController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          'Resume Maker',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 20, // Slightly larger font size
              color: Colors.black, // Change text color for better contrast
              fontWeight: FontWeight.bold, // Make the text bold for emphasis
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CarouselSlider.builder(
            carouselController: _controller,
            itemCount: imageUrls.length,
            options: CarouselOptions(
              enableInfiniteScroll: false,
              viewportFraction: 0.692,
              enlargeCenterPage: true,
              pageSnapping: true,
              aspectRatio: 1.0,
              scrollPhysics: const BouncingScrollPhysics(),
              onPageChanged: (index, reason) {
                setState(() => _currentIndex = index);
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          FloatingActionButton.extended(
            heroTag: "btn3",
            onPressed: () => launchURL(pdfFileUrls[_currentIndex]),
            label: const Row(
              children: [
                Icon(Icons.download_rounded),
                SizedBox(width: 4),
                Text("Download this template"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imageUrls.length,
                    (index) => Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey
                        .withOpacity(index == _currentIndex ? 1.0 : 0.4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "btn4",
        onPressed: () {
          // Navigate to the next page with custom page transition
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return WebsitePage();
              },
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.easeInOutQuart;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        },
        label: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.document_scanner_rounded),
            SizedBox(width: 4),
            Text("Make your own resume!"),
          ],
        ),
      ),
    );
  }
}
