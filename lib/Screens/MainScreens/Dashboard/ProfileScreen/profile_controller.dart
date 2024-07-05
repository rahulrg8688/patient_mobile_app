import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../ApiService/Api_service.dart';
import '../../../../Apicalls/Apis.dart';

class ProfileController extends GetxController{

  ApiService apiService=ApiService(baseUrl: Apis.baseUrl);
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
}
var MyInvoicesListIndex=0;
void MyInvoiceListSetIndex(int val){

  MyInvoicesListIndex=val;
  print("My invoice index is : ${MyInvoicesListIndex}");
  print("the value is ${MyInvoiceList[MyInvoicesListIndex]}");
  update();
}
int GeneralListIndex=0;
void MyGeneralListSetIndex(int val){
  GeneralListIndex=val;
  print("General Index is ${GeneralListIndex}");

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
    Get.toNamed("/PhoneNumber");
  }
  }


}