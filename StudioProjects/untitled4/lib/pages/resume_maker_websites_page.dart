import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WebsitePage extends StatelessWidget {
  final List<String> websiteNames = [
    'Zety',
    'Resume.com',
    'Canva',
    'Novo Resume',
    'Visual CV',
    'Resume Genius',
    'Kick Resume',
    'Resume Builder',
    'cv maker',
    'ResumeMaker',
  ];

  final List<String> websiteUrls = [
    'https://zety.com/resume-builder',
    'https://www.resume.com/',
    'https://www.canva.com/en_gb/',
    'https://novoresume.com/',
    'https://www.visualcv.com/',
    'https://resumegenius.com/',
    'https://www.kickresume.com/en/',
    'https://www.resumebuilder.com/',
    'https://cvmkr.com/',
    'https://www.resume-now.com/',
  ];

  final List<String> iconUrls = [
  'https://drive.google.com/uc?export=download&id=1n01lKqPcvjSZ7WfktZs3V4NgjMplEWg2', //zety
  'https://drive.google.com/uc?export=download&id=16A5gKq6yE37fx9jJHPfr1-mEPUjqgJ2B', //resumedotcom.png
  'https://drive.google.com/uc?export=download&id=12IqHZQUJuNUgCY3UP0KbT79aC4sLfXeE', //canva.png
  'https://drive.google.com/uc?export=download&id=1QkHcc96AWxLQU4_mOi7ywdPGvLXCiXbr', //novoresume.png
  'https://drive.google.com/uc?export=download&id=1oHYxDEeKwFbehbOm8UDSAy7bKaqZW8nn', //visualcv
  'https://drive.google.com/uc?export=download&id=1UIq5cyVJ_G6wbe42AoI8ogPyKFGOr_Yz', //resumegenius.png
  'https://drive.google.com/uc?export=download&id=15dqsdMDGIOgq0VMtZw8wGWRV2mJKzWRy', //kickresume.png
  'https://drive.google.com/uc?export=download&id=1jWDHFrgauj2GY7lwRYIWDzWGKs-454KA',//resumebuilder.png
  'https://drive.google.com/uc?export=download&id=1WZc6dVmyAbXx-rxOaHcbjYfCPddMX-f1', //cvmaker.png
  'https://drive.google.com/uc?export=download&id=1A_MKIf1UBdO8UUIya1lJGaGerKuhftDP' //resumemaker.png
  ];

  WebsitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Select Resume Builder Site'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: websiteNames.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => _launchWebsite(websiteUrls[index]),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0), // More curved edges
              ),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: iconUrls[index], // Network image
                    width: 80.0, // Larger icon size
                    height: 80.0,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  const SizedBox(height: 12.0), // Increased spacing
                  Text(
                    websiteNames[index],
                    style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _launchWebsite(String url) async {
    await launchUrlString(url);
  }
}

void main() {
  runApp(MaterialApp(
    home: WebsitePage(),
  ));
}
