import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/model/get_cart_response_dto.dart';
import 'package:ecommerce_app/domain/entites/get_cart_entity.dart';
import 'package:ecommerce_app/domain/use_cases/get_cart_use_case.dart';
import 'package:ecommerce_app/features/cart_screen/cubit/cart_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartScreenViewModel extends Cubit<CartScreenState>{
  GetCartUseCase useCase;
  CartScreenViewModel({required this.useCase}):super(CartScreenInitState());
  List<GetCartProductsEntity> getList=[];
    void getCart()async{
      emit(CartScreenLoadingState());
      var either=await useCase.invokes();
      either.fold((l){
        emit(CartScreenErrorState(failures: l));
      }, (response){
        getList=response.data!.products!;
        emit(CartScreenSuccessState(getCartEntity: response));
      });
}
static CartScreenViewModel get(context)=>BlocProvider.of(context);
}