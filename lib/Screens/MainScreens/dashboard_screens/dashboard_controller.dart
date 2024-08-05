import 'package:get/get.dart';

class DashboardController extends GetxController{

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("i am at dashboard");
  }

  int BottomNavBarIndex=0;


  void bottomNavBarIndexFunc(int val){
    BottomNavBarIndex=val;

    update();
  }

}