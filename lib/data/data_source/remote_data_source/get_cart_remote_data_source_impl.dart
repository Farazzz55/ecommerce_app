import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/widget/shared_preferences_utils.dart';
import 'package:ecommerce_app/data/api_manger.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/get_cart_remote_data_source.dart';
import 'package:ecommerce_app/data/model/get_cart_response_dto.dart';
import 'package:ecommerce_app/domain/entites/get_cart_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/end_point.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetCartRemoteDataSource)
class GetCartRemoteDataSourceImpl extends GetCartRemoteDataSource{
  ApiManger apiManger;
  GetCartRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    try {
      var token=SharedPreferencesUtils.getData(key: 'token');
      var response = await apiManger.getData(EndPoint.getCart,
        headers: {
        'token': token
        }
      );
      var responseData=GetCartResponseDto.fromJson(response.data);
      if(response.statusCode!>=200&&response.statusCode!<300){
        return Right(responseData);
      } else{
        return Left ( ServerError(errorMessage: responseData.message!));
      }
    }
    catch (e) {
      return Left(Failures(errorMessage: e.toString()));

    }
  }
}