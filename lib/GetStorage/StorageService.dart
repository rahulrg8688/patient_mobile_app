import 'package:get_storage/get_storage.dart';

class  StorageService{
  static final GetStorage storage=GetStorage();

  static int GetReferenceId(){
    return storage.read('referenceId');
  }

  static int GetPatientAccountId(){
    return storage.read('accountId');
  }
}