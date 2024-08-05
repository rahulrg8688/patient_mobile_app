import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static final SharedPrefsService _instance = SharedPrefsService._internal();
  SharedPreferences? _prefs;

  factory SharedPrefsService() {
    return _instance;
  }

  SharedPrefsService._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs {
    if (_prefs == null) {
      init();
      throw Exception("SharedPreferences not initialized. Call init() before accessing it.");
    }
    return _prefs!;
  }
  setReferenceIdForPatient(int PatientId){
    if(_prefs==null){
      init();
    }
    _prefs?.setInt('referenceId', PatientId);
  }
  GetReferenceIdForPatient(){
    int? ReferenceId=_prefs?.getInt('referenceId');
    print("Reference Id is :: $ReferenceId");
    if(ReferenceId!=null){
      return ReferenceId;
    }
    else{
      return null;
    }

  }
  setAccountIdForPatient(int AccountId){
    if(_prefs==null){
      init();
    }
    _prefs?.setInt('AccountId',AccountId);
  }
  GetAccountIdForPatient(){
   int? AccountId= _prefs?.getInt('AccountId');
  print("AccountId shared prefs is :: $AccountId");
   return AccountId;
  }
  setMobileNumberForPatient(String MobileNumber){
    if(_prefs==null){
      init();
    }
    _prefs?.setString('MobileNumber', MobileNumber);
  }
  GetMobileNumberForPatient(){
    String? MobileNo=_prefs?.getString('MobileNumber');
    print("Mobile number is :: ${MobileNo}");
    return MobileNo;
  }
  SetPatientName(String PatientName){
    if(_prefs==null){
      init();
    }
    if(PatientName==""||PatientName.isEmpty){
      _prefs?.setString('patientName','');
    }
    _prefs?.setString('patientName',PatientName);
  }
  GetPatientName(){
    String? PatientName=_prefs?.getString('patientName');
    return PatientName;
  }
  SetPreferredLocation(int LocationId){
    if(_prefs==null){
      init();
    }
    _prefs?.setInt('LocationId',LocationId);
  }
  GetPrefferedLocation(){
    int? LocationId=_prefs?.getInt('LocationId');
    return LocationId;
  }
  SetPatientInfo(){

  }

}
