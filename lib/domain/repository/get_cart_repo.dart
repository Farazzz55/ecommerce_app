import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/get_cart_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class GetCartRepo {
 Future <Either<Failures,GetCartEntity>> getCart();
 Future <Either<Failures,GetCartEntity>> deleteItemInCart(String productId);
 Future<Either<Failures,GetCartEntity>> updateItemInCart(String productId,int count);

}