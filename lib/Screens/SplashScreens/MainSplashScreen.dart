import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:patient_application/Screens/SplashScreens/SpalshScreen3.dart';
import 'package:patient_application/Screens/SplashScreens/SplashScreen1.dart';
import 'package:patient_application/Screens/SplashScreens/SplashScreen2.dart';

class Mainsplashscreen extends StatefulWidget {
   Mainsplashscreen({super.key});

  @override
  State<Mainsplashscreen> createState() => _MainsplashscreenState();
}

class _MainsplashscreenState extends State<Mainsplashscreen> {
  late PageController _pageController= PageController();

  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2)), // Delay by 2 seconds
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator or splash screen content
          return Center(
            child: CircularProgressIndicator(), // Or any other loading indicator
          );
        } else {
          // Show the modal bottom sheet after the delay
          WidgetsBinding.instance!.addPostFrameCallback((_) {

            showModalBottomSheet(
              context: context,
              //isDismissible: false, // Prevent dismissing by tapping outside
              enableDrag: false,
              builder: (BuildContext context) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Colors.white,
                    ),
                      child: PageView(
                        controller: _pageController,
                        children: [
                          Splashscreen1(pageController: _pageController),
                          Splashscreen2(pageController2: _pageController),
                          SplashScreen3(pageController3: _pageController),
                        ],
                      ),
                  ),
                );
              },
            );
          });

          // Return an empty container while waiting for the bottom sheet to close
          return Scaffold(

              body: Container(
                color:Color(0xFF5E55EA),

                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Image.asset('assets/DoctorImages/SplashScreenImage.png'),
                ),
              ),
          );
        }
      },
    );


  }
}
