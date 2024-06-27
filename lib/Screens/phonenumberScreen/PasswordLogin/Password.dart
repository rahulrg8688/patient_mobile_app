import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_application/Screens/phonenumberScreen/PhoneNumber/PhoneNumberController.dart';

import 'PasswordController.dart';

class Password extends StatelessWidget {
  Password({super.key});
  var formkey=GlobalKey<FormState>();
  Passwordcontroller controller=Passwordcontroller();
  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
appBar: AppBar(),
      body: GetBuilder<Passwordcontroller>(

        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),

              child:
              Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
              width: 280,
              margin: EdgeInsets.fromLTRB(1, 0, 1, 44),
              child: Align(
              alignment: Alignment.topLeft,
              child: Text(
              '''Please enter your password  to verify''',
              style: TextStyle(
              fontFamily: 'Playfair Display',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Color(0xFF000000),
              ),
              ),
              ),
              ),
              Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 19),
              child: Align(
              alignment: Alignment.topLeft,
              child: Text(
              'Enter Your password',
              style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFF000000),
              ),
              ),
              ),
              ),
              Form(
              key: formkey,

              child: Container(
              margin: EdgeInsets.only(bottom: isKeyboardVisible ? 20 : 345),
              child: TextFormField(
              controller: controller.passwordValue,
                obscureText: controller.togglepassword,
              onTap: (){
                    controller.IsTappedChange();


              },
              validator: (val){
              if(val==null || val.isEmpty) {
              return "Plz enter only numbers";
              }
              else if(!val.isNum){
              return "Plz enter only numbers";
              }
              else if(val.length<10){
              return "Plz enter valid mobile number";
              }
              return null;
              },


              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
           suffixIcon: InkWell(onTap:(){
             print("pressed");
             controller.passwordChange();
             print(controller.togglepassword);
           },child: controller.togglepassword?Icon(Icons.visibility):Icon(Icons.visibility_off_outlined)),
                border: OutlineInputBorder(),


              ),

          ),

              ),
              ),
              ElevatedButton(onPressed: (){
                controller.PasswordLogin();
              }, child: Text("Login",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: controller.IsTapped?Colors.white:Colors.white,
                ),
              ),
                style: ElevatedButton.styleFrom(

                    padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: controller.IsTapped?Color(0xFF5E55EA):Color(0xFFC1C1C1)
                ),

              )
          ],
              ),
              ),
              );
        }
      )
    );
  }
}
