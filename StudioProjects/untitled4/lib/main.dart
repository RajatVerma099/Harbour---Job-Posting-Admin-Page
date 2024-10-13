import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:harbour/firebase/firebase_options.dart';
import 'package:harbour/pages/features/user_auth/presentation/pages/login_page.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/onboard_page.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,  // Lock to portrait
  //   DeviceOrientation.portraitDown,
  // ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  OneSignal.initialize("56c94a7a-618b-41d6-8db3-955968baf359");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harbour',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/img/infinity.gif', fit: BoxFit.cover),
        splashIconSize: 200,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.black,
        duration: 2000,
        nextScreen: const MyAppScreen(),
      ),
      // routes: {
      //   '/home': (context) => MyHomePage(),
      //   // '/login': (context) => LoginPage(),
      //   // '/signup': (context) => SignUpPage(),
      //   // '/home': (context) => HomePage(),
      // },
    );

  }
}

class MyAppScreen extends StatefulWidget {
  const MyAppScreen({super.key});

  @override
  State<MyAppScreen> createState() => _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen> {
  int? isViewed;

  @override
  void initState() {
    super.initState();
    checkOnBoardStatus();
  }

  Future<void> checkOnBoardStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isViewed = prefs.getInt('onBoard');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harbour',
      home: isViewed != 0 ? const OnBoard() : const LoginPage(),
    );
  }
}