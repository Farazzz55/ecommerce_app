import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/add_to_fav_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/add_to_fav_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class AddToFavUseCase{
  AddToFavRepo addToFavRepo;
  AddToFavUseCase({required this.addToFavRepo});
  Future<Either<Failures,AddToFavEntity>> invoke(String productId){
    return addToFavRepo.addToFav(productId);
  }
}