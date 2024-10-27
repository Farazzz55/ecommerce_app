import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constatnt/constant.dart';
import 'package:injectable/injectable.dart';
@singleton
class ApiManger{
  late Dio dio ;
  ApiManger(){
    dio=Dio();
  }
  Future<Response>getData(String endPoint,{ Map<String, dynamic>? queryPrameters,Map<String, dynamic>? headers}){ //endPoint => name of api
   return dio.get(AppConstant.baseUrl+endPoint,queryParameters: queryPrameters,
       options: Options(
           validateStatus: ((status)=>true),
         headers: headers
       ));


  }
  Future<Response>postData(String endPoint,{ Map<String, dynamic>? queryPrameters
  ,Map<String, dynamic>? body,Map<String, dynamic>? headers}){
    return dio.post(
        AppConstant.baseUrl+endPoint,data:body,
        queryParameters: queryPrameters ,
    options: Options(
      validateStatus: ((status)=>true),
      headers: headers,
    ));
  }
  Future<Response>deleteData(String endPoint,{ Map<String, dynamic>? queryPrameters
    ,Map<String, dynamic>? body,Map<String, dynamic>? headers}){
    print("Sending DELETE request to: ${AppConstant.baseUrl + endPoint}");
    return dio.delete(
        AppConstant.baseUrl+endPoint,data:body,
        queryParameters: queryPrameters ,
        options: Options(
          validateStatus: ((status)=>true),
          headers: headers,
        ));
  }
  Future<Response>updateData(String endPoint,{ Map<String, dynamic>? queryPrameters
    ,Map<String, dynamic>? body,Map<String, dynamic>? headers}){
    print("Sending updated request to: ${AppConstant.baseUrl + endPoint}");
    return dio.put(
        AppConstant.baseUrl+endPoint,
        data:body,
        queryParameters: queryPrameters ,
        options: Options(
          validateStatus: ((status)=>true),
          headers: headers,
        ));
  }
}