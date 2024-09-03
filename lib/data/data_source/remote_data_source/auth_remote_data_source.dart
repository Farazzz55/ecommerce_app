import 'package:dartz/dartz.dart';

import '../../../domain/entites/register_response_entity.dart';
import '../../../domain/failures.dart';

abstract class AuthRemoteDataSource{
  Future <Either<Failures,RegisterResponseEntity>> register(String name , String phone , String password , String rePassword ,
  String email);

}