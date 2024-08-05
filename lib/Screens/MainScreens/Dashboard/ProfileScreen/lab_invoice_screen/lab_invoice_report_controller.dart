import 'dart:convert';

import 'package:get/get.dart';
import 'package:patient_application/ApiService/Api_service.dart';
import 'package:patient_application/GetStorage/shared_prefs_service.dart';
import 'package:patient_application/ModelClass/labs_invoice_model.dart';

import '../../../../../Apicalls/Apis.dart';
import '../../../../../GetStorage/StorageService.dart';
import '../../web_view_screen.dart';

class LabInvoiceReportController extends GetxController{


  List<LabsInvoiceModel> LabsInvoiceList=[];

  ApiService apiService=ApiService.getInstance(baseUrl: Apis.baseUrl);

  @override
  void onInit() {
    GetLabInvoiceDetails();
    // TODO: implement onInit
    super.onInit();
  }

Future<void> GetLabInvoiceDetails() async{
  var response=await apiService.postRequest(Apis.GetLabInvoice, {
    "patientId": SharedPrefsService().GetReferenceIdForPatient(),
  });
  if(response.statusCode==200){
    List<dynamic> data=jsonDecode(response.body);
    LabsInvoiceList=data.map((e)=>LabsInvoiceModel.fromJson(e)).toList();
    print(LabsInvoiceList.length);
    print(LabsInvoiceList[0].doctorName);
    update();
  }

}
onClickNavigate(String EncryptedHeaderId,{String?Billed} ){
  Get.to(()=>WebViewScreen(Path:'new-lab-bills',Id: EncryptedHeaderId,Billed: Billed,));
}
}