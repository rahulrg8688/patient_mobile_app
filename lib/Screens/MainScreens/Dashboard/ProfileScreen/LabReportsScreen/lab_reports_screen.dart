import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:patient_application/Screens/MainScreens/Dashboard/ProfileScreen/LabReportsScreen/lab_reports_controller.dart';

class LabReportsScreen extends StatelessWidget {
  LabReportsScreen({super.key});
LabReportsController labcontroller=Get.put(LabReportsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LabReportsController>(
      builder: (labcontroller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Lab Reports"),
          ),
          body: Column(
            children: [
              Expanded(

                child: ListView.builder(
                    itemCount: labcontroller.LabReportsList.length,
                    itemBuilder: (context,index){

                      return Container(
                        height: 90,
                        width: 220,
                        margin:EdgeInsets.all(9),
                        child:GestureDetector(
                          onTap: (){
                            labcontroller.navigateToLabBookDetail(labcontroller.LabReportsList[index].encryptedNewLabBookingDetailId!);
                          },
                          child: Card(
                            elevation: 1,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("${labcontroller.LabReportsList[index].requisitionNumber}"),
                                  Expanded(

                                    child: Row(
                                      children: [
                                        Text("Prescribed By: "),
                                        Text("${labcontroller.LabReportsList[index].doctorName}"),
                                      ],
                                    ),

                                  ),
                            Expanded(
                              //margin: EdgeInsets.fromLTRB(0, 4, 0,4),
                              child: Row(
                                children: [
                                  Text("Lab name : "),
                                  Text("${labcontroller.LabReportsList[index].testName}"),
                                ],
                              ),
                            ),
                                Expanded(
                                    //margin: EdgeInsets.fromLTRB(0, 4, 0,4),
                                    child: Row(
                                      children: [
                                        Text("Date : "),
                                        Text("${labcontroller.LabReportsList[index].bookedDate}"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      );

                }),
              )
            ],
          ),
        );
      }
    );
  }
}
