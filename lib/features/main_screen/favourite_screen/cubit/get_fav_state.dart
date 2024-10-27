import 'package:ecommerce_app/domain/entites/add_to_fav_entity.dart';
import 'package:ecommerce_app/domain/entites/get_fav_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class GetFavState{}
class GetFavInitState extends GetFavState{}
class GetFavLoadingState extends GetFavState{}
class GetFavErrorState extends GetFavState{
  Failures failures;
  GetFavErrorState({required this.failures});
}
class GetFavSuccessState extends GetFavState{
  GetFavEntity favEntity;
  GetFavSuccessState({required this.favEntity});
}