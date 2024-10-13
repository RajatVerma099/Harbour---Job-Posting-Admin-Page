
import 'package:url_launcher/url_launcher_string.dart';

launchURL(String url) async {
    try {
      await launchUrlString(url);
    } catch (e) {
      // print("Error launching Link: $e");
    }
  }