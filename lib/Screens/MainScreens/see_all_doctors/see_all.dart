import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:patient_application/Screens/MainScreens/Dashboard/HomeScreen/homeController.dart';
import 'package:patient_application/Screens/MainScreens/see_all_doctors/see_all_controller.dart';

import '../../../ModelClass/search_doctors_modelList.dart';
import '../Dashboard/HomeScreen/homeController.dart';

class SeeAll extends StatelessWidget {
   SeeAll({super.key});
   OverlayEntry? overlayEntry;
   final LayerLink layerLink = LayerLink();
   final GlobalKey searchBoxKey = GlobalKey();
  SeeAllController controller=Get.put(SeeAllController());
   void showOverlay(BuildContext context) {

     overlayEntry = OverlayEntry(
         builder: (context) {
           return GetBuilder<SeeAllController>(
             builder: (controller) {
               List<SearchedDoctorsModel> doctorsList = controller.SearchedDoctor;
               RenderBox? renderBox = searchBoxKey.currentContext?.findRenderObject() as RenderBox?;
               if(renderBox==null){
                 return SizedBox();
               }
               Size size = renderBox.size;
               Offset offset = renderBox.localToGlobal(Offset.zero);

               // Check if SearchedDoctors list is empty, then remove overlay
               if (controller.SearchedDoctor.isEmpty) {
                 overlayEntry?.remove();
                 overlayEntry=null;
               }

               return Positioned(
                 width: size.width,
                 child: CompositedTransformFollower(
                   link: layerLink,
                   showWhenUnlinked: false,
                   offset: Offset(0.0, size.height + 5.0),
                   child: Material(
                     elevation: 4.0,
                     child: ConstrainedBox(
                       constraints: BoxConstraints(maxHeight: 200),
                       child:
                       ListView.builder(
                         padding: EdgeInsets.zero,
                         shrinkWrap: true,
                         itemCount: controller.SearchedDoctor.length,
                         itemBuilder: (context, index) {
                           final doctor = controller.SearchedDoctor[index];
                           return ListTile(
                             title: Text(doctor.value!),
                             subtitle: Text(doctor.id.toString()),
                             onTap: () {
                               print(doctor.id);
                               controller.DoctorClick(doctor.id!);
                               overlayEntry?.remove();
                               overlayEntry=null;
                               controller.SearchedDoctor=[];
                             },

                           );
                         },
                       ),

                     ),
                   ),
                 ),
               );
             },
           );
         }
     );

     Overlay.of(context).insert(overlayEntry!);
   }
   void hideOverlay(OverlayEntry overlayEntry) {
     overlayEntry.remove();

   }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeeAllController>(

    builder: (controller) {
      final homeController Homecontroller = Get.put(homeController());

      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Center(
              child: Text("Search a Doctor",
              style:TextStyle(
                color:Color(0xff000000),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              )
              ),
            ),
          ),
          body: GetBuilder<homeController>(
            builder: (Homecontroller) {
              return SingleChildScrollView(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    controller.SearchedDoctor = [];
                    controller.update();
                    overlayEntry?.remove();
                    overlayEntry = null;
                  },
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [

                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: GestureDetector(
                                onTap: ()=>hideOverlay(OverlayEntry as OverlayEntry),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height:100,

                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              CompositedTransformTarget(link: layerLink,
                                              child:   TextFormField(
                                                key:searchBoxKey,
                                                  controller: controller.DoctorNameSearched,
                                                  onChanged: (val) {
                                                    controller.fetchDoctorsSearched(val);
                                                      if(val.isNotEmpty){
                                                        showOverlay(context);
                                                      }
                                                  },
                                                  decoration: InputDecoration(
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.black, width: 1),
                                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                                    ),
                                                    prefixIcon: Padding(
                                                      padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 0),
                                                      child: Icon(
                                                        Icons.search,
                                                        size: 28,
                                                      ),
                                                    ),
                                                    contentPadding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.black, width: 5),
                                                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                                                    ),
                                                    hintText: "Search with Doctor name",
                                                    hintStyle: TextStyle(color: Colors.black),
                                                  ),
                                                ),
                                              )

                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(19,0,19,0),
                              height:130,

                              width:double.infinity,

