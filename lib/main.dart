import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:patient_application/Screens/MainScreens/HomeScreen/hme.dart';
import 'package:patient_application/Screens/SplashScreens/MainSplashScreen.dart';
import 'package:patient_application/Screens/phonenumberScreen/PasswordLogin/Password.dart';
import 'package:patient_application/Screens/phonenumberScreen/VerifyOtp/VerifyOtpScreen.dart';

import 'Screens/Overrides.dart';
import 'Screens/SplashScreens/SplashScreen1.dart';
import 'Screens/phonenumberScreen/PhoneNumber/phonenumber.dart';

void main() async{
  HttpOverrides.global = MyHttpOverrides();
  final context = SecurityContext.defaultContext;
  context.allowLegacyUnsafeRenegotiation = true;
  final httpClient = HttpClient(context: context);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Patient Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
initialRoute: '/',
      getPages: [
      GetPage(name: "/", page:()=>Mainsplashscreen()),
      GetPage(name: "/PhoneNumber", page:()=>phonenumber()),
        GetPage(name: "/VerifyOtp", page:()=>Verifyotpscreen()),
        GetPage(name: "/passwordLogin", page:()=>Password()),
        GetPage(name: "/home", page:()=>HomeScreen()),


      ],

      home: Mainsplashscreen(),
    );
  }
}

