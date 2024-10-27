import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/widget/shared_preferences_utils.dart';
import 'package:ecommerce_app/data/api_manger.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/remove_fav_data_source.dart';
import 'package:ecommerce_app/data/model/remove_fav_dto.dart';
import 'package:ecommerce_app/domain/entites/remove_fav_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/end_point.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:RemoveFavRemoteDataSource)
class RemoveFavRemoteDataSourceImpl extends RemoveFavRemoteDataSource{
  ApiManger apiManger;
  RemoveFavRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failures, RemoveFavEntity>> removeFav(String id)async {
   try{
     var token=SharedPreferencesUtils.getData(key: 'token');
     var response=await apiManger.deleteData('${EndPoint.getFav}/$id',headers: {
       'token':token.toString()
     });
     var data = RemoveFavDto.fromJson(response.data);
     if(response.statusCode!>=200&&response.statusCode!<300){
       return Right(data);
     }else {
       return left(ServerError(errorMessage: data.message!));
     }
   }catch(e){
     return Left(Failures(errorMessage: e.toString()));
     
   }
  }
  
}