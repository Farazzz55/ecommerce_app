import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/get_fav_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/get_fav_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFavUseCase{
  GetFavRepo getFavRepo;
  GetFavUseCase({required this.getFavRepo});
  Future <Either<Failures,GetFavEntity>> invoke (){
    return getFavRepo.getFav();
  }
}