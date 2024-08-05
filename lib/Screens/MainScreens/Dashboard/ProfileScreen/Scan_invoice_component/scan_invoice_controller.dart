import 'dart:convert';

import 'package:get/get.dart';
import 'package:patient_application/ModelClass/scan_invoice_model.dart';
import 'package:patient_application/Screens/MainScreens/Dashboard/HomeScreen/homeController.dart';

import '../../../../../ApiService/Api_service.dart';
import '../../../../../Apicalls/Apis.dart';
import '../../../../../GetStorage/shared_prefs_service.dart';
import '../../web_view_screen.dart';

class ScanInvoiceController extends GetxController{

  List<ScanInvoiceModel> ScanInvoiceList=[];
  ApiService apiService=ApiService.getInstance(baseUrl: Apis.baseUrl);
@override
  void onInit(){
  print("Patient id is :: ${SharedPrefsService().GetReferenceIdForPatient()}");
  print("Custom loc is ${homeController().selectedLocation.toString()}");
    // TODO: implement onInit
   GetScanInvoiceData();
    super.onInit();
  }

  var customHeaders={
"LocationId":'2'
  };
  Future<void> GetScanInvoiceData() async{
  var response=await apiService.postRequest(Apis.GetScanInvoice,{

      "Active": false,
      "Age": 0,
      "BookScanAppointmentId": 0,
      "chargeCategoryId": 0,
      "CreatedBy": 0,
      "IsSalucroAppointment": false,
      "PageIndex": 1,
      "PageSize": 10,
      "PatientId": SharedPrefsService().GetReferenceIdForPatient(),
      "PatientPaymentStatus": false,
      "ScanMachineMasterIds": 0,
      "SlotDuration": 0


  },headers:customHeaders);
  if(response.statusCode==200){
    print("response code is :: ${response.statusCode}");
    print("resposne is ${response}");
    List<dynamic> data=jsonDecode(response.body);
    print("data is :: ${data}");
    ScanInvoiceList=data.map((e)=>ScanInvoiceModel.fromJson(e)).toList();
    update();
    print("Length of :: is ${ScanInvoiceList.length}");
  }
  else{
    print("response error is :: ${response.statusCode}");
    print("response is :: ${response.reasonPhrase}");
  }
  }
  onNavigateToWebView(String BookScanAppointmentId,{String? RecieptId}){
    Get.to(()=>WebViewScreen(Path:'scan-report-invoice',Id: BookScanAppointmentId,RecieptId: RecieptId,));
  }
}