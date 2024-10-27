import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/remove_fav_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class RemoveFavRemoteDataSource {
  Future<Either<Failures,RemoveFavEntity>> removeFav(String id);
}