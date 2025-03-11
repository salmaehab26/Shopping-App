import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@singleton
class ApiManager{
  late Dio dio;
  ApiManager(){
   dio = Dio(); }

String path="https://ecommerce.routemisr.com";
  Future<Response> getData (String endpoint ,{Map<String,dynamic>? queryParameter}){
    return dio.get(path+endpoint,queryParameters: queryParameter);
  }

  Future<Response> postData (String endpoint ,{Map<String,dynamic>? body,Map<String,dynamic>? headers}){
    return dio.post(path+endpoint,data: body,options: Options(headers: headers));
  }
}