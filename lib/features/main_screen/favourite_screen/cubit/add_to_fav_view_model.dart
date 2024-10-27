import 'package:ecommerce_app/domain/use_cases/add_to_fav_use_case.dart';
import 'package:ecommerce_app/features/main_screen/favourite_screen/cubit/add_to_fav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToFavViewModel extends Cubit<AddToFavState> {
  AddToFavViewModel({required this.useCase}):super(AddToFavInitState());
  AddToFavUseCase useCase;
  void addToFav(String productId)async{
    print('Add Item To Fav List');
    emit(AddToFavLoadingState());
    var either=await useCase.invoke(productId);
    either.fold((l){
      print("Failed To Add Item To Fav List");
      emit(AddToFavErrorState(failures: l));
    }, (r){
      print("Success To Add Item To Fav List");
      emit(AddToFavSuccessState(favEntity: r));
    });

  }
  static AddToFavViewModel get(context)=>BlocProvider.of(context);

}