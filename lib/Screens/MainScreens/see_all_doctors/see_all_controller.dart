import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_application/ModelClass/DoctorsModel.dart';
import 'package:patient_application/Screens/MainScreens/Dashboard/HomeScreen/homeController.dart';

class SeeAllController extends GetxController{
 late homeController homecontroller;
 bool IsSpecialityClicked=false;
int SpecialityId=0;
  homeController obj1=Get.put(homeController());
  var DoctorNameSearched=TextEditingController();
  ScrollController scrollController=ScrollController();
 List<AllDoctors> doctorList=[];
 List<AllDoctors> AllDoctorsList=[];
 List<AllDoctors> doctorsWithOutSpeciality=[];
 int pageIndex=2;
  @override
  void onInit() async{
    homecontroller=Get.find<homeController>();
    fetchDoctors(1);
AllDoctorsList=await homecontroller.GetAllDoctors();
print("All doctors List length is :${AllDoctorsList.length}");
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
  void FilterDoctors(){
    doctorList=[];
    if(homecontroller.selectedSpecialityIdByuser!=0){
      doctorList=AllDoctorsList.where((doctor)=>doctor.specializationId==SpecialityId).toList();

    }
    else{
      doctorList=doctorsWithOutSpeciality;
    }
  }
void IsSpecialityClickedByUser(){
  IsSpecialityClicked=!IsSpecialityClicked;
}
 fetchDoctors(pageIndex) async{
   try {
    List<AllDoctors> res = await homecontroller.GetAllDoctors(pageIndex: pageIndex,pageSize: 10);
    doctorList.addAll(res);
    doctorsWithOutSpeciality=doctorList;
     print("Response length: ${doctorList.length}");
     print("Response content: ${doctorList[0].providerName}");

     // Verify that each element in the response is a Map

   } catch (e) {
     print("Error fetching doctors: $e");
   }
 }
  _getMoreDoctors(){
for(int i=pageIndex;i<pageIndex+1;i++){
fetchDoctors(pageIndex);
}
pageIndex=pageIndex+1;
update();
    print("Getting data from $pageIndex");

  }
 void SelectedSpecialityIduser(int val){
   if(homecontroller.selectedSpecialityIdByuser==val){

     homecontroller.selectedSpecialityIdByuser=val;

   }
   else{
     homecontroller.selectedSpecialityIdByuser=0;
   }

   update();
   FilterDoctors();

 }
  GetSpecialityDoctor(val){
    homecontroller.selectedSpecialityIdByuser=val;
    update();
    fetchDoctors(pageIndex);
  }
List Specialities=[];

 SearchedDoctorsList(val){

 }
 void Function(){
   Specialities=homecontroller.Specialities;
   homecontroller.SelectedItemSpeciality();

}
}