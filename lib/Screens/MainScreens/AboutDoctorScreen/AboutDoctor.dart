import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

import '../../../ModelClass/DoctorsModel.dart';
import 'AboutDoctorController.dart';

class Aboutdoctor extends StatelessWidget {
  final int? DoctId;
  final int? Spid;
  final Aboutdoctorcontroller aboutController;

  Aboutdoctor({Key? key, this.DoctId, this.Spid})
      : aboutController = Get.put(Aboutdoctorcontroller(Spid:Spid,DoctId:DoctId)),
        super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    aboutController.setDoctorIdAndDoctorId(Spid, DoctId);

    return GetBuilder<Aboutdoctorcontroller>(
        builder: (controller)
    {
      if (controller.IsLoading) {
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text("About Doctor")),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Center(child: CircularProgressIndicator()),
        );
      }

      // Ensure doctorabout has at least one item
      // if (controller.doctorabout.isEmpty) {
      //   return Scaffold(
      //     appBar: AppBar(
      //       title: Center(child: Text("About Doctor")),
      //       backgroundColor: Colors.white,
      //       elevation: 0,
      //     ),
      //     body: Center(child: Text("No doctor information available.")),
      //   );
      // }

      // Ensure index 0 is within bounds before accessing
      AllDoctors doctor = controller.doctorabout[0];

      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("About Doctor")),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(1, -1),
              end: Alignment(1, 0),
              colors: <Color>[Color(0xFFF8F2FF), Color(0xFFFFFFFF)],
              stops: <double>[0, 1],
            ),
          ),
          child: SingleChildScrollView(

            child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Doctor Profile Section
                  Container(
                    margin: EdgeInsets.fromLTRB(21, 20, 20, 22),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFE2E2E2)),
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment(-1, 0),
                        end: Alignment(1, 0),
                        colors: <Color>[Color(0xFFF8F2FF), Color(0xFFFFFFFF)],
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Doctor Profile Image
                          Container(
                            margin: EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Image.asset(
                              "assets/DoctorImages/dr_2.png",
                              height: 107,
                              width: 85,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Doctor Information
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dr. ${doctor.providerName!.capitalize}",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                SizedBox(height: 7),
                                Row(
                                  children: [
                                    Icon(Icons.medical_information, size: 15,
                                        color: Color(0xFFC1C1C1)),
                                    SizedBox(width: 5),
                                    Text(
                                      doctor.specializations ?? '',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xFFC1C1C1),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Text(
                                  '200m from You',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xFFC1C1C1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // About Section
                  Container(
                    margin: EdgeInsets.fromLTRB(21, 0, 21, 5),
                    child: Text(
                      'About',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(21, 0, 23.4, 20),
                    child: Text(
                      'Dr. ${doctor.providerName!
                          .capitalize} is professionally certified MBBS with more than 8+ years of experience. She has extensive knowledge of imaging and diagnostic procedures committed to delivering top care to all patients and providing a comfortable experience during procedures.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFFC1C1C1),
                      ),
                    ),
                  ),

                  // Select Date Section
                  Container(
                    margin: EdgeInsets.fromLTRB(21, 0, 21, 14),
                    child: Text(
                      'Select date',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(21, 0, 21, 14),
                    child:GestureDetector(
                        onTap: (){
                          print("calender");
                          aboutController.selectedDate(context);
                        },
                        child: Icon(Icons.calendar_month_rounded)),



                  ),
                  Container(
                    child: Text(controller.date),
                  ),
            aboutController.DoctorAvailableDatesList.length==0?Container(
              child: Text("Doctor is not available on this date"),
            ):
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width:double.infinity,
                          height: 120,

                          //
                          // decoration: BoxDecoration(
                          //   border:Border.all(width: 8,
                          //
                          //   )
                          // ),


                          child:ListView.builder(
                            scrollDirection: Axis.horizontal,
                              itemCount: aboutController.AvailableDatesOnly.length,
                              itemBuilder: (context,index){

                            DateTime date=aboutController.AvailableDatesOnly[index]['Date'];
                          String day=aboutController.AvailableDatesOnly[index]['Day'];
                          String MonthText=GetMonthName(date.month.toString());
                          String WeekText=GetWeekName(date.weekday);

                           return Container(


                             width: 80,
                             height:120,
                             child: Card(

                                color:Colors.white,

                               margin: EdgeInsets.all(10),

                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,

                                   children: [
                                     Text(date.day.toString()),
                                    Text(WeekText),
                                     Text(MonthText),
                                   ],
                                 ),
                               ),
                             ),
                           );
                          })
                        ),
                      ],
                    ),
                  ),


                  // Select Time Section
                  Container(
                    margin: EdgeInsets.fromLTRB(21, 21, 21, 14),
                    child: Text(
                      'Select Time',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  SelectTime(context),
                  aboutController.IsLoading?CircularProgressIndicator():
                  Container(
                    padding: EdgeInsets.fromLTRB(10,0,0,0),
                    height:200,

                    width:double.infinity,

                    child: Column(
                        children: [
                          Expanded(
                              child:
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    aboutController.TimeSlots.length==0 || aboutController.DoctorAvailableDatesList.length==0?Text("No data"):

                                    Container(

                                      height: 200,
                                      color:Colors.white,


                                      width:double.infinity,

                                      // Adjust height as needed
                                      child: GridView.builder(
                                          scrollDirection: Axis.horizontal,

                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4, // Number of rows you want
                                            mainAxisSpacing: 10.0,
                                            crossAxisSpacing: 10.0,
                                            childAspectRatio: 0.4, // Adjust as needed for item width/height ratio
                                          ),
                                          itemCount:aboutController.TimeSlots.length, // Number of items
                                          itemBuilder: (context, index) {
                                            final TimeSlot=aboutController.TimeSlots[index];
                                            //bool Isselected=controller.selectedSpecialityIndexGrid==index;

                                            return Container(

                                              height:10,
                                              width:25,
                                              color: Color(0xFFFFFFFF),


                                              // width: 550, // Fixed width for each card
                                              child: GestureDetector(
                                                onTap: () {




                                                  print(index);
                                                  //controller.SelectedSpecialityIduser(controller.Specialities[index]['specialityId']);
                                                  //controller.doctorList=[];
                                                  //controller.GetAllDoctors();

                                                  //print("selected Index is : ${controller.Specialities[index]['specialityId']}");
                                                },
                                                child:Card(
                                                  //color: Isselected?Color(0xFF5E55EA):Colors.white,
                                                  color: Color(0xFFFFFFFF),
                                                  elevation: 4,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5.0),

                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        //Icon(Icons.local_hospital,color: Isselected?Colors.white:Colors.black,),
                                                        Text(
                                                            TimeSlot.toString()
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

                  // Online/Offline Selection
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0F121212),
                            offset: Offset(0, 4),
                            blurRadius: 13,
                          ),
                        ],
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print("Online");
                                // Implement online status logic if needed
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(33),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x0F121212),
                                      offset: Offset(0, 4),
                                      blurRadius: 13,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Text(
                                    'Online',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("Offline");
                                aboutController
                                    .GetDoctor(); // Example of calling a method in the controller
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Offline',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: (){}, child:
                  Text("Book Appointment"))
                ]
            ),
          ),
        ),
      );
    });

  }
  String GetMonthName(String month){
    switch(month){
      case "1":
        return "Jan";
      case "2":
        return "Feb";
      case "3":return "Mar";
      case "4":return "Apr";
      case "5":return "may";
      case "6":return "Jun";
      case "7":return "Jul";
      case "8":return "Aug";
      case "9":return "sep";
      case "10":return "Oct";
      case "11":return "Nov";
      case "12":return "Dec";
      default :
        return '';
    }
  }
  String GetWeekName(int Weekday){
    switch(Weekday){
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:return "Wed";
      case 4:return "Thu";
      case 5:return "Fri";
      case 6:return "Sat";
      case 7:return "Sun";

      default :
        return '';
    }
  }
  Widget SelectTime(BuildContext context) {
    return Center(
        child: Container(
            height: 52,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.92,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                    begin: Alignment(-1, 0),
                    end: Alignment(1, 0),
                    colors: <Color>[Color(0xFFFFF4F4), Color(0xFFF9F4FF)],
                    stops: <double>[0, 1]
                )
            ),
            child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: aboutController.Sessions.length,
                              itemBuilder: (context, index) {
                                bool isSelected=index==aboutController.index;
                                return InkWell(
                                  onTap: (){
                                   print(index);
                                   aboutController.Click(index);
                                   if(index==aboutController.index){
                                     print("yes clicked on ${aboutController.Sessions[aboutController.index]}");

                                   }
                                    print(aboutController.Sessions[index]);
                                  },
                                  child: Center(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                      child:
                                      Container(
                                        width: 120,
                                        height:30,
                                        //margin: EdgeInsets.only(left: 20,right: 20),
                                        decoration: BoxDecoration(
                                          color:isSelected?Colors.white:Colors.transparent,
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(
                                            color:isSelected?Colors.white:Colors.transparent,
                                          )
                                        ),
                                        child: Center(
                                          child: Text(aboutController
                                              .Sessions[index],
                                            style: TextStyle(
                                              color:isSelected?Colors.black:Colors.black
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              }
                          )
                      )
                    ]
                )
            )
        )
    );
  }

  }




