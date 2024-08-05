import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:patient_application/GetStorage/HiveBox.dart';
import 'package:patient_application/GetStorage/StorageService.dart';
import 'package:patient_application/Jitse/call_service.dart';
import 'package:patient_application/Screens/MainScreens/dashboard_screens/dashboard.dart';
import 'package:patient_application/Screens/SplashScreens/SpalshScreen3.dart';
import 'package:patient_application/Screens/SplashScreens/SplashScreen1.dart';
import 'package:patient_application/Screens/SplashScreens/SplashScreen2.dart';

import '../../Jitse/navigation_service.dart';
import '../phonenumberScreen/PhoneNumber/phonenumber.dart';

class Mainsplashscreen extends StatefulWidget {
   Mainsplashscreen({super.key});

  @override
  State<Mainsplashscreen> createState() => _MainsplashscreenState();
}

class _MainsplashscreenState extends State<Mainsplashscreen> {
  late PageController _pageController= PageController();
  void checkTokenAndNavigate() async {
    CallService().getDeviceToken().then((value) {
      print("Token value is :: $value");
      HiveBox().StoreDeviceToken(value);
    });

    String? hiveToken = HiveBox().getToken();
    print("Token from spalsh HiveBox is ::: $hiveToken");

    // Delay for splash screen animations or any other purpose
    // await Future.delayed(Duration(seconds: 0));
    //
    // if (hiveToken != null) {
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: (ctx) => Dashboard()));
    //
    // } else {
    //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctr)=>phonenumber()),(route)=>false);
    // //  NavigationService.instance.pushNamedAndRemoveUntil('/home', (route) => false);
    // }
  }
  void initState() {
    super.initState();
    CallService().getDeviceToken().then((value){
      print("Token value is :: $value");
      HiveBox().StoreDeviceToken(value);
      _pageController = PageController(initialPage: 0);
      checkTokenAndNavigate();
    });
    print("TOken  from Hivebox is ::: ${HiveBox().getToken()}");



  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds:  2)), // Delay by 2 seconds
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
              isDismissible: false, // Prevent dismissing by tapping outside
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
