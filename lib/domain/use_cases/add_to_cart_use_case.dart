import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/add_to_cart_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/add_to_cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase{
  AddToCartRepo addToCartRepo;
  AddToCartUseCase({required this.addToCartRepo});
  Future<Either<Failures,AddToCartEntity>>invoke(String productId){
    return addToCartRepo.addToCart(productId);
  }
}