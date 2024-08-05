import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:patient_application/ApiService/Api_service.dart';
import 'package:patient_application/Apicalls/Apis.dart';
import 'package:patient_application/ModelClass/PatientAuthenticate/patientauthenticate.dart';

import '../../../GetStorage/HiveBox.dart';
import '../../../GetStorage/StorageService.dart';


class Passwordcontroller extends GetxController{
bool togglepassword=false;
  var mobileNumber='';
  int referenceId=0;
  int AccountId=0;
  bool IsTapped=false;
  bool GotResult=false;
  TextEditingController passwordValue=TextEditingController();
final GetStorage storage=GetStorage();
  void SetMobileNumber(String mobile,int referenceId,int Account){
    mobileNumber=mobile;
    this.referenceId=referenceId;
    this.AccountId=Account;
  }
@override
  void dispose() {
    // TODO: implement dispose
  passwordValue.dispose();
    super.dispose();
    togglepassword=false;
    mobileNumber='';
     referenceId=0;
     AccountId=0;
     IsTapped=false;
     GotResult=false;
  }
void  resetStates(){
   togglepassword=false;
   mobileNumber='';
   passwordValue.clear();
   IsTapped=false;
   GotResult=false;
  update();
}

  void passwordChange()
  {
    togglepassword=!togglepassword;
    update();

  }

  void IsTappedChange(){
    IsTapped=true;
    update();
  }


ApiService apiService=ApiService.getInstance(baseUrl: Apis.baseUrl);
  PatientAuthenticate patient=PatientAuthenticate();

  Future<void> PasswordLogin() async{
    print("patinetId $referenceId");
    print("Device token from password login screen is  ::: ${HiveBox().GetDeviceToken()}");
    var response=await apiService.postRequest(Apis.LoginApi,{
      "accountId":AccountId,
      "accountTypes":["Patient"],
      "description":"samsung - SM-G990B2 - 14",
      "deviceId":"4a859f4ee15019d6",
      "deviceToken":HiveBox().GetDeviceToken(),
      "deviceType":"Android",
      "locationId":0,
      "password":passwordValue.text,
      "patientId":referenceId,
      "username":"1:${mobileNumber}"
    });
    if(response.statusCode==200){
      GotResult=true;
    patient=PatientAuthenticate.fromJson(jsonDecode(response.body));
    print("patient session is :: ${patient.sessionId}");
    print(patient.token!.split(' ')[1]);

     await HiveBox().StoreToken(patient.token!.split(' ')[1]);
      print("Hive token is :: ${HiveBox().getToken()}");
    print("patient token is :: ${patient.token}");

    print(patient.referenceToken);
    await HiveBox().StoreReferenceToken(patient.referenceToken);
    //storage.write('ReferenceToken', patient.referenceToken);
      resetStates();
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