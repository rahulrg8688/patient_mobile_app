import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:patient_application/Screens/MainScreens/Dashboard/ProfileScreen/pharma_invoice_screen/pharma_invoice_controller.dart';

class PharmaInvoiceScreen extends StatelessWidget {
   PharmaInvoiceScreen({super.key});
   PharmaInvoiceController pharmaInvoiceController=Get.put(PharmaInvoiceController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PharmaInvoiceController>(
      builder: (pharmaInvoiceController) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Pharmacy Invoices"),
          ),
          body: Column(
            children: [
              Expanded(child: ListView.builder(
                  itemCount:pharmaInvoiceController.PatientPharmacyList.length ,
                  itemBuilder: (context,index){
                    return Padding(padding: EdgeInsets.all(7),
                      child: Container(
                        height:150,
                        width:219,
                        child: GestureDetector(
                          onTap: (){
                            pharmaInvoiceController.onNavigateToWebView(pharmaInvoiceController.PatientPharmacyList[index].encryptedPharmacySaleHeaderId!);
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
                                    Text("${pharmaInvoiceController.PatientPharmacyList[index].billNumber}"),

                                    Expanded(
                                      //margin: EdgeInsets.fromLTRB(0, 4, 0,4),
                                        child: EachField("Patient name : ", "${pharmaInvoiceController.PatientPharmacyList[index].patientName}")

                                    ),
                                    Expanded(child: EachField("Date : ",ConvertDateInFormat("${pharmaInvoiceController.PatientPharmacyList[index].saleDate.toString()}"))),

                                    Expanded(child:
                                    EachField("Amount", "${pharmaInvoiceController.PatientPharmacyList[index].totalAmount}")
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ),
                      ),
                    );
                  }))
            ],
          ),

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
   String ConvertDateInFormat(String date){
    DateTime datetime=DateTime.parse(date);
    DateFormat formatter=DateFormat('dd MMMM yyyy,HH:mm');
    String formattedDate=formatter.format(datetime);
    return formattedDate;
   }
}
