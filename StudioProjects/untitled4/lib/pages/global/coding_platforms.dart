
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher_string.dart';


class CodingPlatforms extends StatefulWidget {
  const CodingPlatforms({super.key});

  @override
  _TechnologiesPageState createState() => _TechnologiesPageState();
}

class _TechnologiesPageState extends State<CodingPlatforms> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start DSA Today '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TechnologiesList(
              onIndexChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              onCardTapped: (index) {
                _launchWebsite(technologies[index].websiteUrl);
              },
            ),
            const SizedBox(height: 46),
            PageIndicator(currentIndex: _currentIndex),
          ],
        ),
      ),
    );
  }

  void _launchWebsite(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class TechnologiesList extends StatefulWidget {
  final ValueChanged<int> onIndexChanged;
  final ValueChanged<int> onCardTapped;

  const TechnologiesList({super.key, required this.onIndexChanged, required this.onCardTapped});

  @override
  State<TechnologiesList> createState() => _TechnologiesListState();
}

class _TechnologiesListState extends State<TechnologiesList> {
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: _carouselController,
      itemCount: technologies.length,
      options: CarouselOptions(
        enableInfiniteScroll: false,
        viewportFraction: 0.5,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          widget.onIndexChanged(index);
        },
      ),
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap: () {
            widget.onCardTapped(index);
          },
          child: Center(
            child: TechnologyCard(
              technology: technologies[index],
            ),
          ),
        );
      },
    );
  }
}

class TechnologyCard extends StatelessWidget {
  final Technology technology;

  const TechnologyCard({super.key, 
    required this.technology,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      shadowColor: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.9,
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
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int currentIndex;

  const PageIndicator({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        technologies.length,
            (index) => Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(
              index == currentIndex ? 1.0 : 0.4,
            ),
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

final List<Technology> technologies = [
  Technology(
    technologyName: 'Geeks For Geeks',
    imageUrl: 'assets/coding_platform/gfg.jpg',
    websiteUrl: 'https://www.geeksforgeeks.org/',
  ),
Technology(
technologyName: 'CodeChef',
imageUrl: 'assets/coding_platform/codechef.jpg',
websiteUrl: 'https://www.codechef.com/',
),
Technology(
technologyName: 'HackerEarth',
imageUrl: 'assets/coding_platform/hackerearth.jpg',
websiteUrl: 'https://www.hackerearth.com/',
),
Technology(
technologyName: 'HackerRank',
imageUrl: 'assets/coding_platform/hackerrank.jpg',
websiteUrl: 'https://www.hackerrank.com/',
),
  Technology(
    technologyName: 'LeetCode',
    imageUrl: 'assets/coding_platform/leetcode.jpg',
    websiteUrl: 'https://www.hackerrank.com/',
  )
];