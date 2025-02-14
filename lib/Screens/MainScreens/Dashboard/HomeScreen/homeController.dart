import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:patient_application/GetStorage/StorageService.dart';
import 'package:patient_application/GetStorage/shared_prefs_service.dart';
import 'package:patient_application/ModelClass/DoctorsModel.dart';
import 'package:patient_application/ModelClass/GetDoctorBookings.dart';
import 'package:patient_application/ModelClass/GetLocations.dart';
import 'package:patient_application/Screens/MainScreens/AboutDoctorScreen/AboutDoctorController.dart';
import 'package:patient_application/Screens/MainScreens/JitseScreen/Jitse.dart';
import 'package:patient_application/Screens/MainScreens/see_all_doctors/see_all_controller.dart';

import '../../../../ApiService/Api_service.dart';
import '../../../../Apicalls/Apis.dart';
import '../../../../GetStorage/HiveBox.dart';
import '../../../../Jitse/call_service.dart';
import '../../../../ModelClass/GetSpeciality.dart';
import '../../../../ModelClass/search_doctors_modelList.dart';


class homeController extends GetxController with WidgetsBindingObserver{
  int currentSlide=0;
  var BottomNavBarIndex=0.obs;
  var IsClicked=false.obs;
  var selectedSpecialityIndexGrid=-1;
  var selectedSpecialityIdByuser=0;
  bool IsLoading=false;
  bool IsSeeAllSpecialityClicked=false;
 var DoctorNameSearched=TextEditingController();


  List carousals=[
    AssetImage('assets/Carousals/carousal2.png'),
    AssetImage('assets/Carousals/carousal2.png'),
    AssetImage('assets/Carousals/carousal2.png'),

  ];

  List specialities=["Neuro","Cardio","Ortho","Urology","Gastro"];
  @override
  void onInit() {
    super.onInit();
    print("Random data of each is ${HiveBox().getRandomData()}");
    WidgetsBinding.instance.addObserver(this);

    // TODO: implement onInit
    print("function 1 called GetLocations");
    GetLocation();
    print("function 2 called specialityOFDoctors");
    GetSpecialitiesOfDoctors();
    print("function 3 called AllDoctors");
    GetAllDoctors();
    print("Function4 called");
    GetBookingsDoctors();

    print("In Home controller ${ApiService.getInstance(baseUrl: '').hashCode}");


  }
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        print("Home app in foreground");
        _handleAppResumed();


        break;
      case AppLifecycleState.inactive:
        print("Home app in inactive");
        break;
      case AppLifecycleState.paused:
        print("Home app in background");
        break;
      case AppLifecycleState.detached:
        print("Home app in detached");
        break;
      case AppLifecycleState.hidden:
      // TODO: Handle this case.
    }
  }
  Future<void> _handleAppResumed() async {
    print("Home app in foreground");

    // Delay for 3 seconds
    await Future.delayed(Duration(seconds: 3));

    // Load the call data after the delay
    var callData = await HiveBox().getStoreCallData();
    print("Call data is: $callData");
    if(callData.isNotEmpty) {
      HiveBox().StoreRandomData(callData);
      print("I am in home call getting data is :: ${callData}");

      Get.to(Jitse(pressed: true, data: HiveBox().getStoreCallData()));
      // CallService().getDeviceToken();
    }
    else{
      print("No data in Home Call Data");
    }
  }

  GetLocations locations=GetLocations();
  List<GetLocations> location=[];
  List<GetDoctorBookings> GetBookings=[];
  List<SearchedDoctorsModel> SearchedDoctors=[];
  List SearchedDoctorList=[];
  List DoctorBookings=[];
  List addlocation=[];
  List<AllDoctors> doctorsList=[];
  RxInt selectedLocation=1.obs;
  List Specialities=[];
