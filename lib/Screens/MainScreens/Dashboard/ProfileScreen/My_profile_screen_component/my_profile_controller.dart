import 'dart:ffi';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
///import 'package:get/get_connect/http/src/multipart/form_data.dart' as uuu;
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:patient_application/ApiService/Api_service.dart';
import 'package:patient_application/GetStorage/StorageService.dart';

import '../../../../../Apicalls/Apis.dart';
import '../../../../../GetStorage/HiveBox.dart';
import '../../../../../GetStorage/shared_prefs_service.dart';

class MyProfileController extends GetxController{
TextEditingController Firstname=TextEditingController();

TextEditingController Lastname=TextEditingController();
@override
void onInit(){
  super.onInit();

  print("In profile controller ${ApiService.getInstance(baseUrl: '').hashCode}");


}


Future<void> ButtonClick() async{
  final dioClient = dio.Dio();
  print("Text is ${Firstname.text}");
  print("Text is ${Lastname.text}");
  // var dioForm=dio.FormData.fromMap({
  //   'patientId':12364,
  //   'firstName':Firstname.text,
  //   'fullName':Lastname.text,
  //   'mobile':8309484204,
  //   'countryId':1,
  //   'IsMobile':true,
  // });

// final response=await dioClient.post(
//     'https://uat.careaxes.net/uat-qa-api/api/patients/update',
//     data:dioForm,
//     options: Options(
//     headers: {
//       'Authorization':'Bearer ${HiveBox().getToken()}',
//     }
// )
// );
// if(response.statusCode==200){
//   print("Updated the profile");
//   Get.toNamed('/home');
// }
// else{
//   print("Error occunred");
//   print("response code is :: ${response.statusCode}");
//   print("response error is :: ${response.data}");
//   print("repnse error is :: > ${response.headers}");
//   print("response phrase ${response.toString()}");
// }
  final formData={
    'patientId':12364,
    'firstName':Firstname.text,
    'fullName':Lastname.text,
    'mobile':8309484204,
    'countryId':1,
    'IsMobile':true,


  };
//   var res=await
  var response=await  ApiService.getInstance(baseUrl:Apis.baseUrl).PostFormData(Apis.ProfileUpdateApi,formData);
 if(response.statusCode==200){
   print("success ${response.data}");
   Get.toNamed('/home');
}
 else{
   print("Failure ${response.statusCode}");
   print("Fialure ${response.data}");
 print("Failure ${response.statusMessage}");
 }
}

}