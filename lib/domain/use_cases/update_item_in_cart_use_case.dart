import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/get_cart_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/get_cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateItemInCartUseCase{
  GetCartRepo getCartRepo;
  UpdateItemInCartUseCase({required this.getCartRepo});
  Future<Either<Failures,GetCartEntity>>invoke(String productId, int count){
    return getCartRepo.updateItemInCart(productId,count);
}
}