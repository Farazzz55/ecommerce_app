import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/add_to_cart_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';

abstract class AddToCartRemoteDataSource{
  Future<Either<Failures,AddToCartEntity>>addToCart(String productId);
}