import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:patient_application/Screens/MainScreens/Dashboard/ProfileScreen/profile_screen.dart';
import 'package:patient_application/Screens/MainScreens/Dashboard/support_screen/support_screen.dart';
import 'package:patient_application/Screens/MainScreens/dashboard_screens/dashboard_controller.dart';

import '../Dashboard/HomeScreen/homeScreen.dart';
import '../Dashboard/notification_screen/notification.dart';

class Dashboard extends StatelessWidget {
   Dashboard({super.key});

  List dashboardScreens=[
    homeScreen(),
    SupportScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return GetBuilder<DashboardController>(
      init: DashboardController(),

      builder: (controller) {

        return DefaultTabController(
          length:4,
          initialIndex: 0,

          child: Scaffold(
            key:_scaffoldKey,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.BottomNavBarIndex,
          
              onTap: (position){
                print("position is : ${position}");
                controller.bottomNavBarIndexFunc(position);
                //controller.BottomNavBarIndex.value=position;
                print("Controller value index : ${controller.BottomNavBarIndex}");
              },
              backgroundColor: Color(0xFFFFFFFF),
              type:BottomNavigationBarType.fixed,
              selectedItemColor: Color(0xFF5E55EA),
              selectedIconTheme: IconThemeData(color:Color(0xFF5E55EA)),
              unselectedIconTheme: IconThemeData(color:Colors.black),
              unselectedItemColor: Colors.black,
                items:[
          
                  BottomNavigationBarItem(icon:Icon(Icons.home,
                    size: 20,
          
                  ),label:"Home"),
                  BottomNavigationBarItem(icon:Icon(Icons.support_agent,size: 20,),label:"Support",backgroundColor: Colors.black),
                  BottomNavigationBarItem(icon:Icon(Icons.notifications,size: 20,),label:"Notifications"),
                  BottomNavigationBarItem(icon:Icon(Icons.account_circle,size: 20,),label:"Profile"),
          
                ]
            ),
            body:dashboardScreens[controller.BottomNavBarIndex] ,
          ),
        );
      }
    );
  }
}
