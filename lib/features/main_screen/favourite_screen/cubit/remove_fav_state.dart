import 'package:ecommerce_app/domain/entites/add_to_fav_entity.dart';
import 'package:ecommerce_app/domain/entites/remove_fav_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class RemoveFavState{}
class RemoveInitState extends RemoveFavState{}
class RemoveLoadingState extends RemoveFavState{}
class RemoveErrorState extends RemoveFavState{
  Failures failures;
  RemoveErrorState({required this.failures});
}
class RemoveSuccessState extends RemoveFavState{
  RemoveFavEntity favEntity;
  RemoveSuccessState({required this.favEntity});
}