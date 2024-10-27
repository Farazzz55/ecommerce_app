import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_manger.dart';
import 'package:ecommerce_app/data/model/get_fav_dto.dart';
import 'package:ecommerce_app/domain/entites/get_fav_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/get_fav_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:ecommerce_app/core/widget/shared_preferences_utils.dart';
import 'package:ecommerce_app/end_point.dart';

@Injectable(as: GetFavRemoteDataSource)
class GetFavRemoteDataSourceImpl extends GetFavRemoteDataSource {
  final ApiManger apiManager;

  GetFavRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetFavEntity>> getFav() async {
    try {
      var token = SharedPreferencesUtils.getData(key: 'token');
      if (token == null) {
        return Left(Failures(errorMessage: "Token is null."));
      }

      var response = await apiManager.getData(EndPoint.getFav, headers: {
        'token': token.toString(),
      });

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        var data = GetFavDto.fromJson(response.data);
        return Right(data);
      } else {
        return Left(ServerError(errorMessage: "Error: ${response.statusCode}"));
      }
    } catch (e) {
      print("Error in getFav: ${e.toString()}"); // Debugging print
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
