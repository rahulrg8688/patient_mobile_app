import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:patient_application/ModelClass/RefreshTokenModel/TokenRefresh.dart';
class ApiService{
  final String baseUrl;
  bool isLoading=false;
  ApiService({required this.baseUrl});
  final GetStorage storage=GetStorage();
RefreshToken token=RefreshToken();

  Future<void> putrequestForRefreshToken() async{
    final response=await http.put(Uri.parse("https://qa.careaxes.net/fernandez-api/api/account/refresh-authentication"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
      {
        "token" : storage.read('ReferenceToken').toString(),
      }
    }),

    );
    if(response.statusCode==200){
      token=RefreshToken.fromJson(jsonDecode(response.body));
      storage.write('JwtToken',token.token!.split(' ')[1]);
    }
    else{
      throw Exception("Invalid ");
    }
  }

  Future<http.Response> getRequest(String endpoint) async{
    final response=await http.get(Uri.parse("$baseUrl/$endpoint"),
      headers: <String,String>{
        'Authorization': 'Bearer ${storage.read('JwtToken')}',
        'Content-Type':'application/json ;charset=UTF-8',
      },
    );
    if(response.statusCode==401){
      await putrequestForRefreshToken();
      return getRequest(endpoint);
    }

      return response;


  }

  Future<http.Response> postRequest(String endpoint, Map<String,dynamic> data) async{
    final response=await http.post(Uri.parse("${baseUrl}/${endpoint}"),
    headers: <String,String>{
      'Authorization': 'Bearer ${storage.read('JwtToken')}',
      'content-Type':'application/json ; charset=UTF-8',
    },
    body: jsonEncode(data),
    );
      if(response.statusCode==401){
       await putrequestForRefreshToken();
       return postRequest(endpoint, data);
      }
      return response;


  }
  Future<http.Response> putRequest(String endpoint,Map<String,dynamic> data) async{
   isLoading=true;
    final response=await http.put(Uri.parse("${baseUrl}/${endpoint}"),
    headers:<String,String>{
      'Authorization': 'Bearer ${storage.read('JwtToken')}',
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
      'Authorization': 'Bearer ${storage.read('JwtToken')}',
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

}