import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:patient_application/Screens/phonenumberScreen/VerifyOtp/VerifyOtpScreen.dart';
class Otpcontroller extends GetxController{
  TextEditingController phoneNumber=TextEditingController();
  final dio=Dio();
  var mobilenumber=''.obs;
Future<void> GetOtp() async{
print("phone number is : ${phoneNumber.text}");
print("function started");
  var response=await http.put(Uri.parse("https://uat.careaxes.net/uat-qa-api/api/patients/check-user-list"),
    headers: {'Content-Type': 'application/json'},
    body:jsonEncode({
      "userName": "1:${phoneNumber.text}",
      "password" : "",
      "accountTypes" : ["Patient"],
      "deviceToken" :"",
      "deviceId":"",
      "description":"quick registration",
      "patientId":0,
      "accountId":0
    }),
  );
  if(response.statusCode==200){
    print(response.body);
    Get.to(Verifyotpscreen());
  }
  else{
    print("Response body : ${response.headers}");

    print("Response body : ${response.reasonPhrase}");
    print("Res: ${response.body}");
    print("Response error : ${response.statusCode}");
  }
}

}