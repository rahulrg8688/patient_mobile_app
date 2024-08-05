import 'dart:convert';
import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:patient_application/ApiService/Api_service.dart';
import 'package:patient_application/Apicalls/Apis.dart';
import 'package:patient_application/GetStorage/shared_prefs_service.dart';
import 'package:patient_application/ModelClass/AvailableDatesForDoctorModel.dart';
import 'package:patient_application/Screens/MainScreens/AboutDoctorScreen/custom_date_picker.dart';
import 'package:patient_application/Screens/MainScreens/Dashboard/HomeScreen/homeController.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../ModelClass/AvailableDatesForDoctorModel.dart';
import '../../../ModelClass/AvailableTimeForDoctorsModel.dart';
import '../../../ModelClass/DoctorsModel.dart';

class Aboutdoctorcontroller extends GetxController{

int? SpecialityId=0;
int? DoctorId=0;
bool IsLoading=false;
RxBool CalenderLoading=false.obs;
String UserSelectedDate='';
bool IsTimeSelected=false;
String date = DateTime.now().toString();
List<AvailableDates> DoctorAvailableDatesList=[];
RxList<Map<String,dynamic>> AvailableDatesOnly=<Map<String, dynamic>>[].obs;
 Aboutdoctorcontroller({int? Spid,int? DoctId}){
   this.SpecialityId=Spid;
   this.DoctorId=DoctId;
 }
//   this.SpecialityId=this.SpecialityId;
//   this.DoctorId=this.DoctorId;
//
// }
  String ErrorMessage='';

void setDoctorIdAndDoctorId(int? spid,int? doctid){
  print("I am from method set method ");
  this.SpecialityId=spid;
  this.DoctorId=doctid;
  update();


}
@override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
print("page loaded spcid :$SpecialityId");
print("page loaded docid : ${DoctorId}");
    await GetDoctor();
    await DoctorAvailableDates();


  }
List<AllDoctors> doctorabout=[];
ApiService apiService=ApiService.getInstance(baseUrl: Apis.baseUrl);
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
Future<void> DoctorAvailableDates({String? StartDate,String? EndDate}) async{
  CalenderLoading.value=true;
  print("Doctor Available api hittig");
  print("Start date is :: $StartDate");
  print("End date is :: $EndDate");
  DateTime currentDate=DateTime.now();
  // String Date="${currentDate.year}-${currentDate.month}-${currentDate.day}";
  // String DateEnd="${currentDate.year}-${currentDate.month+1}-${currentDate.day}";
  DateTime startDate = DateTime(currentDate.year, currentDate.month, 1);
  DateTime endDate = DateTime(currentDate.year, currentDate.month + 1, 0);
  String startDateString = "${startDate.year}-${startDate.month}-${startDate.day}";
  String endDateString = "${endDate.year}-${endDate.month}-${endDate.day}";
  print("Doctor Id is $DoctorId");
  print("SpecializationId is $SpecialityId");
  IsLoading=true;
  update();
  print("Date in available dates is :: ${date.toString()}");
print("Locations is :::::::: ${SharedPrefsService().GetPrefferedLocation()}");
var response=await apiService.postRequest(Apis.SpecialityDcotors['DoctorAvailableDates']!, {

    "providerId":DoctorId,
    "providerLocationId":0,
    "locationId":SharedPrefsService().GetPrefferedLocation(),
    "specializationId":SpecialityId,
    "startDate":StartDate??startDateString,
    "endDate":EndDate??endDateString,
    "consultationTypeId":1

});
CalenderLoading.value=false;
if(response.statusCode==200){
  AvailableDatesOnly.clear();
  IsLoading=false;
  update();
  var responseBody=jsonDecode(response.body);
  print("response Body is : $responseBody");
  if(responseBody is List){

    DoctorAvailableDatesList.clear();
    List<AvailableDates> doctrDatesList=responseBody.map((e)=>AvailableDates.fromJson(e)).toList();
  DoctorAvailableDatesList.addAll(doctrDatesList);


update();

  }
  if(DoctorAvailableDatesList.length>0) {
    print("DatesdoctorList : ${DoctorAvailableDatesList.length}");
    print("Dates Doctor Of : ${DoctorAvailableDatesList[0]}");
    print("Dates of each ${DoctorAvailableDatesList[0].date}");
    for (var item in DoctorAvailableDatesList) {
      print("Dates of each ${item.date}");
      DateTime? date = DateTime.tryParse(item.date!);
      if (date != null) {
        AvailableDatesOnly.add({
          'Date': date,
          'Day': getDayName(date.weekday)
        });
      }
      update();

    }
    print("Available Dates only list is ::: ${AvailableDatesOnly}");
    print("Available Dates length is :: ${AvailableDatesOnly.length}");
    update();
    //await DoctorAvialableTimes(Date:date);

  }
  else{
    print("No Data");
    ErrorMessage="No Data";
    update();
  }
}
else{
  print("Doctor Availability Dates Error :: ${response.statusCode}");
  print("Response Error is :: ${response.body}");
}
}

