import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:patient_application/Screens/MainScreens/Dashboard/ProfileScreen/lab_invoice_screen/lab_invoice_report_controller.dart';

class LabReportsInvoiceScreen extends StatelessWidget {
   LabReportsInvoiceScreen({super.key});
   LabInvoiceReportController lab_invoice_report_controller=Get.put(LabInvoiceReportController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LabInvoiceReportController>(
      builder: (lab_invoice_report_controller) {
        return Scaffold(
          appBar: AppBar(
            title:Text("Lab Invoice")
          ),
          body:Column(
            children: [
              Expanded(
                //height:double.infinity,
                child: ListView.builder(
                    itemCount:lab_invoice_report_controller.LabsInvoiceList.length ,

                    itemBuilder: (context,index){
                  return Padding(padding: EdgeInsets.all(7),
                    child: Container(
                      height:150,
                      width:219,
                      child: GestureDetector(
                        onTap: (){
lab_invoice_report_controller.onClickNavigate(lab_invoice_report_controller.LabsInvoiceList[index].encryptedHeaderId!,
    Billed:lab_invoice_report_controller.LabsInvoiceList[index].billType);
                        },
                        child: Card(
                          elevation: 1,
                          margin: EdgeInsets.symmetric(vertical: 6),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("${lab_invoice_report_controller.LabsInvoiceList[index].requisitionNumber}"),
                                  Expanded(

                                    child: EachField("Doctor name","${lab_invoice_report_controller.LabsInvoiceList[index].doctorName}")

                                  ),
                                  Expanded(
                                    //margin: EdgeInsets.fromLTRB(0, 4, 0,4),
                                    child: EachField("Patient name : ", "${lab_invoice_report_controller.LabsInvoiceList[index].patientName}")

                                  ),
                                  Expanded(
                                    //margin: EdgeInsets.fromLTRB(0, 4, 0,4),

                                    child:
                                    EachField("Date : ", "${lab_invoice_report_controller.LabsInvoiceList[index].createdDate}")


                                  ),
                                  Expanded(child:
                                  EachField("Amount", "${lab_invoice_report_controller.LabsInvoiceList[index].amount}")
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),
                    ),

                  );

                }),
              )
            ],
          )
        );
      }
    );
  }
  Widget EachField(String text,String value){
    return Row(
      children: [
        Text("$text : "),
        Text("$value")
      ],
    );
  }
}
