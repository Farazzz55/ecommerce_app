import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce_app/features/products_screen/cubit/products_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartViewModel extends Cubit<ProductScreenState>{
  AddToCartViewModel({required this.cartUseCase}):super(AddCartInitState());
  AddToCartUseCase cartUseCase;
  int numOfCartItem=0;
    void addToCart(String productId)async{
    emit(AddCartLoadingState());
    var either = await cartUseCase.invoke(productId);
    either.fold((l){
      emit(AddCartErrorState(failures: l));
    }, (r){
      numOfCartItem=r.numOfCartItems!.toInt();
      print('num of items: $numOfCartItem');
      emit(AddCartSuccessState(responseEntity: r));
    });
  }
  static AddToCartViewModel get(context) =>BlocProvider.of(context);
}