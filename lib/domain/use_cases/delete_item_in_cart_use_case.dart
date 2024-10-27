import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/get_cart_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/get_cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteItemInCartUseCase{
  GetCartRepo getCartRepo;
  DeleteItemInCartUseCase({required this.getCartRepo});
  Future<Either<Failures,GetCartEntity>>invoke(String productId){
    return getCartRepo.deleteItemInCart(productId);
  }
}