import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/get_fav_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class GetFavRemoteDataSource{
  Future<Either<Failures,GetFavEntity>> getFav();
}