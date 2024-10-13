
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CodeNScope extends StatefulWidget {
  const CodeNScope({super.key});

  @override
  State<CodeNScope> createState() => _CodeNScopeState();
}

class _CodeNScopeState extends State<CodeNScope> {
  int _techIndex = 0;
  int _codingIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Code N Scope'),

        title: Text(
          'Code N Scope',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Coding Platforms',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            CarouselSlider.builder(
              itemCount: codingWebsites.length,
              options: CarouselOptions(
                enableInfiniteScroll: false,
                viewportFraction: 0.6,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _codingIndex = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                return Center(
                  child: CodingWebsiteCard(
                    website: codingWebsites[index],
                    onTap: () => _launchURL(codingWebsites[index].websiteUrl),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: PageIndicator(currentIndex: _codingIndex, totalPages: codingWebsites.length),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Future Trends',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            CarouselSlider.builder(
              itemCount: technologies.length,
              options: CarouselOptions(
                enableInfiniteScroll: false,
                viewportFraction: 0.6,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _techIndex = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                return Center(
                  child: TechnologyCard(
                    technology: technologies[index],
                    onTap: () => _launchURL(technologies[index].websiteUrl),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: PageIndicator(currentIndex: _techIndex, totalPages: technologies.length),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class TechnologyCard extends StatelessWidget {
  final Technology technology;
  final VoidCallback onTap;

  const TechnologyCard({super.key, 
    required this.technology,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 9,
        shadowColor: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Image.network(
                  technology.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                technology.technologyName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CodingWebsiteCard extends StatelessWidget {
  final CodingWebsite website;
  final VoidCallback onTap;

  const CodingWebsiteCard({super.key, 
    required this.website,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 9,
        shadowColor: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Image.network(
                  website.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                website.websiteName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalPages;

  const PageIndicator({super.key, required this.currentIndex, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
            (index) => Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index ? Colors.deepPurple : Colors.grey.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}

class Technology {
  final String technologyName;
  final String imageUrl;
  final String websiteUrl;

  Technology({
    required this.technologyName,
    required this.imageUrl,
    required this.websiteUrl,
  });
}

class CodingWebsite {
  final String websiteName;
  final String imageUrl;
  final String websiteUrl;

  CodingWebsite({
    required this.websiteName,
    required this.imageUrl,
    required this.websiteUrl,
  });
}

final List<Technology> technologies = [
  Technology(
    technologyName: 'A.I.',
    imageUrl:'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/future%20trends%2FAI.jpg?alt=media&token=d4afddbc-ee88-45f8-96d2-3ee90c51a208',
    // 'https://drive.google.com/uc?export=download&id=1vVOuy97M9k865N4LBlcjQnPjkw2B6hi5',
    websiteUrl: 'https://www.geeksforgeeks.org/what-is-artificial-intelligence/',
  ),
  Technology(
    technologyName: 'Data Science',
    imageUrl:'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/future%20trends%2Fdata_science.jpg?alt=media&token=f80494e7-0e0c-4679-9b67-62642d17dac0',
    // 'https://drive.google.com/uc?export=download&id=1v_78ZR0xc4DBmfTbk25Mwny7OWU3P3fM',
    websiteUrl: 'https://www.geeksforgeeks.org/introduction-to-data-science/',
  ),
  Technology(
    technologyName: 'Angular and React',
    imageUrl: 'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/future%20trends%2Fangular_react.jpg?alt=media&token=a1947a24-cf28-4c9a-af37-0923e59e71b8',
    // 'https://drive.google.com/uc?export=download&id=1vh-Lu9RlM-zGO5ecuKH1uY4-XG1GqY4Y',
    websiteUrl: 'https://www.geeksforgeeks.org/angular-vs-reactjs-which-one-is-most-in-demand-frontend-development-framework-in-2019/',
  ),
  Technology(
    technologyName: 'DevOps',
    imageUrl: 'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/future%20trends%2Fdevops.jpg?alt=media&token=10336b68-1b40-4c72-9f5c-9863576c30cc',
    // 'https://drive.google.com/uc?export=download&id=1vjdWNZ2a5YMzZeAZb8119XElyoLHyZEn',
    websiteUrl: 'https://www.geeksforgeeks.org/devops-tutorial/',
  ),
  Technology(
    technologyName: 'Cloud Computing',
    imageUrl:'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/future%20trends%2Fcloud.jpg?alt=media&token=8528fb76-13e8-450d-9b10-b1fd28b4dc7c',
    // 'https://drive.google.com/uc?export=download&id=1vjmaFK_RKSNfffajOugaXZ9K_CJABSDQ',
    websiteUrl: 'https://www.geeksforgeeks.org/cloud-computing/',
  ),
  Technology(
    technologyName: 'Blockchain',
    imageUrl:'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/future%20trends%2Fblockchain.jpg?alt=media&token=8abd1fda-0e3e-41ff-b458-8f5eeb82aba9',
    // 'https://drive.google.com/uc?export=download&id=1vjz2xw6hHpCE2kdYf_1Ms8s1hOIoDn0u',
    websiteUrl: 'https://www.geeksforgeeks.org/blockchain/',
  ),
  Technology(
    technologyName: 'RPA',
    imageUrl:'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/future%20trends%2Frpa.jpg?alt=media&token=9727b4dc-d540-4d3c-b516-d5f0868c6e1d',
    // 'https://drive.google.com/uc?export=download&id=1vk5_IMvPNyKcuQ2avAUkx_KxDtLPw8Rz',
    websiteUrl: 'https://www.geeksforgeeks.org/robotics-process-automation-an-introduction/',
  ),
  Technology(
    technologyName: 'Data Integration',
    imageUrl: 'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/future%20trends%2Fdata_integration.jpg?alt=media&token=56ec6810-c727-4d14-9ec6-66c6bce1b94f',
    // 'https://drive.google.com/uc?export=download&id=1vrhfRwSxK3SFExsB4OmTNoMSh87P_w0W',
    websiteUrl: 'https://www.geeksforgeeks.org/data-integration-in-data-mining/',
  ),
  Technology(
    technologyName: 'Big Data',
    imageUrl:'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/future%20trends%2Fbig_data.jpg?alt=media&token=5ebdb83b-c6be-43ef-845b-3506dcfc6d00',
    // 'https://drive.google.com/uc?export=download&id=1vuqR8IOlkl8J3SX95pNYtz9IoKKVYNHo',
    websiteUrl: 'https://www.geeksforgeeks.org/what-is-big-data/',
  ),
  Technology(
    technologyName: 'IoT',
    imageUrl: 'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/future%20trends%2Fiot.jpg?alt=media&token=a3443549-4fa4-40c2-b298-d9a71c32fb68',
    // 'https://drive.google.com/uc?export=download&id=1vw3IIMB7VQFB7f6TtFYQMho9DL9TxjoZ',
    websiteUrl: 'https://www.geeksforgeeks.org/introduction-to-internet-of-things-iot-set-1/',
  ),
];

final List<CodingWebsite> codingWebsites = [
  CodingWebsite(
    websiteName: 'LeetCode',
    imageUrl: 'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/coding_platforms%2Fleetcode.png?alt=media&token=684c4b7c-5fc4-495f-b298-e9d330f1f4d8',
        // 'https://drive.google.com/uc?export=download&id=1B6WI9nhDJ6-LicqMAvXwWRqjse_JtC1_',//'assets/coding_platform/leetcode.jpg',//'https://drive.google.com/uc?export=download&id=1aBQvJXymKtLPxgOzC57a_6ZT6Rj--I1X',
    websiteUrl: 'https://leetcode.com/',
  ),
  CodingWebsite(
    websiteName: 'GeeksforGeeks',
    imageUrl: 'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/coding_platforms%2Fgfg.jpg?alt=media&token=4653a339-5f32-4ac7-89e3-b6dc549f1faf',
    // 'https://drive.google.com/uc?export=download&id=1UWLEbclmQaOQ7pvfvVSIMSV5v11PfkDm',//'https://drive.google.com/uc?export=download&id=1CDQ1lq1NE6z7q5XL6eE5L-HUBRM2qCXz',
    websiteUrl: 'https://www.geeksforgeeks.org/',
  ),
  CodingWebsite(
    websiteName: 'Codechef',
    imageUrl: 'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/coding_platforms%2Fcodechef.png?alt=media&token=8644d45b-eaba-4113-9ff9-8613a6f298c5',
    //'https://drive.google.com/file/d/1bRTUctjx9e_eZ9oLtSOVdglGEIU8SkiX/view?usp=drive_link'
        // 'https://drive.google.com/uc?export=download&id=1bRTUctjx9e_eZ9oLtSOVdglGEIU8SkiX',//'assets/coding_platform/codechef.jpg',//'https://drive.google.com/uc?export=download&id=1C0C6PQl3QnWwHhF2XzZQZ3jqkTrNN0OM',

    websiteUrl: 'https://www.codechef.com/',
  ),
  CodingWebsite(
    websiteName: 'Hacker Rank',
    imageUrl: 'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/coding_platforms%2Fhackerrank.png?alt=media&token=67a08988-ba65-48f5-aac1-6eee7ddbd113',
    // 'https://drive.google.com/uc?export=download&id=12GEuHzlY63kiuWP15LpGIU_O3QLPl9NR',
    websiteUrl: 'https://www.hackerrank.com/',
  ),
  CodingWebsite(
    websiteName: 'HackerEarth',
    imageUrl: 'https://firebasestorage.googleapis.com/v0/b/harbour-39025.appspot.com/o/coding_platforms%2Fhackerearth.png?alt=media&token=8a674a66-feac-4c58-ac9f-502f01483b6a',
    // 'https://drive.google.com/uc?export=download&id=1Nvlx6p2jbdzrGo2lcq7kGvctRA9mWYXz', //'assets/coding_platform/hackerearth.jpg',
    websiteUrl: 'https://www.hackerearth.com/',
  ),
];

void main() {
  runApp(const MaterialApp(
    home: CodeNScope(),
  ));
}
