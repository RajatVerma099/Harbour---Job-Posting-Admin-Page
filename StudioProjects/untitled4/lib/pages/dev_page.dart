import 'package:flutter/material.dart';

import '../tools/link_tools.dart';

class DevPage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String avatarLink;
  final String lifeMotto;
  final dynamic connectionLinks;
  final String sendOffQuote;
  const DevPage({
    super.key,
    required this.firstName,
    required this.lastName,
    this.avatarLink = '',
    this.lifeMotto = '',
    required this.connectionLinks,
    this.sendOffQuote = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ThemeData().primaryColor,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            Text(
              '$firstName $lastName',
              style: const TextStyle(
                fontFamily: 'DanceScript',
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5.0,
              width: 100.0,
              child: Divider(
                color: Colors.white70,
              ),
            ),
          ],
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 80.0,
                      backgroundImage: AssetImage(avatarLink),
                    ),
                    Text.rich(
                      TextSpan(
                        text: '"',
                        style: const TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 70.0,
                          color: Colors.white54,
                        ),
                        children: [
                          TextSpan(
                            text: lifeMotto,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          clickableIcon(
                            context: context,
                            icon: 'assets/img/gmail.png',
                            onTap: () => launchURL("mailto:${connectionLinks['email']}"),
                          ),
                          clickableIcon(
                            context: context,
                            icon: 'assets/img/linkedin.png',
                            onTap: () => launchURL("${connectionLinks['linkedin']}"),
                          ),
                          clickableIcon(
                            context: context,
                            icon: 'assets/img/github_.png',
                            onTap: () => launchURL("${connectionLinks['github']}"),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      sendOffQuote,
                      style: const TextStyle(
                        fontFamily: 'DancingScript',
                        fontSize: 25.0,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Stop scrolling!!!',
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 15.0,
                  color: Colors.white54,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget clickableIcon({
    required BuildContext context,
    required String icon,
    required VoidCallback onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.25, // Adjust the width as needed
          child: Image.asset(
            icon,
            width: 40,
            height: 40,
          ),
        ),
      );
}
