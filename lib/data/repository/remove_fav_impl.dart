import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/remove_fav_data_source.dart';
import 'package:ecommerce_app/domain/entites/remove_fav_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/remove_fav_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: RemoveFavRepo)
class RemoveFavRepoImpl extends RemoveFavRepo{
  RemoveFavRemoteDataSource remoteDataSource;
  RemoveFavRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failures, RemoveFavEntity>> removeFav(String id)async {
    var either=await remoteDataSource.removeFav(id);
    return either.fold((l)=>Left(l), (r)=>Right(r));
  }

}