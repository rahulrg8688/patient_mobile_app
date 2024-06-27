 import 'package:get_storage/get_storage.dart';
import 'package:patient_application/ApiService/Api_service.dart';

class  Apis{




 static const String baseUrl="https://qa.careaxes.net/fernandez-api/api";


static  const String CheckUserApi="patients/check-user-list";
  static const String sendOtpApi="account/send-otp-patient";
  static const String LoginApi="account/patient-authenticate";
  static const String RefreshTokenApi="account/refresh-authentication";


  static const GetLocations={
    'LocationApi':"resources/locations",
  };

  static final SpecialityDcotors={
    'Allspecialities':GetSpecialities(),
    'AllDoctorsList':"providers/fetch-provider-list-items",
    'DoctorAvailableDates':"provider-locations/fetch-provider-availability-dates",
    'DoctorAvailableTime':"provider-locations/fetch-slots-for-multipledays",
 };
  static final Appointment={
    'BookingAppointmentApi':"appointments/fetch-all"
  };
  static String GetSpecialities(){
   GetStorage storage=GetStorage();
   final refid=storage.read('referenceId')?? '';
   final accountId=storage.read('accountId')??'';
    
    return "mobile/fetch?patientId=${refid}&accountId=${accountId}";
  }


}

// var authenticate={
//   'auth':"";
//
//  }