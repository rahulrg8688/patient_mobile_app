import 'package:get/get.dart';


import '../../../../../ModelClass/GetDoctorBookings.dart';
import '../../HomeScreen/homeController.dart';

class AppointmentController extends GetxController{

  homeController homecontroller=Get.put(homeController());
List<GetDoctorBookings> AppointmentDoctors=[];
  @override
  void onInit() {
   GetAppointmentDoctors();
    // TODO: implement onInit
    super.onInit();
  }
  Future<void> GetAppointmentDoctors() async{
    AppointmentDoctors=await homecontroller.GetBookingsDoctors();
    print("Appointmnet length is : ${AppointmentDoctors.length}");
    print(AppointmentDoctors[0].doctorName);
    update();
  }
}