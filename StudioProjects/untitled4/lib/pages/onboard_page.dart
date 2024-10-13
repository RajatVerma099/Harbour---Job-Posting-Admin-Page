// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:harbour/pages/features/user_auth/presentation/pages/login_page.dart';
import 'package:harbour/tools/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global_constants.dart';
import '../datatypes/onboard_model.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = onBoardingScreens;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    // print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    // print(prefs.getInt('onBoard'));
  }

  Widget skipOnboardButton() {
    return TextButton(
      onPressed: () {
        _storeOnboardInfo();
        // jumpTo(const MyHomePage(title: "Welcome Seeker !!"), context);
        jumpTo(const LoginPage(), context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: ThemeData().primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          "Skip",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  FloatingActionButton buildPrevButton() {
    return FloatingActionButton(
      heroTag: "btn1",
      onPressed: () async {
        // print(currentIndex);
        if (currentIndex != 0) {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
          );
        }
      },
      backgroundColor: Colors.grey,
      mini: true,
      child: const Icon(Icons.arrow_left_rounded),
    );
  }

  FloatingActionButton buildNextButton() {
    return FloatingActionButton(
      heroTag: "btn2",
      onPressed: () async {
        // print(currentIndex);
        if (currentIndex == screens.length - 1) {
          await _storeOnboardInfo();
          jumpTo(const LoginPage(), context);
        }
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear,
        );
      },
      backgroundColor: Colors.grey,
      mini: true,
      child: const Icon(Icons.arrow_right_rounded),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          skipOnboardButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
          itemCount: screens.length,
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (_, index) {
            double xOffset =
                (index - currentIndex) * MediaQuery.of(context).size.width;
            return Transform.translate(
              offset: Offset(xOffset, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(screens[index].img),
                  Text(
                    screens[index].text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    screens[index].desc,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                    child: ListView.builder(
                      itemCount: screens.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              width: currentIndex == index ? 25 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color:
                                    currentIndex == index ? kbrown : kbrown300,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     buildPrevButton(),
      //     buildNextButton(),
      //   ],
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildPrevButton(),
            const SizedBox(
                width: 120), // Adjust spacing between buttons if needed
            buildNextButton(),
          ],
        ),
      ),
    );
  }
}
