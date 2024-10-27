import 'package:ecommerce_app/domain/entites/add_to_fav_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class AddToFavState{}
class AddToFavInitState extends AddToFavState{}
class AddToFavLoadingState extends AddToFavState{}
class AddToFavErrorState extends AddToFavState{
  Failures failures;
  AddToFavErrorState({required this.failures});
}
class AddToFavSuccessState extends AddToFavState{
  AddToFavEntity favEntity;
  AddToFavSuccessState({required this.favEntity});
}