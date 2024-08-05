import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'my_profile_controller.dart';

class MyProfileScreen extends StatelessWidget {
   MyProfileScreen({super.key});
  MyProfileController my_profile_controller=Get.put(MyProfileController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProfileController>(
      builder: (my_profile_controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("My Profile"),
          ),
          body: Column(
            children: [
                Text("First name"),
                  myForm(my_profile_controller.Firstname, "First name"),
              Text("second name"),
              myForm(my_profile_controller.Lastname, "Last name"),
              ElevatedButton(onPressed: (){
                my_profile_controller.ButtonClick();
              }, child: Text("Update"))
            ],
          ),
        );
      }
    );
  }
Widget myForm(TextEditingController textcontroller,String text){
    return TextFormField(
      controller: textcontroller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: text
      ),
    );
}
}
