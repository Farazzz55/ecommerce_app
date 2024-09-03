import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_manger.dart';
import 'package:ecommerce_app/data/model/register_respone_DTO.dart';

import 'package:ecommerce_app/domain/entites/register_response_entity.dart';

import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/end_point.dart';
import 'package:injectable/injectable.dart';

import 'auth_remote_data_source.dart';
@Injectable(as:AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManger apiManger;
  AuthRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name, String phone, String password, String rePassword, String email)
  async{
   var response=await apiManger.postData(EndPoint.register,body: {
     "name": name,
     "email":email,
     "password":password,
     "rePassword":rePassword,
     "phone":phone
   });
   try{
   var registerResponse=RegisterResponeDTO.fromJson(response.data);
   if(response.statusCode!>=200&&response.statusCode!<300){
     return Right(registerResponse);
   }else{
     return Left(ServerError(errorMessage:registerResponse.message! ));
   }
  }catch(e){
      return Left(Failures(errorMessage: e.toString()));
   }
  
}}