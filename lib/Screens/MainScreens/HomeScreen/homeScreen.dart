import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_application/Screens/MainScreens/HomeScreen/homeController.dart';

class homeScreen extends StatelessWidget {
  homeScreen({super.key});
  final homeController controller = Get.put(homeController());

  @override
  Widget build(BuildContext context) {
    List Alldoctors=controller.doctorList;
    return Scaffold(
      bottomNavigationBar: Obx(()=>BottomNavigationBar(
          currentIndex: controller.BottomNavBarIndex.value,

          onTap: (position){
            print("position is : ${position}");
            controller.bottomNavBarIndexFunc(position);
            //controller.BottomNavBarIndex.value=position;
            print("Controller value index : ${controller.BottomNavBarIndex}");
          },

          backgroundColor: Color(0xFFFFFFFF),
          type:BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF5E55EA),
          selectedIconTheme: IconThemeData(color:Color(0xFF5E55EA)),
          unselectedIconTheme: IconThemeData(color:Colors.black),
          unselectedItemColor: Colors.black,
          items:[

            BottomNavigationBarItem(icon:Icon(Icons.home,
              size: 20,

            ),label:"Home"),
            BottomNavigationBarItem(icon:Icon(Icons.support_agent,size: 20,),label:"Support",backgroundColor: Colors.black),
            BottomNavigationBarItem(icon:Icon(Icons.notifications,size: 20,),label:"Notifications"),
            BottomNavigationBarItem(icon:Icon(Icons.account_circle,size: 20,),label:"Profile"),

          ]
      ),
      ),

      body: GetBuilder<homeController>(
          builder: (controller) {
            return SizedBox(
              width:double.infinity,

              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Container(
                      child: Stack(
                          clipBehavior:Clip.none,
                          children: [
                            Container(
                              color: Color(0xFF5E55EA),
                              height: 200,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 22, 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 27.5, 0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0, 0, 12, 0),
                                                  width: 62,
                                                  height: 62,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius
                                                        .circular(31),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0, 11, 0, 11),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .start,
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets
                                                            .fromLTRB(
                                                            0, 0, 0, 4),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topLeft,
                                                          child: Text(
                                                            'Hello Welcome',
                                                            style: TextStyle(
                                                              fontFamily: 'Poppins',
                                                              fontWeight: FontWeight
                                                                  .w400,
                                                              fontSize: 10,
                                                              color: Color(
                                                                  0xFFFFFFFF),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Lora Maddison',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight
                                                              .w400,
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xFFFFFFFF),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 11, 0, 11),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color(0xFFD5D5D5)),
                                                borderRadius: BorderRadius
                                                    .circular(10),
                                                color: Color(0x99000000),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    14, 11.5, 0, 11.5),
                                                child: DropdownButton(
                                                  dropdownColor: Color(
                                                      0x99000000),
                                                  value: controller
                                                      .selectedLocation,
                                                  onChanged: (val) {
                                                    print(val);
                                                    controller.LocationSelected(
                                                        val.toString());
                                                    print(controller
                                                        .selectedLocation);
                                                  },
                                                  items: controller.addlocation
                                                      .map((loc) {
                                                    return DropdownMenuItem(
                                                      child: Text(
                                                        loc['name'],
                                                        style: TextStyle(
                                                            color: Colors
                                                                .white),
                                                      ),
                                                      value: loc['id'],
                                                    );
                                                  }).toList(),
                                                  isExpanded: true,
                                                  underline: SizedBox(),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 34,
                              right: 34,
                              top: 160,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    begin: Alignment(-1, 0),
                                    end: Alignment(1, 0),
                                    colors: <Color>[
                                      Color(0xFFFFFFFF),
                                      Color(0xFFF9F4FF)
                                    ],
                                    stops: <double>[0, 1],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x0F121212),
                                      offset: Offset(0, 4),
                                      blurRadius: 13,
                                    ),
                                  ],
                                ),
                                child: SizedBox(
                                  width: 292,
                                  height: 56,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(11, 11, 0, 11),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 30, 0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color(0xFFE2E2E2)),
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    33),
                                                gradient: LinearGradient(
                                                  begin: Alignment(-2.017, 0),
                                                  end: Alignment(1.729, 0),
                                                  colors: <Color>[
                                                    Color(0xFFFFFFFF),
                                                    Color(0xFFFFFFFF)
                                                  ],
                                                  stops: <double>[0.277, 1],
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x0F121212),
                                                    offset: Offset(0, 4),
                                                    blurRadius: 13,
                                                  ),
                                                ],
                                              ),
                                              child: Container(
                                                width: 91,
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 7, 0.9, 7),
                                                child:
                                                Text(
                                                  'Online',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: Color(0xFF000000),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 8, 0, 8),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    33),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x0F121212),
                                                    offset: Offset(0, 4),
                                                    blurRadius: 13,
                                                  ),
                                                ],
                                              ),
                                              child:
                                              Text(
                                                'Offline',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                33),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x0F121212),
                                                offset: Offset(0, 4),
                                                blurRadius: 13,
                                              ),
                                            ],
                                          ),
                                          child:
                                          Text(
                                            'Both',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]
                      ),
                    ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        CarouselSlider.builder(
                          itemCount: controller.carousals.length,
                          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                              Container(
                                child:Image(
                                  image: controller.carousals[itemIndex],
                                )
                              ),
                          options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                            onPageChanged: (index,reason){
                            controller.CarouralIndex(index);
                            }
                        ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(controller.carousals.length, (index){
            return Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: controller.currentSlide == index
            ? Color(0xFF5E55EA)
                : Color.fromRGBO(0, 0, 0, 0.4),
            ),
            );
            }),

                        ),
                      ],
                    ),
                  ),
                    Container(
                      padding: EdgeInsets.all(19),
                      margin: EdgeInsets.fromLTRB(0, 0, 7.1, 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 13.5, 0),
                            child: SizedBox(
                              width: 253.5,
                              child: Text(
                                'Specialization',
                                style: TextStyle(
                                 fontFamily:  'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.fromLTRB(0, 2, 0, 1),
                            child: Text(
                              'See all',
                              style: TextStyle(
                               fontFamily:  'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFF5E55EA),
                              ),
                            ),
                          ),
                        ],
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
                                          itemCount: controller.Specialities.length, // Number of items
                                          itemBuilder: (context, index) {
                                            final speciality=controller.Specialities[index];
                                            //
                                            bool Isselected=( controller.selectedSpecialityIndexGrid==index &&controller.IsSeeAllSpecialityClicked);
                                            List Alldoctors=[];


                                                return Container(

                                                    height:10,
                                                 width:30,



                                                 // width: 550, // Fixed width for each card
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.SelectedItemSpeciality();
                                                      print("IsSpid CLicked ${controller.IsSeeAllSpecialityClicked}");
                                                      print(" Spec id is : ${controller.Specialities[index]['specialityId']}");
                                                      if(controller.IsSeeAllSpecialityClicked){
                                                        Alldoctors=[];
                                                        controller.SelectedSpeciality(index);
                                                        controller.SelectedSpecialityIduser(controller.Specialities[index]['specialityId']);
                                                      //  List doctor=controller.GetDoctorsBasedOnSpecialityId(controller.Specialities[index]['specialityId']);
                                                       // Alldoctors=doctor;
                                                      }
                                                      else{
                                                        Alldoctors=[];
                                                        controller.SelectedSpeciality(index);
                                                        controller.SelectedSpecialityIduser(0);
                                                        //  List doctor=controller.GetDoctorsBasedOnSpecialityId(co
                                                        //Alldoctors=controller.GetDoctorsBasedOnSpecialityId(0);
                                                      }
                                                      //controller.GetDoctorsBasedOnSpecialityId(controller.Specialities[index]['specialityId']);
                                                      //controller.SelectedItemSpeciality();
                                                     // if(controller.IsSeeAllSpecialityClicked){
                                                        controller.SelectedSpeciality(index);
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




                                                      print("selected Index is : ${controller.Specialities[index]['specialityId']}");
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
                                                             )

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
                    Padding(
                      padding: const EdgeInsets.all(19.0),
                      child: MyContainer(MainText: "Doctor's"),
                    ),

                    controller.IsLoading?CircularProgressIndicator(): controller.SpecializiedDoctors.length==0?Text("No data"):
                    Container(
                      height:180,


                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.SpecializiedDoctors.length,
                          itemBuilder: (context,index){
                            return Container(
                              height: 90,
                              width:220,

                              child: GestureDetector(
                                onTap: (){
                                  int DoctId= controller.SpecializiedDoctors[index]['DoctorId'];
                                  int Spid=controller.SpecializiedDoctors[index]['specialityId'];

                                  controller.DoctorParticularClick(DoctId,Spid);

                                  print("clicked");
                                  print(controller.SpecializiedDoctors[index]['DoctorId']);
                                  print(controller.SpecializiedDoctors[index]['specialityId']);
                                },
                                child: Card(
                                  elevation: 3,
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            height:89,
                                            width:80,
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
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "${"Dr"}.${controller.SpecializiedDoctors[index]['DoctorName'].toString().capitalize}",
                                                    style:TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16,
                                                      color:Color(0xFF000000),
                                                    )
                                                  ),
                                                  Text("4.5",
                                                  style:TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color:Color(0xFFB5B5B5),
                                                  ),
                                                  )
                                                ],
                                              ),
                                            ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                                child: Icon(Icons.medical_information,size: 15,
                                                color:Color(0xFFC1C1C1) ,
                                                ),

                                            ),

                                            Text(controller.SpecializiedDoctors[index]['speciality'],
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
                                ),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(19.0),
                      child: MyContainer(MainText: "Recent Doctors"),
                    ),
//down list for specialist using list view builder only desig has done
                    Container(
                      height:300,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: controller.GetBookings.length,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                              child: Container(
                                height: 150,
                                width:219,
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
                                                  controller.GetBookings[index].providerName!.capitalize!,
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
                                                  Text(controller.GetBookings[index].specializationName!.capitalize!,
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
                            );
                          }),
                    )




                            ],
                          ),
                        )







            );

          }
      ),
    );
  }

  Widget MyContainer({required String MainText}){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 13.5, 0),
            child: SizedBox(
              width: 253.5,
              child: Text(
                "${MainText}",
                style: TextStyle(
                  fontFamily:  'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 2, 0, 1),
            child: Text(
              'See all',
              style: TextStyle(
                fontFamily:  'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF5E55EA),
              ),
            ),
          ),
        ],
      );


  }

  }

