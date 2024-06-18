import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:patient_application/ApiService/Api_service.dart';
import 'package:patient_application/Screens/phonenumberScreen/PasswordLogin/PasswordController.dart';
import 'package:patient_application/Screens/phonenumberScreen/PhoneNumber/phonenumber.dart';
import 'package:patient_application/Screens/phonenumberScreen/VerifyOtp/VerifyOtpController.dart';

import '../../../Apicalls/Apis.dart';

import '../../../ModelClass/CheckUserList/checkUser.dart';
import '../../../ModelClass/OtpModel/Otp.dart';
import '../VerifyOtp/VerifyOtpScreen.dart';

class Phonenumbercontroller extends GetxController{
  bool GotResult=false;

  var ResponseErrormsg='';
  var otp='';
  int countryId=0;
  int accountId=0;
  int referenceId=0;
  bool IsLoading=false;
  TextEditingController phoneNumber=TextEditingController();

  ApiService apiService=ApiService(baseUrl:Apis.baseUrl );

  Future<void> MobileNumber() async{
    IsLoading=true;
    update();
   var response=await apiService.putRequest(Apis.CheckUserApi,{
      "userName": "1:${phoneNumber.text}",
      "password" : "",
      "accountTypes" : ["Patient"],
      "deviceToken" :"",
      "deviceId":"",
      "description":"quick registration",
      "patientId":0,
      "accountId":0
    });
   if(response.statusCode==200){
     var res=checkUserList.fromJson(jsonDecode(response.body));
     print(IsLoading);
     print(res.item1![0].accountId);
     IsLoading=false;
         GotResult=true;
         if(res.item1!=null) {
           countryId = res.item1![0].countryId ?? 0;
           referenceId = res.item1![0].referenceId ?? 0;
           accountId = res.item1![0].accountId ?? 0;
           update();
         }
   }
   else{
     print(response.statusCode);
     print(response.reasonPhrase);
     throw Exception("Some thing went wrong");
   }

  }


  Future<void> SendOtp() async{
    var response=await apiService.postRequest(Apis.sendOtpApi,{
      "Username": "1:${phoneNumber.text}",
      "AccountTypes" : ["Patient"],
      "deviceToken" : "",
      "deviceId": "2",
      "deviceType":"IOS",
      "patientId":(referenceId),
      "accountId":(accountId),
      "CountryId":(countryId)
    });
    if(response.statusCode==200){
      var res=Otp.fromJson(jsonDecode(response.body));
      Verifyotpcontroller verifyotpcontroller=Get.put(Verifyotpcontroller());
      verifyotpcontroller.Setotp(res.otp??"");
      Get.toNamed("/VerifyOtp");
    }
    else{
      Get.defaultDialog(
          title: ("Alert"),
          middleText: "${response.body}",

          onCancel: (){
            Get.to(phonenumber());
          }
      );
      print("Response body : ${response.headers}");

      print("Response body : ${response.reasonPhrase}");
      print("Res: ${response.body}");
      ResponseErrormsg=response.body;
      update();
      print("Response error : ${response.statusCode}");
    }
  }


  Future<void> LoginWithPassword() async{
    Passwordcontroller password=Get.put(Passwordcontroller());
    password.SetMobileNumber(phoneNumber.text,referenceId,accountId);
      Get.toNamed("/passwordLogin");

  }
}
