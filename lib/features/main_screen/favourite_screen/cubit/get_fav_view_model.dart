import 'package:ecommerce_app/domain/use_cases/get_fav_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'get_fav_state.dart';  // Import your state classes

@injectable
class GetFavViewModel extends Cubit<GetFavState> {
  final GetFavUseCase useCase;

  GetFavViewModel({required this.useCase}) : super(GetFavInitState());

  void getFav() async {
    emit(GetFavLoadingState());
    final either = await useCase.invoke();
    either.fold(
          (failure) {
        print("Error fetching favorites: $failure");  // Debugging print
        emit(GetFavErrorState(failures: failure));
      },
          (result) {
        emit(GetFavSuccessState(favEntity: result));
      },
    );
  }

  static GetFavViewModel get(BuildContext context) => BlocProvider.of(context);
}
