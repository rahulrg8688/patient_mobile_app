import 'dart:convert';
import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:patient_application/ApiService/Api_service.dart';
import 'package:patient_application/Apicalls/Apis.dart';
import 'package:patient_application/ModelClass/AvailableDatesForDoctorModel.dart';

import '../../../ModelClass/AvailableDatesForDoctorModel.dart';
import '../../../ModelClass/AvailableTimeForDoctorsModel.dart';
import '../../../ModelClass/DoctorsModel.dart';

class Aboutdoctorcontroller extends GetxController{

int? SpecialityId=0;
int? DoctorId=0;
bool IsLoading=false;
List<AvailableDates> DoctorAvailableDatesList=[];
List<Map<String,dynamic>> AvailableDatesOnly=[];
 Aboutdoctorcontroller(this.SpecialityId,this.DoctorId);
//   this.SpecialityId=this.SpecialityId;
//   this.DoctorId=this.DoctorId;
//
// }

void setDoctorIdAndDoctorId(int? spid,int? doctid){
  print("I am from method set method ");
  this.SpecialityId=spid;
  this.DoctorId=doctid;
  update();


}
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
print("page loaded spcid :$SpecialityId");
print("page loaded docid : ${DoctorId}");
    GetDoctor();
    DoctorAvailableDates();
    DoctorAvialableTimes();

  }
List<AllDoctors> doctorabout=[];
ApiService apiService=ApiService(baseUrl: Apis.baseUrl);
Future<void> GetDoctor() async {
  IsLoading = true;
  print("GetAlldoctors function called");

  var requestBody = {
    "consultationName": "Physical Consultation",
    "specializationId": SpecialityId,
    "providerId": DoctorId
  };

  var response = await apiService.postRequest(
      Apis.SpecialityDcotors['AllDoctorsList']!,{
    "consultationName": "Physical Consultation",
    "specializationId": SpecialityId,
    "providerId": DoctorId
  });
  if (response.statusCode == 200) {
    IsLoading = false;
    update();
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    if (responsebody is List) {
      doctorabout.clear();
      List<AllDoctors> doctorsList = responsebody.map((e) =>
          AllDoctors.fromJson(e)).toList();
      doctorabout.addAll(doctorsList);

      print("Doctors List Length: ${doctorabout.length}");
      print("DOctorName : ${doctorabout[0].providerName}");


      update();
    }
  } else {
    IsLoading = false;
    update();
    print("Failed to fetch doctors. Status Code: ${response.statusCode}");
  }


}
//List<AvailableDates> DoctorAvailableDatesList=[];
Future<void> DoctorAvailableDates() async
{
  print("Doctor Id is $DoctorId");
  print("SpecializationId is $SpecialityId");
  IsLoading=true;
  update();
var response=await apiService.postRequest(Apis.SpecialityDcotors['DoctorAvailableDates']!, {

    "providerId":DoctorId,
    "providerLocationId":0,
    "locationId":1,
    "specializationId":SpecialityId,
    "startDate":"2024-6-07",
    "endDate":"2024-07-29",
    "consultationTypeId":1

});
if(response.statusCode==200){
  IsLoading=false;
  update();
  var responseBody=jsonDecode(response.body);
  print("response Body is : $responseBody");
  if(responseBody is List){
    DoctorAvailableDatesList.clear();
    List<AvailableDates> doctrDatesList=responseBody.map((e)=>AvailableDates.fromJson(e)).toList();
  DoctorAvailableDatesList.addAll(doctrDatesList);
update();
    AvailableDatesOnly.clear();
  }
  print("DatesdoctorList : ${DoctorAvailableDatesList.length}");
  print("Dates Doctor Of : ${DoctorAvailableDatesList[0]}");
  print("Dates of each ${DoctorAvailableDatesList[0].date}");
  for(var item in DoctorAvailableDatesList){
    print("Dates of each ${item.date}");
    DateTime? date=DateTime.tryParse(item.date!);
    if(date!=null){
      AvailableDatesOnly.add({
        'Date':date,
        'Day':getDayName(date.weekday)
    });
    }
    update();

  }
}


}

List<Slots> AvailableTimelist=[];
Future<void> DoctorAvialableTimes() async {
  IsLoading=true;
  GetStorage storage = GetStorage();
  var patientId = storage.read('referenceId');
  print("patient id s : $patientId");
  var response = await apiService.postRequest(
      Apis.SpecialityDcotors['DoctorAvailableTime']!, {


      "chargeType": "payable",
      "chargeTypesId": 1,
      "consultationTypeId": 2,
      "fromDate": date.toString(),
      "isTelemedicine": false,
      "locationId": 2,
      "offset": "+05:30",
      "patientId": patientId,
      "providerId": 509,
      "slotDate": date.toString(),
      "specializationId": 54,
      "timeZone": "India Standard Time",
      "toDate":date.toString(),
      "tokenNumber": 0,
      "type": "fromMobile",
      "visitType": "online appointment",
      "visitTypeId": 53

  });
  if (response.statusCode == 200) {
    IsLoading=false;
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    GetSlotsTimeForDoctors data = GetSlotsTimeForDoctors.fromJson(responsebody);
    if (data.status == "Success") {
      AvailableTimelist.clear();
      if (data.data != null) {
        for (var TimeSlots in data.data!) {
          print('Date: ${TimeSlots.date}');



          if (TimeSlots.slots != null) {
            for (var slot in TimeSlots.slots!) {
              print('Slot: ${slot.slotName} at ${slot.slotValue}');
              AvailableTimelist.add(slot);

              update();
            }
          }
          else {
            print('Message: ${TimeSlots.message}');
          }
        }
        for(var items in AvailableTimelist){
          print(items.slotName);
          print(items.availableDate);
        }
      }
      else{
        print("No data");
      }
      update();
    }
  }
  else{
    print("Failed to access the data with response code : ${response.statusCode}");
    print(response.reasonPhrase);
  }
  update();
}
  String getDayName(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }
  String date = DateTime.now().toString();
  TimeOfDay _time = new TimeOfDay.now();

  Future<void> selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate:  DateTime(2018),
        lastDate:  DateTime(2060));

    if (picked != null && picked != date) {
      print("Date selected ${date.toString()}");
      String formattedDate = "${picked.day}-${picked.month}-${picked.year}";
      print("Selected Date: $formattedDate");


        date=formattedDate;
      update();

    }
    DoctorAvialableTimes();
  }
}