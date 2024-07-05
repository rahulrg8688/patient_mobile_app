import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_application/Screens/phonenumberScreen/PhoneNumber/PhoneNumberController.dart';

//import '../../MainScreens/HomeScreen/hme.dart';
import 'VerifiedPopup.dart';

class Verifyotpcontroller extends GetxController{
var otp=''.obs;
var Otpuser=''.obs;
var isLoading=false;
var OtpErr=''.obs;
  Phonenumbercontroller phonenumbercontroller=Get.put(Phonenumbercontroller());
  TextEditingController Otp1=TextEditingController();
  TextEditingController Otp2=TextEditingController();
  TextEditingController Otp3=TextEditingController();
  TextEditingController Otp4=TextEditingController();
String ConvertOtp(){
  Otpuser.value=Otp1.text.toString()+Otp2.text.toString()+Otp3.text.toString()+Otp4.text.toString();
  return Otpuser.value;
}

  void Setotp(String Otp){
      otp.value=Otp;
  }

  void CompareOtp(){

    isLoading=true;
    update();
  String UserOtp=ConvertOtp();
  if(UserOtp==otp.value){

        Timer(Duration(seconds: 2),()async{
          isLoading=false;
          update();
         await Get.defaultDialog(
          title:'',
           content: Column(
             children: [
               Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8),
                   color: Color(0xFFFFFFFF),
                   boxShadow: [
                     BoxShadow(
                       color: Color(0x0F121212),
                       offset: Offset(0, 4),
                       blurRadius: 13,
                     ),
                   ],
                 ),
                 child: Container(
                   padding: EdgeInsets.fromLTRB(0, 132, 0, 133),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Container(
                         margin: EdgeInsets.fromLTRB(1, 0, 0, 18),
                         child: Container(
                           decoration: BoxDecoration(
                             image: DecorationImage(
                               fit: BoxFit.cover,
                               image: NetworkImage(
                                 'assets/images/httpslottiefiles_comanimationsverified_oearu_zpcqq_1.gif',
                               ),
                             ),
                           ),
                           child: Container(
                             width: 110,
                             height: 110,
                           ),
                         ),
                       ),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Container(
                             margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
                             child: Text(
                               'Verfied!!',
                               style: TextStyle(
                                 fontFamily: 'Poppins',
                                 fontWeight: FontWeight.w500,
                                 fontSize: 18,
                                 color: Color(0xFF000000),
                               ),
                             ),
                           ),
                           Text(
                             'Hurry! You have successfully verfied your mobile number',
                             textAlign: TextAlign.center,
                             style: TextStyle(
                               fontFamily: 'Poppins',
                               fontWeight: FontWeight.w400,
                               fontSize: 14,
                               color: Color(0xFFB5B5B5),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
               )
             ],
           ),

         );
         Timer(Duration(seconds: 1),(){
           Get.toNamed("/home");
         });
        });


  }
  else{
    isLoading=false;
    update();
    OtpErr.value="Wrong verification code";
  }
  }

  Future<void> SendOtp() async{
    phonenumbercontroller.SendOtp();
  }
  @override
  void onInit() {
  Time();
  update();
  // TODO: implement onInit
    super.onInit();
  }
int duration=180;
late Timer timer;
  Future<void> Time() async{
  const onesec=Duration(seconds: 1);
  timer=Timer.periodic(onesec, (Timer time){
    if(duration==0){
      time.cancel();
    }
    else{
      duration--;
      update();
    }
  });
  }
  String get timerText{
    int minutes=duration ~/60;
    int seconds=duration%60;

    "${minutes}:${seconds.toString().length==1?"0${seconds.toString()}":seconds.toString()}";
    return "${minutes}:${seconds.toString()}";
  }

}