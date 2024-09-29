import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/widget/shared_preferences_utils.dart';
import 'package:ecommerce_app/data/api_manger.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/add_to_cart_remote_data_source.dart';
import 'package:ecommerce_app/data/model/add_to_cart_dto.dart';
import 'package:ecommerce_app/domain/entites/add_to_cart_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/end_point.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddToCartRemoteDataSource)
class AddToCartRemoteDataSourceImpl extends AddToCartRemoteDataSource{
  ApiManger apiManger;
  AddToCartRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failures, AddToCartDto>> addToCart(String productId) async{
    try{
      var token=SharedPreferencesUtils.getData(key: 'token');
    var response=await apiManger.postData(EndPoint.addCartUrl,
    body: {
      "productId": productId,
    },
      headers:{
      'token' : token.toString()
      }
   );
    var cartData=AddToCartDto.fromJson(response.data);
    if(response.statusCode!>=200&&response.statusCode!<300){
      return Right(cartData);
    }else if(response.statusCode==401){
      return Left(ServerError(errorMessage: cartData.message!));
    }
    else{
      return Left(ServerError(errorMessage: cartData.message!));
    }
  }catch(e){
      return Left(Failures(errorMessage: e.toString()));
    }}
  
}