import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BuyUsACoffee extends StatelessWidget {
  const BuyUsACoffee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy us a coffee'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 15,
          color: Colors.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListTile(
                  title: Text(
                    'Donate to Harbour Team',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'By supporting us, you\'re fueling the journey of Harbour—a platform committed to providing free job links, helping individuals navigate their career seas. Your contribution ensures that we continue to empower and assist countless individuals in discovering new opportunities. Together, let\'s make a positive impact on careers and transform lives. Thank you for being a crucial part of the Harbour community!',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                ExpansionTile(
                  shape: const Border(),
                  title: const Text(
                    "Tap to get more details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  childrenPadding: const EdgeInsets.only(bottom: 10),
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img/bmc_qr.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          launchUrlString('https://www.buymeacoffee.com/rv5393982t');
                        },
                        child: const Text(
                          'Donate',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
