import 'dart:ui';

import 'package:ecommerce_app/domain/entites/remove_fav_entity.dart';
import 'package:ecommerce_app/domain/use_cases/add_to_fav_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/remove_fav_use_case.dart';
import 'package:ecommerce_app/features/main_screen/favourite_screen/cubit/get_fav_view_model.dart';
import 'package:ecommerce_app/features/main_screen/favourite_screen/cubit/remove_fav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveFavViewModel extends Cubit<RemoveFavState> {
  RemoveFavViewModel({required this.useCase}):super(RemoveInitState());
  RemoveFavUseCase useCase;
  void removeFav(String productId,{required VoidCallback onRemoved})async{
    print('Remove Fav List');
    emit(RemoveLoadingState());
    var either=await useCase.invoke(productId);
    either.fold((l){
      print("Failed To Remove Fav List");
      emit(RemoveErrorState(failures: l));
    }, (r){
      print("Success To Remove Fav List");
      emit(RemoveSuccessState(favEntity: r));
      onRemoved(); // Trigger refresh
    });

  }
  static RemoveFavViewModel get(context)=>BlocProvider.of(context);

}