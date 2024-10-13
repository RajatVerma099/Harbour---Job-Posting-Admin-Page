import 'package:flutter/material.dart';
import 'package:harbour/tools/navigation.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../pages/features/user_auth/presentation/pages/login_page.dart';
import '../pages/technologies_page.dart';
import '../pages/dev_page.dart';
import '../pages/support_us.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final padding = const EdgeInsets.symmetric(horizontal: 10);
  bool _isDevSectionExpanded = false; // State variable for collapsible section



  Widget intro() {
    return Card(
      elevation: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      // color: Colors.grey[900],
      color:Colors.transparent,
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Container(
        padding: padding.add(const EdgeInsets.symmetric(vertical: 20)),
        child: const Center(
          child: Text(
            'Hello, Harbour Explorers! \n🚀 Thank you for choosing Harbour! \n💼 We’ve deployed web scrapers to bring job opportunities to your fingertips. \n🔍 Job postings are color-coded—green for recent—making it easy to stay updated. \n\nIf you enjoy our app, please share it and help others navigate their careers! \n\nCheers, \n-Devs',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader({
    required String name,
    required String email,
    required VoidCallback onClicked,
    required String imageUrl,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Card(
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: Colors.grey[900],
          child: Container(
            padding: padding.add(const EdgeInsets.symmetric(vertical: 20)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  // "https://www.pngitem.com/middle/miixTR_avatar-generic-avatar-hd-png-download/"
                  backgroundImage: NetworkImage(
                      imageUrl ==""? 'https://images.squarespace-cdn.com/content/63ceb956398d353c2212163b/d346adc6-b0ad-42bc-a1f2-dc4ef0cf0f88/No_Profile.png?content-type=image%2Fpng':imageUrl,
                  ),
                  ),

                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: const TextStyle(fontSize: 9, color: Colors.white),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      );

  List<Widget> meetTheDevs(BuildContext context) {
    const imageUrl1 =
        'https://lh3.googleusercontent.com/a/ACg8ocIVcgin3A99fK8VigTnG8GCnRSZDduL6ZLobV_wZtCTY4Q=s96-c';
    const imageUrl2 =
        'https://lh3.googleusercontent.com/a/ACg8ocLN7LNv35v37V7BQKYKTCyvfCgKoi1n5iRi65sH80DHotc=s96-c';

    return [
      buildHeader(
        imageUrl: imageUrl1,
        name: 'Mudit Garg',
        email: 'muditgarg48@gmail.com',
        onClicked: () => goTo(
          const DevPage(
            firstName: 'Mudit',
            lastName: 'Garg',
            avatarLink: 'assets/img/mg.jpg',
            lifeMotto: 'Hope for the best, prepare for the worst !',
            connectionLinks: {
              'email': 'gargmu@tcd.ie',
              'linkedin': 'https://www.linkedin.com/in/muditgarg48/',
              'github': 'https://github.com/muditgarg48',
            },
            sendOffQuote: 'Adios Amigo!',
          ),
          context,
        ),
      ),
      buildHeader(
        imageUrl: imageUrl2,
        name: 'Rajat Verma',
        email: 'rv5393982@gmail.com',
        onClicked: () => goTo(
          const DevPage(
            firstName: 'Rajat',
            lastName: 'Verma',
            avatarLink: 'assets/img/rv.jpg',
            lifeMotto: 'Even the simplest strokes of effort, is enough to change the hue of our results.',
            connectionLinks: {
              'email': 'lostpoet099@gmail.com',
              'linkedin': 'https://www.linkedin.com/in/rajat-verma-321336224/',
              'github': 'https://github.com/RajatVerma099',
            },
            sendOffQuote: 'Feel free to connect :)',
          ),
          context,
        ),
      ),
    ];
  }

  Widget buildCollapsibleSection(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text(
            'Meet the Devs',
            style: TextStyle(color: Colors.white),
          ),
          trailing: Icon(
            _isDevSectionExpanded ? Icons.expand_less : Icons.expand_more,
            color: Colors.white,
          ),
          onTap: () {
            setState(() {
              _isDevSectionExpanded = !_isDevSectionExpanded; // Toggle state
            });
          },
        ),
        if (_isDevSectionExpanded) ...[
          ...meetTheDevs(context), // Conditional rendering
          // const Divider(color: Colors.white), // Divider for the dev section
        ],
      ],
    );
  }

  Widget buildSupportButton(BuildContext context) {

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const BuyUsACoffee()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[900],
        ),
        icon: const Icon(Icons.favorite, color: Colors.white),
        label: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text(
              'Support Us :)',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget techUsedButton(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const TechnologiesPage()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[900],
        ),
        icon: const Icon(Icons.build, color: Colors.white),
        label: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text(
              'Tech Used',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget checkForUpdatesButton(BuildContext context) {
    const updatesUrl = 'https://rajatverma099.github.io/harbour_website/';

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton.icon(
        onPressed: () async {
          if (await canLaunchUrlString(updatesUrl)) {
            await launchUrlString(updatesUrl);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Could not launch the updates URL.'),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[900],
        ),
        icon: const Icon(Icons.update, color: Colors.white),
        label: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text(
              'Check for Updates',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget feedbackButton(BuildContext context) {
    const feedbackUrl = 'https://forms.gle/crw2cSPjd9sp8dz7A';

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton.icon(
        onPressed: () async {
          if (await canLaunchUrlString(feedbackUrl)) {
            await launchUrlString(feedbackUrl);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Could not launch the feedback URL.'),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[900],
        ),
        icon: const Icon(Icons.feedback, color: Colors.white),
        label: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text(
              'Give Feedback',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLogoutButton(BuildContext context) {
    return Container(
      width: 5,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton.icon(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
                (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
        ),
        icon: const Icon(Icons.logout, color: Colors.white),
        label: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: Container(
        color: Colors.grey[850],
        child: Column(
          children: [
            const SizedBox(height: 40),
            user != null
                ? buildHeader(
              name: user.displayName ?? 'User',
              email: user.email ?? 'Email',
              onClicked: () {},
              imageUrl: user.photoURL ?? '',
            )
                : const Center(child: CircularProgressIndicator()),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: padding,
                children: [
                  intro(),
                  const Divider(color: Colors.white),
                  buildCollapsibleSection(context), // Collapsible section
                  const Divider(color: Colors.white), // Divider for the dev section
                  buildSupportButton(context),
                  const SizedBox(height: 10),
                  techUsedButton(context),
                  const SizedBox(height: 10),
                  checkForUpdatesButton(context),
                  const SizedBox(height: 10),
                  feedbackButton(context),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.white), // Divider for the dev section
                  buildLogoutButton(context),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
