import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../entites/register_response_entity.dart';
import '../failures.dart';

@injectable
class RegisterUseCase{
  AuthRepository authRepository ;
  RegisterUseCase({required this.authRepository});
  Future<Either<Failures, RegisterResponseEntity>> invoke(String name , String phone , String password , String rePassword ,
      String email){
   return authRepository.register(name, phone, password, rePassword, email);

  }
}