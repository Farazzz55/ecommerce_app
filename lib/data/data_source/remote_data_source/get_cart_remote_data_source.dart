import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/get_cart_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class GetCartRemoteDataSource {
  Future<Either<Failures,GetCartEntity>> getCart();
}