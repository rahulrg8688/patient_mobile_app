import 'dart:convert';

import 'package:get/get.dart';
import 'package:patient_application/GetStorage/StorageService.dart';

import '../../../../../ApiService/Api_service.dart';
import '../../../../../Apicalls/Apis.dart';
import '../../../../../GetStorage/shared_prefs_service.dart';
import '../../../../../ModelClass/lab_reports_model.dart';
import '../../web_view_screen.dart';

class LabReportsController extends GetxController{
  List<LabReportsModel> LabReportsList=[];
int patientId=SharedPrefsService().GetReferenceIdForPatient();
  ApiService apiService=ApiService.getInstance(baseUrl: Apis.baseUrl);
Future<void> GetLabReports() async{
var response=await apiService.postRequest(Apis.LabReportsApi, {
  "patientId":patientId,
  "status" : "Verified"
});
if(response.statusCode==200){
  print(response.body);
  List<dynamic> res=jsonDecode(response.body);
  LabReportsList=res.map((e)=>LabReportsModel.fromJson(e)).toList();
  print("length of reports is : ${LabReportsList.length}");
  print(LabReportsList[0].patientId);
  print(LabReportsList[0].requisitionNumber);
  print(LabReportsList[0].doctorName);
  print(LabReportsList[0].testName);
  print(LabReportsList[0].bookedDate);
  update();
}

}

navigateToLabBookDetail(String EncryptedLabId){
  print("sending data is :: $EncryptedLabId");
  Get.to(()=>WebViewScreen(Path:'new-lab-reports',Id: EncryptedLabId));
}

  @override
  void onInit() {
  int patientId=SharedPrefsService().GetReferenceIdForPatient();
  GetLabReports();
    // TODO: implement onInit
    super.onInit();
  }
}