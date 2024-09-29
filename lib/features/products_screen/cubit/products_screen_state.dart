import 'package:ecommerce_app/domain/entites/add_to_cart_entity.dart';
import 'package:ecommerce_app/domain/entites/product_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class ProductScreenState {}
class ProductScreenInitState extends ProductScreenState{}
class ProductScreenLoadingState extends ProductScreenState{}
class ProductScreenErrorState extends ProductScreenState{
  Failures failures;
  ProductScreenErrorState({required this.failures});
}
class ProductScreenSuccessState extends ProductScreenState{
  ProductResponseEntity responseEntity;
  ProductScreenSuccessState({required this.responseEntity});
}
class AddCartSuccessState extends ProductScreenState{
  AddToCartEntity responseEntity;
  AddCartSuccessState({required this.responseEntity});
}
class AddCartInitState extends ProductScreenState{}
class AddCartLoadingState extends ProductScreenState{}
class AddCartErrorState extends ProductScreenState{
  Failures failures;
  AddCartErrorState({required this.failures});
}