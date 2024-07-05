import 'package:get/get.dart';

class DashboardController extends GetxController{

  int BottomNavBarIndex=0;


  void bottomNavBarIndexFunc(int val){
    BottomNavBarIndex=val;

    update();
  }

}