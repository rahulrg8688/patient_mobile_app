import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:patient_application/Screens/MainScreens/Dashboard/ProfileScreen/Change_password_screen/change_password_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
   ChangePasswordScreen({super.key});
   ChangePasswordController change_password_controller=Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      builder: (change_password_controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Change password"),
          ),
          body: Column(
            children: [
              Text("Enter your password"),
              FormFiled(change_password_controller.password1, "Enter your password"),
              FormFiled(change_password_controller.password2, "Re Enter your password"),
              ElevatedButton(onPressed: (){
              change_password_controller.changePasswordApi();
              }, child: Text("Change password"))



            ],
          ),
        );
      }
    );
  }
  Widget FormFiled(TextEditingController a,String text){
    return TextFormField(
controller: a,
      validator: (val){
        if(val==null || val.isEmpty){
          return "Plz enter the field";
        }
        return null;
      },
      decoration: InputDecoration(
  hintText: text,

      border: OutlineInputBorder(),
      ),
    );
  }


}
