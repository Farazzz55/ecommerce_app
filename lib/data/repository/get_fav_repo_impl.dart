import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/get_fav_remote_data_source.dart';
import 'package:ecommerce_app/domain/entites/get_fav_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/get_fav_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: GetFavRepo)
class GetFavRepoImpl extends GetFavRepo{
  GetFavRemoteDataSource getFavRemoteDataSource;
  GetFavRepoImpl({required this.getFavRemoteDataSource});
  @override
  Future<Either<Failures, GetFavEntity>> getFav()async {
    var either=await getFavRemoteDataSource.getFav();
    return either.fold((l)=>Left(l), (r)=>Right(r));
  }

}