List doctorList=[];
  List SpecializiedDoctors=[];
  ApiService apiService=ApiService.getInstance(baseUrl: Apis.baseUrl);
  Future<void> GetLocation() async{
    var response=await apiService.getRequest(Apis.GetLocations['LocationApi']!);
    if(response.statusCode==200){
     List<dynamic> res=jsonDecode(response.body);
     location=res.map((e)=>GetLocations.fromJson(e)).toList();
     location.forEach((location) {
       print("Location name: ${location.name}");

       var locationList={
         'name':location.name,
         'id':location.id
       };
       addlocation.add(locationList);

       update();

     });

     addlocation.forEach((loc){
       print("droploc : ${loc}");
     });
     update();

      print("Location name :${locations}");
      print("locations: $locations");
    }
    else{
      print(response.body);
      print(response.statusCode);
      print(response.reasonPhrase);
    }
  }

  void LocationSelected(String val){
    selectedLocation.value=int.parse(val);
    update();
    print("Selected Location is :: $selectedLocation");
    SharedPrefsService().SetPreferredLocation(int.parse(val));
    GetAllDoctors();
  }
  void CarouralIndex(int val){
    currentSlide=val;
    update();
  }
  void bottomNavBarIndexFunc(int val){
    BottomNavBarIndex.value=val;

    update();
  }
  Future<List<dynamic>> GetSpecialitiesOfDoctors() async{
    String Endpoint=Apis.GetSpecialities();
    print(Endpoint);
    var response=await apiService.postRequest(Endpoint,{
    }
    );
    if(response.statusCode==200){
      dynamic responseBody = jsonDecode(response.body);

      if (responseBody is List) {
        List<Specialitions> doctorSpecialities = responseBody.map((e) => Specialitions.fromJson(e)).toList();
        doctorSpecialities.forEach((speciality) {
          if (speciality.specializations != null &&
              speciality.specializations!.isNotEmpty) {
            print("Iam from list : ${speciality.specializations}");
          }
        });
        } else if (responseBody is Map<String, dynamic>) {
          // Handle single object case
          Specialitions doctorSpeciality = Specialitions.fromJson(responseBody);
          if (doctorSpeciality.specializations != null && doctorSpeciality.specializations!.isNotEmpty) {
                  print("I am from object specialities");
            //print("single object : ${doctorSpeciality.specializations![1].value}");
            doctorSpeciality.specializations!.forEach((spec){

              if(!(Specialities.contains(spec.id) && Specialities.contains(spec.value))){
                print(spec.value);
                print(spec.id);
                print("second \n");
                var eachspecialityById={

                  'specialityId':spec.id,
                  'specialityname':spec.value,
                };
                Specialities.add(eachspecialityById);
              }
            });
           // Specialities.insert(0,{'specialityId':0,'specialityname':"See All"});

            print(Specialities.length);
          }
        } else {
        print("Unexpected response format");
      }
    } else {
      print("Failed to fetch specialities: ${response.reasonPhrase}");
    }
    update();
    return Specialities;


    }

    void SelectedItemSpeciality(){
      IsSeeAllSpecialityClicked=!IsSeeAllSpecialityClicked;
      update();
    }
void SeeAllSpecialityButtonClicked(){
    IsSeeAllSpecialityClicked=!IsSeeAllSpecialityClicked;
    update();
}



    Future<List<AllDoctors>> GetAllDoctors({int? pageIndex,int? pageSize}) async{
    IsLoading=true;
    print("GetAlldoctors function called");

    var requestBody={
      "consultationName":"Physical Consultation",
      "pageIndex": pageIndex??1,
      "pageSize": pageSize!=10?70:10
    };
     if(selectedSpecialityIdByuser>=0){
       requestBody['specializationId']=(selectedSpecialityIdByuser).toString();
     } //
    //SpecilaizationId based
     if(selectedLocation>0){
       requestBody['locationId']=selectedLocation.toString();
     } //locationBased
          var response=await apiService.postRequest(Apis.SpecialityDcotors['AllDoctorsList']!,requestBody);
          if(response.statusCode==200){
            IsLoading=false;
            update();
            doctorList.clear();
            update();
            var responsebody=jsonDecode(response.body);
            print(responsebody);

            if(responsebody is List){
              print("List returning");
              print("Length of list : ${responsebody.length}");

               doctorsList=responsebody.map((e)=>AllDoctors.fromJson(e)).toList();
             for(var doctor in doctorsList){
               print("Doctor account Id : ${doctor.accountId}");
               print("Doctor speciality : ${doctor.specializations}");
               print("Doctor Location : ${doctor.location}");


               if(!(doctorList.contains(doctor.providerId) && doctorList.contains(doctor.providerName))){
                 var ModelDoctor={
                   'DoctorName':doctor.providerName,
                   'DoctorId':doctor.providerId,
                   'speciality':doctor.specializations,
                   'specialityId':doctor.specializationId,
                 };

                 doctorList.add(ModelDoctor);
                 print(doctorList.length);
                 SpecializiedDoctors=doctorList;
                 update();

               }
               
             }
            }
            else if(responsebody is Map<String, dynamic>){
              print("I am object");
            }
            return doctorsList;
          }
          return [];

    }



  void filterDoctors() {
    if (selectedSpecialityIdByuser== 0) {
      SpecializiedDoctors = doctorList;
    } else {
      SpecializiedDoctors= doctorList.where((doctor) => doctor['specialityId'] == selectedSpecialityIdByuser).toList();
    }
  }
  Timer? _debounce;
