import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:patient_application/ApiService/Api_service.dart';
import 'package:patient_application/GetStorage/StorageService.dart';
import 'package:patient_application/GetStorage/shared_prefs_service.dart';

import '../../../../../Apicalls/Apis.dart';

class ChangePasswordController extends GetxController{
TextEditingController password1=TextEditingController();
ApiService apiService=ApiService.getInstance(baseUrl: Apis.baseUrl);
TextEditingController password2=TextEditingController();
String ErrMsg="";
String SuccessMsg="";


Future<void> changePasswordApi()async {
  print(password2.text);
  // print(StorageService.GetPatientAccountId());
  // print(StorageService.GetPatientMobileNo());
  if (password1.text == password2.text) {
    var response=await apiService.putRequest(Apis.ChangePasswordApi,{
"accountId":SharedPrefsService().GetAccountIdForPatient(),
      "password":password2.text,"roleId":4,
      "userName":SharedPrefsService().GetMobileNumberForPatient(),
  });
    if(response.statusCode==200){
      SuccessMsg=response.body;
      print("success");
      Get.toNamed("/PhoneNumber");
    }
    else{
      ErrMsg=response.body;
      print("Failed");
    }
}
  else{
    ErrMsg="password 1 and password 2 didnot match";
  }
}
}