                              child: Column(
                                  children: [
                                    Expanded(
                                        child:
                                        SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Container(

                                                height: 130,


                                                width:double.infinity,
                                                // Adjust height as needed
                                                child: GridView.builder(
                                                    scrollDirection: Axis.horizontal,

                                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2, // Number of rows you want
                                                      mainAxisSpacing: 7.0,
                                                      crossAxisSpacing: 7.0,
                                                      childAspectRatio: 0.37, // Adjust as needed for item width/height ratio
                                                    ),
                                                    itemCount: controller.AllSpeciality.length, // Number of items
                                                    itemBuilder: (context, index) {
                                                      final speciality=controller.AllSpeciality[index];
                                                      //
                                                      bool Isselected=( controller.selectedSpecialityIndexGrid==index &&controller.IsSeeAllSpecialityClicked);
                                                      List Alldoctor=[];


                                                      return Container(

                                                        height:10,
                                                        width:30,



                                                        // width: 550, // Fixed width for each card
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            controller.SelectedItemSpeciality();
                                                            if(controller.IsSeeAllSpecialityClicked){
                                                              print(controller.IsSeeAllSpecialityClicked);
                                                              Alldoctor=[];
                                                              controller.SelectedSpeciality(index);
                                                              print("Selected SpecialityId is ${controller.AllSpeciality[index]['specialityId']}");
                                                              controller.SelectedSpecialityIduser(controller.AllSpeciality[index]['specialityId']);
                                                              //  List doctor=controller.GetDoctorsBasedOnSpecialityId(controller.Specialities[index]['specialityId']);
                                                              // Alldoctors=doctor;
                                                            }
                                                            else{
                                                              Alldoctor=[];
                                                              controller.SelectedSpeciality(index);
                                                              controller.SelectedSpecialityIduser(0);
                                                              //  List doctor=controller.GetDoctorsBasedOnSpecialityId(co
                                                              //Alldoctors=controller.GetDoctorsBasedOnSpecialityId(0);
                                                            }
                                                            controller.SelectedSpeciality(index);
                                                            print("selected Index is : ${controller.AllSpeciality[index]['specialityId']}");
                                                            // if(controller.IsSpecialityClicked){
                                                            //   Homecontroller.SelectedSpeciality(index);
                                                            // }
                                                            // else{
                                                            //   Homecontroller.SelectedSpeciality(0);
                                                            // }
                                                            // if(Homecontroller.IsSeeAllSpecialityClicked){
                                                            //   Alldoctors=[];
                                                            //   controller.doctorList=[];
                                                            //   Homecontroller.SelectedSpeciality(index);
                                                            //   controller.SelectedSpecialityIduser(Homecontroller.Specialities[index]['specialityId']);
                                                            //  // Homecontroller.SelectedSpecialityIduser(Homecontroller.Specialities[index]['specialityId']);
                                                            //   //  List doctor=controller.GetDoctorsBasedOnSpecialityId(controller.Specialities[index]['specialityId']);
                                                            //   // Alldoctors=doctor;
                                                            // }
                                                            // else{
                                                            //   Alldoctors=[];
                                                            //   controller.doctorList=[];
                                                            //   Homecontroller.SelectedSpeciality(0);
                                                            //   //Homecontroller.SelectedSpecialityIduser(0);
                                                            //   controller.SelectedSpecialityIduser(0);
                                                            //
                                                            //   //  List doctor=controller.GetDoctorsBasedOnSpecialityId(co
                                                            //   //Alldoctors=controller.GetDoctorsBasedOnSpecialityId(0);
                                                            // }
                                                            //controller.GetDoctorsBasedOnSpecialityId(controller.Specialities[index]['specialityId']);
                                                            //controller.SelectedItemSpeciality();
                                                            // if(controller.IsSeeAllSpecialityClicked){

                                                            //   controller.SelectedSpecialityIduser(controller.Specialities[index]['specialityId']);
                                                            //   //controller.doctorList=[];
                                                            //   //controller.GetAllDoctors();
                                                            // }
                                                            // else{
                                                            //   controller.SelectedSpeciality(index);
                                                            //   controller.SelectedSpecialityIduser(0);
                                                            //   //controller.doctorList=[];
                                                            //   //controller.GetAllDoctors();
                                                            // }




                                                            print("selected Index is : ${controller.AllSpeciality[index]['specialityId']}");
                                                          },
                                                          child:Card(
                                                            color: Isselected?Color(0xFF5E55EA):Colors.white,

                                                            elevation: 4,
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(10.0),

                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                Icon(Icons.local_hospital,color: Isselected?Colors.white:Colors.black,),
                                                                  Text(speciality['specialityname'],
                                                                    style: TextStyle(fontSize: 10, color:
                                                                    Isselected?Colors.white:
                                                                    Colors.black),
                                                                  ),


                                                                ],
                                                              ),



                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }


                                                ),
                                              ),


                                            ],
                                          ),
                                        )




                                    ),
                                  ]
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 500,
                        child: ListView.builder(
                          controller: controller.scrollController,
                            scrollDirection: Axis.vertical,
                            itemCount: controller.doctorsWithOutSpeciality.length+1,
                            itemBuilder: (context,index){
                            if(index==controller.doctorsWithOutSpeciality.length){
                              return CupertinoActivityIndicator();
                            }
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                                child: Container(
                                  height: 150,
                                  width:219,
                                  child: InkWell(
                                    onTap: (){
                                      controller.DoctorClick(controller.doctorsWithOutSpeciality[index].providerId!,spid:controller.doctorsWithOutSpeciality[index].specializationId);
                                        print("Provider id is : ${controller.doctorsWithOutSpeciality[index].providerId}");
                                      print(controller.doctorsWithOutSpeciality[index].specializationId);
                                      controller.GetSpecialityDoctor(controller.doctorsWithOutSpeciality[index].specializationId);
                                    },
                                    child: Card(
                                      elevation: 2,
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          //crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                height:120,
                                                width:120,
                                                decoration: BoxDecoration(
                                                  shape:BoxShape.circle,
                                                  border: Border.all(
                                                    color:Color(0xFF5E55EA),
                                                    width:2.0,
                                                  ),

                                                ),
                                                child: Center(child: ClipOval(child: Image.asset('assets/DoctorImages/dr_2.png',fit: BoxFit.cover,)))),

                                            Container(
                                              margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      controller.doctorsWithOutSpeciality[index].providerName!.capitalize!,
                                                      style:TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16,
                                                        color:Color(0xFF000000),
                                                      )
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                                        child: Icon(Icons.medical_information,size: 15,
                                                          color:Color(0xFFC1C1C1) ,
                                                        ),

                                                      ),
                                                      Text(controller.doctorsWithOutSpeciality[index].specializations!.capitalize!,
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 14,
                                                          color:Color(0xFFC1C1C1),
                                                        ),
                                                      ),
                                                    ],
                                                  )




                                                ],
                                              ),
                                            ),



                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              );
            }
          ),
        );
      }
    );
  }
}
