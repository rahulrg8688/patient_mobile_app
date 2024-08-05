import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:patient_application/Screens/MainScreens/Dashboard/ProfileScreen/Scan_invoice_component/scan_invoice_controller.dart';

class ScanInvoiceScreen extends StatelessWidget {
   ScanInvoiceScreen ({super.key});
ScanInvoiceController scanInvoiceController=Get.put(ScanInvoiceController());
  @override
  Widget build(BuildContext context) {

    return GetBuilder<ScanInvoiceController>(
      builder: (scanInvoiceController) {
        return Scaffold(
appBar: AppBar(
  title: Text("Scan Invoice"),
),
          body:Column(
            children: [
              Expanded(child: ListView.builder(
                  itemCount: scanInvoiceController.ScanInvoiceList.length,
                  itemBuilder: (context,index){
                    return Padding(padding: EdgeInsets.all(7),
                    child: Container(
                      height:150,
                      width:219,
                      child: GestureDetector(
                        onTap: (){
                          scanInvoiceController.onNavigateToWebView(scanInvoiceController.ScanInvoiceList[index].encryptedBookScanAppointmentId!,RecieptId: scanInvoiceController.ScanInvoiceList[index].encryptedRecieptId);
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
                                  Text("${scanInvoiceController.ScanInvoiceList[index].requisitionNumber}"),

                                  Expanded(
                                    //margin: EdgeInsets.fromLTRB(0, 4, 0,4),
                                      child: EachField("Test name : ", "${scanInvoiceController.ScanInvoiceList[index].scanTestName}")

                                  ),
                                  Expanded(child: EachField("Report Date : ",("${scanInvoiceController.ScanInvoiceList[index].appointmentDate.toString()},${scanInvoiceController.ScanInvoiceList[index].appointmentTime}"))),

                                  Expanded(child:
                                  EachField("Amount", "${scanInvoiceController.ScanInvoiceList[index].netAmount}")
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