List<Slots> AvailableTimelist=[];


Future<void> DoctorAvialableTimes({String? Date}) async {
  DateTime currentDate=DateTime.now();
  // String date="${currentDate.year}-${currentDate.month}-${currentDate.day}";
  IsLoading = true;
  var patientId = SharedPrefsService().GetReferenceIdForPatient();
  print("patient id s : $patientId");
print("checkig time date is :: $date");
  var response = await apiService.postRequest(
      Apis.SpecialityDcotors['DoctorAvailableTime']!, {


    "chargeType": "payable",
    "chargeTypesId": 1,
    "consultationTypeId": 1,
    "fromDate": date,
    "isTelemedicine": false,
    "locationId": SharedPrefsService().GetPrefferedLocation(),
    "offset": "+05:30",
    "patientId": patientId,
    "providerId": DoctorId,
    "slotDate": date,
    "specializationId": SpecialityId,
    "timeZone": "India Standard Time",
    "toDate": date,
    "tokenNumber": 0,
    "type": "fromMobile",
    "visitType": "online appointment",
    "visitTypeId": 53
  });
  if (response.statusCode == 200) {
    IsLoading = false;
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    GetSlotsTimeForDoctors data = GetSlotsTimeForDoctors.fromJson(
        responsebody);
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
        for (var items in AvailableTimelist) {
          print(items.slotName);
          print(items.availableDate);
        }
        SlotsPerTime();
      }
      else {
        print("No data");
      }
      update();
    }
  }
  else {
    print("Failed to access the data with response code : ${response
        .statusCode}");
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

  TimeOfDay _time = new TimeOfDay.now();

  Future<void> selectedDate(BuildContext context) async {
    List<DateTime> highlightedDates = [
      DateTime(2024, 7, 29),
      DateTime(2024, 7, 20),
      DateTime(2024, 8, 5),
      DateTime(2024,9,10),
      DateTime(2024,9,11),
    ];
    print("calender context is $context");
    final DateTime? picked = await showModalBottomSheet(
        context: context,
        builder: (context)=>CustomDatePicker(

            initialDate: DateTime.now(),
            firstDate: DateTime(2018),
            lastDate: DateTime(2060),
        ),
    );
    if (picked != null && picked != date) {
      print("Date selected ${date.toString()}");
      String formattedDate = "${picked.year}-${picked.month}-${picked.day}";
      print("Selected Date: $formattedDate");


        date=formattedDate;
      update();
      DoctorAvialableTimes(Date: date);

    }
    //await DoctorAvailableDates();

  }

   selectDate(BuildContext context){
    TableCalendar(focusedDay: DateTime.now(), firstDay: DateTime(2022,12,01), lastDay: DateTime(2035,12,01),
    );
  }
  GridAppointmentSessionClicked(){
    IsTimeSelected=!IsTimeSelected;
    update();
  }
  List<String> Sessions=["Morning","Afternoon","Evening"];
int index=0;
  Click(int ind){
      index=ind;
      print("index selected is :: $index");
      SlotsPerTime();
    update();
  }
  List<String> TimeSlots=[];
SlotsPerTime(){
  print("Length of timelist is :: ${AvailableTimelist.length}");
print(index);
  TimeSlots.clear();
  AvailableTimelist.forEach((e) {
    print("slot is :: ${e.slotValue}");
    final String timeStr = formatTime(e.slotValue!);
    final TimeOfDay time = TimeOfDay(
      hour: int.parse(timeStr.split(":")[0]),
      minute: int.parse(timeStr.split(":")[1]),
    );
    print("Formatted Time: $timeStr");

    switch(index){
      case 0:
        if (time.hour < 12) {
          TimeSlots.add(timeStr);
        }
        break;
      case 1:
        if (time.hour >= 12 && time.hour < 18) {
          TimeSlots.add(timeStr);
        }
        break;
      case 2:
        if (time.hour >= 18) {
          TimeSlots.add(timeStr);
        }
        break;
    }

  });


  print("TimeSlots are :: $TimeSlots");
    update();
}

  String formatTime(String timeOfDay) {
    final hour = int.parse(timeOfDay.split(":")[0]);
    final minute = int.parse(timeOfDay.split(":")[1]);
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

}