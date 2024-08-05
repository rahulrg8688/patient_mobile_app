import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart' as uu;
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:patient_application/Apicalls/Apis.dart';
import 'package:patient_application/GetStorage/HiveBox.dart';
import 'package:patient_application/ModelClass/RefreshTokenModel/TokenRefresh.dart';
class ApiService{
  late String? baseUrl;
  static final ApiService _instance=ApiService._internal();

  bool isLoading=false;
ApiService._internal();
  final GetStorage storage=GetStorage();
RefreshToken token=RefreshToken();
  final dioClient = dio.Dio();


  static ApiService getInstance({required String baseUrl}) {
    _instance.baseUrl = baseUrl;
    return _instance;
  }
  Future<void> putrequestForRefreshToken() async{
    final response=await http.put(Uri.parse("https://qa.careaxes.net/fernandez-api/api/account/refresh-authentication"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
      {
        "token" : HiveBox().GetReferenceToken().toString(),
      }
    }),

    );
    if(response.statusCode==200){
      token=RefreshToken.fromJson(jsonDecode(response.body));
      HiveBox().StoreToken(token.token!.split(' ')[1]);
    }
    else{
      throw Exception("Invalid ");
    }
  }

  Future<http.Response> getRequest(String endpoint) async{
    final response=await http.get(Uri.parse("$baseUrl/$endpoint"),
      headers: <String,String>{
        'Authorization': 'Bearer ${HiveBox().getToken()}',
        'Content-Type':'application/json ;charset=UTF-8',
      },
    );
    if(response.statusCode==401){
      await putrequestForRefreshToken();
      return getRequest(endpoint);
    }
      return response;


  }

  Future<http.Response> postRequest(String endpoint, Map<String,dynamic> data,{Map<String,String>? headers}) async{

   Map<String,String> defaultheaders= {
      'Authorization': 'Bearer ${HiveBox().getToken()}',
      'content-Type':'application/json ; charset=UTF-8',
    };
   if(headers!=null){
     defaultheaders.addAll(headers);
   }
   final response=await http.post(Uri.parse("${baseUrl}/${endpoint}"),
   headers:defaultheaders,
     body: jsonEncode(data),
   );

      if(response.statusCode==401){
       await putrequestForRefreshToken();
       return postRequest(endpoint, data,headers: headers);
      }
      return response;


  }
  Future<http.Response> putRequest(String endpoint,Map<String,dynamic> data) async{
   isLoading=true;
    final response=await http.put(Uri.parse("${baseUrl}/${endpoint}"),
    headers:<String,String>{
      'Authorization': 'Bearer ${HiveBox().getToken()}',
      'Content-Type':'application/json ;charset=UTF-8',
    },
      body:jsonEncode(data),
    );
   if(response.statusCode==401){
    await putrequestForRefreshToken();
    return putRequest(endpoint, data);
   }
    isLoading=false;
    return response;
  }

  Future<void> DeleteRequest(String endpoint) async{
    final response=await http.delete(Uri.parse("$baseUrl/$endpoint"),

    headers: <String,String>{
      'Authorization': 'Bearer ${HiveBox().getToken()}',
      'Content-Type':'application/json ;charset=UTF-8',
    },
    );

    if(response.statusCode==401){
     await putrequestForRefreshToken();
      return DeleteRequest(endpoint);
    }
    if(response.statusCode!=200){
      throw Exception("Failed to delete data");
    }
    else{

    }
  }
Future<dio.Response> PostFormData(String endpoint,Map<String,dynamic> formData) async{
    var Data=dio.FormData.fromMap(formData);
    var uri = Uri.parse("$baseUrl/$endpoint");
    var request = http.MultipartRequest('POST', uri);

    // request.headers.addAll({
    //   'Authorization': 'Bearer ${HiveBox().getToken()}',
    //
    // });
    var response;
    try{
       response=await dioClient.post("$baseUrl/$endpoint",
       data: Data,
         options: Options(
           headers: {
         'Authorization':'Bearer ${HiveBox().getToken()}',
         }
       )
       );
        if(response.statusCode==401){
          await putrequestForRefreshToken();
          return PostFormData(endpoint,formData);
        }
    }
    catch(e){
      print('Error : ${e}');
      rethrow;
    }
    return response;
}

}