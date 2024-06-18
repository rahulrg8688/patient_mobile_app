import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:patient_application/ApiService/Api_service.dart';
import 'package:patient_application/Apicalls/Apis.dart';
import 'package:patient_application/ModelClass/PatientAuthenticate/patientauthenticate.dart';

class Passwordcontroller extends GetxController{
bool togglepassword=false;
  var mobileNumber='';
  int referenceId=0;
  int AccountId=0;
  TextEditingController passwordValue=TextEditingController();
final GetStorage storage=GetStorage();
  void SetMobileNumber(String mobile,int referenceId,int Account){
    mobileNumber=mobile;
    this.referenceId=referenceId;
    this.AccountId=Account;
  }

  void passwordChange()
  {
    togglepassword=!togglepassword;
    update();

  }

ApiService apiService=ApiService(baseUrl: Apis.baseUrl);
  PatientAuthenticate patient=PatientAuthenticate();

  Future<void> PasswordLogin() async{
    var response=await apiService.postRequest(Apis.LoginApi,{
      "accountId":AccountId,
      "accountTypes":["Patient"],
      "description":"samsung - SM-G990B2 - 14",
      "deviceId":"4a859f4ee15019d6",
      "deviceToken":"",
      "deviceType":"Android",
      "locationId":0,
      "password":passwordValue.text,
      "patientId":referenceId,
      "username":"1:${mobileNumber}"
    });
    if(response.statusCode==200){
    patient=PatientAuthenticate.fromJson(jsonDecode(response.body));
    print(patient.token!.split(' ')[1]);
    storage.write('JwtToken', patient.token!.split(' ')[1]);
    print(patient.referenceToken);
    storage.write('ReferenceToken', patient.referenceToken);
    Get.toNamed("/home");

    }
    else{
      Get.defaultDialog(
          title: ("Alert"),
          middleText: "${response.body}",

          onCancel: (){
            Get.to("/PhoneNumber");
          }
      );
      print("Response body : ${response.headers}");

      print("Response body : ${response.reasonPhrase}");
      print("Res: ${response.body}");

      update();
      print("Response error : ${response.statusCode}");
    }
  }


}