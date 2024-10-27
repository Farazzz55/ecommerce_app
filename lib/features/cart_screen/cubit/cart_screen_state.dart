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
class CartScreenLoadingDeleteState extends CartScreenState{}
class CartScreenSuccessDeleteState extends CartScreenState{
 GetCartEntity getCartEntity;
 CartScreenSuccessDeleteState({required this.getCartEntity});
}
class CartScreenErrorDeleteState extends CartScreenState{
 Failures failures;
 CartScreenErrorDeleteState({required this.failures});
}
class CartScreenSuccessUpdateState extends CartScreenState{
 GetCartEntity getCartEntity;
 CartScreenSuccessUpdateState({required this.getCartEntity});
}
class CartScreenErrorUpdateState extends CartScreenState{
 Failures failures;
 CartScreenErrorUpdateState({required this.failures});
}
class CartScreenLoadingUpdateState extends CartScreenState{}
