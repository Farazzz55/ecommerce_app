import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/add_to_fav_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class AddToFavRemoteDataSource {
  Future<Either<Failures,AddToFavEntity>>addToFav(String productId);
}