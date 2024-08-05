import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:get/get.dart';
import 'package:patient_application/ApiService/Api_service.dart';
import 'package:patient_application/ModelClass/DoctorsModel.dart';
import 'package:patient_application/Screens/MainScreens/Dashboard/HomeScreen/homeController.dart';

import '../../../Apicalls/Apis.dart';
import '../../../ModelClass/GetSpeciality.dart';
import '../../../ModelClass/search_doctors_modelList.dart';

class SeeAllController extends GetxController{
 late homeController homecontroller=
 homecontroller=Get.find<homeController>();
 bool IsSpecialityClicked=false;
 ApiService apiService=ApiService.getInstance(baseUrl:Apis.baseUrl );
int SpecialityId=0;
  homeController obj1=Get.put(homeController());
  var DoctorNameSearched=TextEditingController();
  ScrollController scrollController=ScrollController();
 List<AllDoctors> doctorList=[];
 List<AllDoctors> AllDoctorsList=[];
 List<dynamic> AllSpeciality=[];
 List<AllDoctors> doctorsWithOutSpeciality=[];
 int selectedSpecialityIndexGrid=-1;
List<SearchedDoctorsModel> SearchedDoctor=[] ;
 int pageIndex=2;
 int selectedLocation=0;
 bool IsSeeAllSpecialityClicked=false;
  @override
  void onInit() async{
  selectedLocation=homecontroller.selectedLocation.value;
  print("Selected Location is : $selectedLocation");
    fetchDoctors(1);
    AllSpeciality=await homecontroller.GetSpecialitiesOfDoctors();
//AllDoctorsList=await homecontroller.GetAllDoctors();
print("All doctors List length is :${AllDoctorsList.length}");
print("All speculaity list length is : ${AllSpeciality.length}");
print("Speciality of each is : ${AllSpeciality[0]['specialityId']}");

    scrollController.addListener((){

      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        _getMoreDoctors();
      }
    });
    // TODO: implement onInit
    super.onInit();
  }

void SetSpeciality(int val){
  SpecialityId=val;
  update();
}
 void SelectedSpeciality(int val){
   selectedSpecialityIndexGrid=val;
   update();
 }
 void filterDoctors() {
   if (SpecialityId== 0) {
     doctorsWithOutSpeciality = doctorList;
     print("Specuality Id is zero doctor list vlue is :: $doctorsWithOutSpeciality");
   } else {
     doctorsWithOutSpeciality= doctorList.where((doctor) => doctor.specializationId == SpecialityId).toList();
     print("Specuality Id is some doctor list vlue is :: $doctorsWithOutSpeciality");
   }
 }
void IsSpecialityClickedByUser(){
  IsSpecialityClicked=!IsSpecialityClicked;
  update();
  fetchDoctors(1);
}

fetchDoctors(pageIndex,{int? pageSize=70}) async{
    try {
      var requestBody = {
        "consultationName": "Physical Consultation",
        "pageIndex": pageIndex ?? 1,
        "pageSize": pageSize != 10 ? 70 : 10
      };
      if (SpecialityId >= 0) {
        requestBody['specializationId'] = (SpecialityId).toString();
      } //
      //SpecilaizationId based
      if (selectedLocation > 0) {
        requestBody['locationId'] = selectedLocation.toString();
      }
      List<AllDoctors> ListOfFreshDoctors=[];
      var response = await apiService.postRequest(
          Apis.SpecialityDcotors['AllDoctorsList']!, requestBody);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        print("Body is :: $responsebody");
        print("Body length is :: ${responsebody.toString().length}");
         ListOfFreshDoctors=(responsebody as List<dynamic>).map((e)=>AllDoctors.fromJson(e as Map<String,dynamic>)).toList();
         print("DoctorList length is :: ${ListOfFreshDoctors.length}");
         print("DoctorLst is :: ${ListOfFreshDoctors[0].providerName}");
         for(int i=0;i<doctorList.length;i++){
           print("Doctors are :: ${ListOfFreshDoctors[i].providerName}");
         }
         doctorList.addAll(ListOfFreshDoctors);
update();
filterDoctors();
      }
    }
    catch(ex){
        print("exception :: $ex");

    }
}



 // fetchDoctors(pageIndex) async{
 //   try {
 //    List<AllDoctors> res = await homecontroller.GetAllDoctors(pageIndex: pageIndex,pageSize: 10);
 //    doctorList.addAll(res);
 //    doctorsWithOutSpeciality=doctorList;
 //     print("Response length: ${doctorList.length}");
 //     print("Response content: ${doctorList[0].providerName}");
 //    filterDoctors();
 //     // Verify that each element in the response is a Map
 //
 //   } catch (e) {
 //     print("Error fetching doctors: $e");
 //   }
 // }
  _getMoreDoctors(){
for(int i=pageIndex;i<pageIndex+1;i++){
fetchDoctors(pageIndex);
}
pageIndex=pageIndex+1;
update();
    print("Getting data from $pageIndex");

  }
 void SelectedSpecialityIduser(int val){
   if(SpecialityId==val){

     SpecialityId=0;

   }
   else{
     SpecialityId=val;
   }

   update();
   filterDoctors();

 }
 void SelectedItemSpeciality(){
   IsSeeAllSpecialityClicked=!IsSeeAllSpecialityClicked;
   update();
 }
  GetSpecialityDoctor(val){
    homecontroller.selectedSpecialityIdByuser=val;
    update();
    fetchDoctors(pageIndex);
  }
List Specialities=[];


 Timer? _debounce;
 Future<void> SearchedDoctorsList(String val) async {
   print("function called");
   if (_debounce?.isActive ?? false) _debounce!.cancel();
   _debounce = Timer(Duration(milliseconds: 500), () async {
     await fetchDoctorsSearched(val);
   });
 }
  Future<void> fetchDoctorsSearched(String val) async{
   SearchedDoctor=await homecontroller.fetchSearchDoctors(val) ;
print("SearchedDoctors Length is : ${SearchedDoctor.length}");
   print("Patient id is : ${SearchedDoctor[0].id}");
   print("doctor name is : ${SearchedDoctor[0].value}");
   update();
 }
 void DoctorClick(int doctid,{int ?spid}){
   homecontroller.DoctorParticularClick(doctid,spid: spid);
 }
 void Function(){
   Specialities=homecontroller.Specialities;
   homecontroller.SelectedItemSpeciality();

}
}