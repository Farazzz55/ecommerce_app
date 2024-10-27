import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/model/get_cart_response_dto.dart';
import 'package:ecommerce_app/domain/entites/get_cart_entity.dart';
import 'package:ecommerce_app/domain/use_cases/delete_item_in_cart_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_cart_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/update_item_in_cart_use_case.dart';
import 'package:ecommerce_app/features/cart_screen/cubit/cart_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartScreenViewModel extends Cubit<CartScreenState>{
  GetCartUseCase useCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;
  UpdateItemInCartUseCase updateItemInCartUseCase;
  CartScreenViewModel({required this.useCase,required this.deleteItemInCartUseCase,
  required this.updateItemInCartUseCase}):super(CartScreenInitState());
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
      print("Fetched cart items: $getList");

    }
  void deleteItemInCart(String productId)async{
    emit(CartScreenLoadingDeleteState());
    print("Deleting item with productId: $productId");
    var either=await deleteItemInCartUseCase.invoke(productId);
    either.fold((l){
      print("Failed to delete item: $l");
      emit(CartScreenErrorDeleteState(failures: l));
    }, (response){
      print("Item deleted successfully. Updated cart items: ${response.data!.products!.length}");
      getList=response.data!.products!;
      emit(CartScreenSuccessState(getCartEntity: response));
    });
    print("Fetched cart items: $getList");

  }
  void updateItemInCart(String productId, int count) async {
       // Prevent count from going below 1
    if (count < 1) {
      print("Item count cannot be less than 1");
      return;
    }

    emit(CartScreenLoadingUpdateState());
    print("Updating item with productId: $productId to count: $count");

    var either = await updateItemInCartUseCase.invoke(productId, count);

    either.fold((l) {
      print("Failed to update item: $l");
      emit(CartScreenErrorUpdateState(failures: l));
    }, (response) {
      print("Item updated successfully. Updated cart items count: ${response.data!.products!.length}");
      getList = response.data!.products!;
      emit(CartScreenSuccessState(getCartEntity: response));
    });

    print("Fetched cart items after update: $getList");
  }
  static CartScreenViewModel get(context)=>BlocProvider.of(context);

}