import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/widget/shared_preferences_utils.dart';
import 'package:ecommerce_app/data/api_manger.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/add_to_fav_remote_data_source.dart';
import 'package:ecommerce_app/data/model/add_to_fav_dto.dart';
import 'package:ecommerce_app/domain/entites/add_to_fav_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/end_point.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddToFavRemoteDataSource)
class AddToFavRemoteDataSourceRemoteImpl extends AddToFavRemoteDataSource{
  ApiManger apiManger;
  AddToFavRemoteDataSourceRemoteImpl({required this.apiManger});
  @override
  Future<Either<Failures, AddToFavEntity>> addToFav(String productId) async{
    try{
      var token=SharedPreferencesUtils.getData(key: 'token');
      var response= await apiManger.postData(EndPoint.favCart,headers: {
        'token': token.toString()
      },
      body: {
        'productId': productId
      });
      var data=AddToFavDto.fromJson(response.data);
      if(response.statusCode!>=200&&response.statusCode!<300){
        return Right(data);
      }else{
        return Left(ServerError(errorMessage: data.message!));
      }
    }catch(e){
     return Left(Failures(errorMessage: e.toString()));
    }
  }

}