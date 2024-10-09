import 'package:ecommerce_app/domain/entites/get_cart_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class CartScreenState{}
 class CartScreenInitState extends CartScreenState{}
 class CartScreenLoadingState extends CartScreenState{}
 class CartScreenSuccessState extends CartScreenState{
  GetCartEntity getCartEntity;
  CartScreenSuccessState({required this.getCartEntity});
}
 class CartScreenErrorState extends CartScreenState{
  Failures failures;
  CartScreenErrorState({required this.failures});
}
