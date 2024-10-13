import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetailsModal extends StatelessWidget {
  final String title;
  final String desc;
  final String company;
  final String applyLink;
  final String experience;
  final String location;
  final String moreInfoLink;
  final String date;
  final String jobTitle;

  JobDetailsModal(dynamic job, {super.key})
      : title = job["title"],
        desc = job["desc"],
        company = job["company"],
        applyLink = job["apply-link"],
        experience = job["experience"],
        location = job["location"],
        moreInfoLink = job["moreInfoLink"],
        date = job["date-posted"],
        jobTitle = job["job-title"];

  Future<void> _onOpenLink(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1.6, // Ensures the modal sheet takes up 3/4th of the screen height
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        child: Stack(
          children: [
            ListView(
              children: [
                // Company Name
                Text(
                  company,
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 30,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(thickness: 1, color: Colors.grey),

                const SizedBox(height: 20),

                // Job Title
                Text(
                  jobTitle,
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),

                // "Posted on", "Experience", and "Location"
                const SizedBox(height: 24),
                Text(
                  "Posted on: $date",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),

                const SizedBox(height: 6),
                Text(
                  "Experience: $experience",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Location: $location",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Apply Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _onOpenLink(applyLink),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Orange button
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(39), // Rounded corners
                      ),
                      elevation: 4, // Shadow effect
                      shadowColor: Colors.black.withOpacity(0.9), // Soft shadow
                    ),
                    child: Text(
                      'Apply Now',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600, // Slightly bolder text
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),
                FloatingActionButton.extended(
                  elevation: 0,
                  onPressed: () async {

                    try {
                      await Share.share(
                        'Check out this job opportunity at $company for $jobTitle. : $applyLink\n\nFor more opportunities install Harbour app via : https://play.google.com/store/apps/details?id=com.XSol.harbour ',
                        subject: 'Job Opportunity: $jobTitle',
                      );
                    } catch (e) {
                      print('Error while sharing: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error while sharing: $e')),
                      );
                    }
                    // await Share.share('check out my website ');
                  },
                  label: const Text("Share"),
                  icon: const Icon(Icons.share, color: Colors.purple),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.teal,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                const SizedBox(height: 100),
              ],
            ),

            // Share Button on the top right corner

          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class JobDetailsModal extends StatelessWidget {
//   final String title;
//   final String desc;
//   final String company;
//   final String applyLink;
//   final String experience;
//   final String location;
//   final String moreInfoLink;
//   final String date;
//   final String jobTitle;
//
//   JobDetailsModal(dynamic job, {super.key}):
//         title = job["title"],
//         desc = job["desc"],
//         company = job["company"],
//         applyLink = job["apply-link"],
//         experience = job["experience"],
//         location = job["location"],
//         moreInfoLink = job["moreInfoLink"],
//         date = job["date-posted"],
//         jobTitle = job["job-title"];
//
//   Future<void> _onOpenLink(String url) async {
//     if (!await launchUrl(Uri.parse(url))) {
//       throw Exception('Could not launch $url');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FractionallySizedBox(
//       heightFactor: 1.6, // Ensures the modal sheet takes up 3/4th of the screen height
//       child: Container(
//         padding: const EdgeInsets.all(16.0),
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
//         ),
//         child: ListView(
//           children: [
//             Text(
//               company,
//               style: GoogleFonts.inter(
//                 textStyle: const TextStyle(
//                     fontSize: 30,
//                     color: Colors.blueGrey,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             const Divider(thickness: 1, color: Colors.grey),
//             const SizedBox(height: 20),
//
//             Text(
//               jobTitle,
//               style: GoogleFonts.inter(
//                 textStyle: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//             ),
//
//
//             // "Posted on", "Experience", and "Location"
//             const SizedBox(height: 24),
//             Text(
//               "Posted on: $date",
//               style: GoogleFonts.inter(
//                 textStyle: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.black54,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 6),
//             Text(
//               "Experience: $experience",
//               style: GoogleFonts.inter(
//                 textStyle: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.black54,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 6),
//             Text(
//               "Location: $location",
//               style: GoogleFonts.inter(
//                 textStyle: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.black54,
//                 ),
//               ),
//             ),
//
//             const SizedBox(height: 24),
//             // SizedBox(
//             //   width: double.infinity,
//             //   child: ElevatedButton(
//             //     onPressed: () => _onOpenLink(applyLink),
//             //     style: ElevatedButton.styleFrom(
//             //       backgroundColor: Colors.orange, // Orange button
//             //       padding: const EdgeInsets.symmetric(vertical: 16),
//             //     ),
//             //     child: Text(
//             //       'Apply Now',
//             //       style: GoogleFonts.inter(
//             //         textStyle: const TextStyle(
//             //           fontSize: 16,
//             //           color: Colors.white,
//             //         ),
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () => _onOpenLink(applyLink),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange, // Orange button
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(39), // Rounded corners
//                   ),
//                   elevation: 4, // Shadow effect
//                   shadowColor: Colors.black.withOpacity(0.9), // Soft shadow
//                 ),
//                 child: Text(
//                   'Apply Now',
//                   style: GoogleFonts.inter(
//                     textStyle: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600, // Slightly bolder text
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//
//             // Job description
//             const SizedBox(height: 24),
//             Text(
//               desc,
//               style: GoogleFonts.inter(
//                 textStyle: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.teal,
//                 ),
//               ),
//             ),
//
//             // Apply button
//
//
//             // More Info button
//             const SizedBox(height: 20),
//             // SizedBox(
//             //   width: double.infinity,
//             //   child: ElevatedButton(
//             //     onPressed: () => _onOpenLink(moreInfoLink),
//             //     style: ElevatedButton.styleFrom(
//             //       backgroundColor: Colors.blue, // Blue button
//             //       padding: const EdgeInsets.symmetric(vertical: 16),
//             //     ), child: null,
//                 // nhi chahiye more info link
//                 // child: Text(
//                 //   'More Info',
//                 //   style: GoogleFonts.inter(
//                 //     textStyle: const TextStyle(
//                 //       fontSize: 16,
//                 //       color: Colors.white,
//                 //     ),
//                 //   ),
//                 // ),
//             //   ),
//             // ),
//             const SizedBox(height: 100)
//           ],
//         ),
//       ),
//     );
//   }
// }
