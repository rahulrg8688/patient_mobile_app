 import 'package:get_storage/get_storage.dart';
import 'package:patient_application/ApiService/Api_service.dart';
import 'package:patient_application/GetStorage/shared_prefs_service.dart';

class  Apis{




 static const String baseUrl="https://uat.careaxes.net/uat-qa-api/api";


static  const String CheckUserApi="patients/check-user-list";
  static const String sendOtpApi="account/send-otp-patient";
  static const String LoginApi="account/patient-authenticate";
  static const String RefreshTokenApi="account/refresh-authentication";
static const String LogoutApi="account/logout";
static const String LabReportsApi="lab-transaction/fetch-for-technician-and-doctor";
static  String SearchDoctors(String a)=>"resources/masters1?searchParam=${a}";
static const String GetLabInvoice="lab-transaction/fetch-patient-lab-bill";
static const String GetPharmacyInvoice="reports/patient-pharmacy-reports-android";
static const String GetScanInvoice="book-scan-appointment/fetch-scan-report";
static const String GetPatientAdmissionApi="admissions/fetch";
static const GetLocations={
    'LocationApi':"resources/locations",
  };
static const String ChangePasswordApi="account/patient-change-password";
static const String ProfileUpdateApi="patients/update";

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


   final refid=SharedPrefsService().GetReferenceIdForPatient()?? '';
   final accountId=SharedPrefsService().GetAccountIdForPatient()??'';
    
    return "mobile/fetch?patientId=${refid}&accountId=${accountId}";
  }


}

// var authenticate={
//   'auth':"";
//
//  }