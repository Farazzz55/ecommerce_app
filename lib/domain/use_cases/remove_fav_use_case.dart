import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/remove_fav_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/remove_fav_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveFavUseCase {
  RemoveFavRepo removeFavRepo;
  RemoveFavUseCase({required this.removeFavRepo});
  Future<Either<Failures,RemoveFavEntity>> invoke(String id){
    return removeFavRepo.removeFav(id);
  }
}