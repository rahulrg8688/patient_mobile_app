import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_application/GetStorage/HiveBox.dart';
import 'package:patient_application/GetStorage/StorageService.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../ApiService/Api_service.dart';
import '../../../../Apicalls/Apis.dart';


class ProfileController extends GetxController{

  ApiService apiService=ApiService.getInstance(baseUrl: Apis.baseUrl);

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();


  }
List MyRecordsList=[
  {
  'IconData':Icon(Icons.heart_broken_outlined),
    'Text':Text("My Appointments")
  },
  {
    'IconData':Icon(Icons.note_sharp),
    'Text':Text("My Prescriptions")
  },
  {
    'IconData':Icon(Icons.filter_alt_outlined),
    'Text':Text("Health Documents")
  },
  {
    'IconData':Icon(Icons.medication_outlined),
    'Text':Text("Lab Reports")
  }
];
List MyInvoiceList=[
  {
    'IconData':Icon(Icons.barcode_reader),
    'Text':Text("Scan Invoice")
  },
  {
    'IconData':Icon(Icons.science),
    'Text':Text("Lab Invoice")
  },
  {
    'IconData':Icon(Icons.vaccines),
    'Text':Text("Pharma Invoice")
  }
];
List GeneralList=[
  {
    'IconData':Icon(Icons.phone_enabled),
    'Text':Text("Call Us")
  },
  {
    'IconData':Icon(Icons.live_help),
    'Text':Text("Help & Support")
  },
  {
    'IconData':Icon(Icons.enhanced_encryption),
    'Text':Text("Change password")
  },
  {
    'IconData':Icon(Icons.add_box),
    'Text':Text("Admissions")
  },
  {
    'IconData':Icon(Icons.language),
    'Text':Text("Language")
  },
  {
    'IconData':Icon(Icons.web),
    'Text':Text("Queue")
  },
  {
    'IconData':Icon(Icons.person),
    'Text':Text("My profile")
  },
];
List AccountList=[
  {
    'IconData':Icon(Icons.account_circle),
    'Text':Text("Close Account")
  },
  {
    'IconData':Icon(Icons.logout),
    'Text':Text("logout")
  }
];
var MyAccountListIndex=0;
void MyAccountListSetIndex(int val){
  MyAccountListIndex=val;
  print("My Account index is : ${MyAccountListIndex}");
  update();
  switch(MyAccountListIndex) {
    case 0:
      {
        print("close acccount");
      }
    case 1:
      {

        print("Logout");
        Logoutuser();
      }
  }
    update();

}
var MyRecordsListIndex=0;
void MyRecordsListSetIndex(int val){
  MyRecordsListIndex=val;
  print("My invoice index is : ${MyRecordsListIndex}");
  update();
  switch(MyRecordsListIndex){
    case 0:{
      print("My Appointments");
      Get.toNamed('/MyAppointments');
    }
    case 1:{
      print("My prescriptions");
      Get.toNamed('/MyPrescriptions');

    }
    case 2:{
      print("Health Docyments");
    }
    case 3:{
      print("Lab reports");
      Get.toNamed('/LabReports');
    }
  }
}
var MyInvoicesListIndex=0;
void MyInvoiceListSetIndex(int val){

  MyInvoicesListIndex=val;
  print("My invoice index is : ${MyInvoicesListIndex}");
  print("the value is ${MyInvoiceList[MyInvoicesListIndex]}");
  update();
  switch(MyInvoicesListIndex){
    case 0:
      {
        print("Scan Invoice");
        Get.toNamed("/ScanInvoiceScreen");
      }
      break;
    case 1:
      {
        print("Lab Invoice");
        Get.toNamed("/LabInvoiceReport");
      }
      break;
    case 2:
      {
        print("Pharma Invoice");
        Get.toNamed("PharmaInvoiceScreen");
      }
      break;
  }
}
Future<void> launchUrl(String phoneNumber) async{
  final String url = 'tel:$phoneNumber';
  try{

    if(await canLaunch(url)) {
      await launch(url);
    }
      else{
     throw 'could not launch $url';
      }
    }

      catch(e){
    print(e.toString());
      }
}
int GeneralListIndex=0;
void MyGeneralListSetIndex(int val){
  GeneralListIndex=val;
  print("General Index is ${GeneralListIndex}");
  switch(GeneralListIndex){
    case 0:{
    launchUrl(('8886600888'));
    }
    break;
    case 1:{

    }
    break;
    case 2:{
      print("CHnage password");
      Get.toNamed('/ChangePassword');
    }
    break;
    case 3:{
      print("Admissoios");
      Get.toNamed("/PatientAdmissions");
    }
    break;
    case 6:{
      print("My profile updates");
      Get.toNamed('/MyprofileUpdate');
    }
  }

 update();

  }

  Future<void> Logoutuser() async{

  var customHeaders={
    'LocationId':'2'
  };
  var requestBody={
    "accountId":13392,"deviceType":"Android","deviceId":"4a859f4ee15019d6ddddddd"
  };
  var response=await apiService.postRequest(Apis.LogoutApi,requestBody,headers: customHeaders);
  if(response.statusCode==200){

    HiveBox().DeleteToken();

    Get.toNamed("/PhoneNumber");
  }
  }


}