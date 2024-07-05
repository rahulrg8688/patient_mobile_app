import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:patient_application/Screens/MainScreens/Dashboard/ProfileScreen/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
ProfileController controller=Get.put(ProfileController());
void handleInvoiceTap(int index){
  controller.MyInvoiceListSetIndex(index);
}
void handleRecordsTap(int index){
  controller.MyRecordsListSetIndex(index);
}
void handleGeneralTap(int index){
  controller.MyGeneralListSetIndex(index);
}
void handleAccountTap(int index){
  controller.MyAccountListSetIndex(index);
}
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Center(child: Text("My Account",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily:'Poppins',
            ),

            ),

            ),
          ),
          body: SingleChildScrollView(

            child: Container(
              color:Color(0xffD9D9D9),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    MainText("My Records"),
                    BuildRecordInvoices(269,controller.MyRecordsList, handleRecordsTap),
                    MainText("My Invoices"),
                    BuildRecordInvoices(210,controller.MyInvoiceList,handleInvoiceTap),
                    MainText("General"),
                    BuildRecordInvoices(440,controller.GeneralList,handleGeneralTap),
                    MainText("Account"),
                    BuildRecordInvoices(155, controller.AccountList,handleAccountTap ),
                    ]
                    ),
            
                ),
              ),
          ),
          );
      }
    );

  }

  Widget ReturningListView(IconData icons,String text){
    return ListTile(
      leading:Icon(icons),
      title: Text(text),


    );
  }

  Widget MainText(String text){
    return Text(text,
        style:TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xff9CA4AB)
        ));
  }
  Widget BuildRecordInvoices(double height,List recordList,void Function(int) onItemTap){
   return  Container(
     height: height,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.all(Radius.circular(13)),
       color: Colors.white,
     ),
     width:double.infinity,

     child:Container(
       margin: EdgeInsets.all(20),
      // height:256,
       decoration: BoxDecoration(
           border: Border.all(
               color:Color(0xffD9D9D9)
           ),
           borderRadius: BorderRadius.all(Radius.circular(13))
       ),

       child: ListView.builder(
         physics: NeverScrollableScrollPhysics(),
         itemCount: recordList.length,
         itemBuilder: (context,index){
           return Container(
             decoration: BoxDecoration( //
               border: Border(bottom: BorderSide(
                   color: Color(0xffD9D9D9)
               )),
             ),
             child:ListTile(
               title: recordList[index]['Text'],
               leading:recordList[index]['IconData'],
                onTap: () {
                 print("Index of pressed is : ${index}");
                  onItemTap(index);
                },
             ),


           );
         },
       ),
     ),

   );
  }
}
