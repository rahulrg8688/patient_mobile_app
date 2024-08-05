import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:patient_application/Screens/MainScreens/Dashboard/ProfileScreen/MyAppointmentScreen/appointment_controller.dart';

class AppointmentScreen extends StatelessWidget {
  AppointmentScreen({super.key});
AppointmentController appointment_controller=Get.put(AppointmentController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentController>(
      builder: (appointment_controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("My Appointments"),
          ),
          body: Expanded(

            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: appointment_controller.AppointmentDoctors.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                    child: Container(
                      width:double.infinity,
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
                                        appointment_controller.AppointmentDoctors[index].providerName!.capitalize!,
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
                                        Text(appointment_controller.AppointmentDoctors[index].specializationName!.capitalize!,
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
          ),

        );
      }
    );
  }
}