Future<void> SearchedDoctorsList(String val) async {
  print("function called");
  if (_debounce?.isActive ?? false) _debounce!.cancel();
  _debounce = Timer(Duration(milliseconds: 500), () async {
    await fetchSearchDoctors(val);
  });
}
Future<List<SearchedDoctorsModel>> fetchSearchDoctors(String val) async{
      // Perform API request with the debounced value
  if(val.isEmpty){
    SearchedDoctors=[];
  }
  else {
    SearchedDoctors=[];
    DoctorNameSearched.text = val;

    var response =
    await apiService.getRequest(Apis.SearchDoctors(DoctorNameSearched.text));
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> responseBody = jsonDecode(response.body);
      SearchedDoctors = responseBody
          .map((e) => SearchedDoctorsModel.fromJson(e))
          .toList();

      for (var doctor in SearchedDoctors) {
        print("searched doctor : ${doctor.id}");
        print("searched doctor value is : ${doctor.value}");
      }
      print(SearchedDoctors.length);

      update(); // Notify listeners that the state has changed
    }
  }
  return SearchedDoctors;
    }



    // var response=await apiService.getRequest(Apis.SearchDoctors(DoctorNameSearched.text));
    // if(response.statusCode==200){
    //   print(response.body);
    //   List<dynamic> responsebody=jsonDecode(response.body);
    //  SearchedDoctors= responsebody.map((e)=>SearchedDoctorsModel.fromJson(e)).toList();
    //
    //  for(var Doctor in SearchedDoctors){
    //    print("searched doctor : ${Doctor.id}");
    //    print("Searched doctor value os : ${Doctor.value}");
    //  }
    //  print(SearchedDoctors.length);
    //   update();
    // }


int ctr=0;
    Future<List<GetDoctorBookings>> GetBookingsDoctors() async{
      print("GetBooking called");
    int patientId=SharedPrefsService().GetReferenceIdForPatient();
    print("Patient Id is :: $patientId");
    var response=await apiService.postRequest(Apis.Appointment['BookingAppointmentApi']!, {

        "isMobile": true,
        "pageIndex": 1, // not mandatory
        "pageSize": 20, // not mandatory
        "patientId": patientId, // mandatory field
        "resultsType": "Pending",
        "status": ""
    });
    if(response.statusCode==200){
      print(response.body);
      List<dynamic> responseBody=jsonDecode(response.body);
      GetBookings=responseBody.map((e)=>GetDoctorBookings.fromJson(e)).toList();
      for(var bookings in GetBookings){
        ctr++;
        if(ctr==2){
          DoctorBookings.add(bookings);
          update();
          break;

        }

        print("Booking is : ${bookings.providerName}");
      }
     // DoctorBookings.add(GetBookings);

      print("Doctor booking : ${DoctorBookings.length}");

    }
return GetBookings;
    }
   void SelectedSpeciality(int val){
    selectedSpecialityIndexGrid=val;
    update();
   }
   void SelectedSpecialityIduser(int val){
    if(selectedSpecialityIdByuser==val){
      selectedSpecialityIdByuser=0;
    }
    else{
      selectedSpecialityIdByuser=val;
    }

     update();
     filterDoctors();
   }

   void DoctorParticularClick(int doctid,{int? spid}){
    print(doctid);
   // Aboutdoctorcontroller AboutDoctor=Get.put(Aboutdoctorcontroller(spid,doctid));
      //AboutDoctor.setDoctorIdAndDoctorId(spid,doctid);

    Get.toNamed("/AboutDoctor",arguments: {'DoctId':doctid,'Spid':spid});
   }
  }
