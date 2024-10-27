import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/add_to_fav_remote_data_source.dart';
import 'package:ecommerce_app/domain/entites/add_to_fav_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/add_to_fav_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:AddToFavRepo)
class AddToFavRepoImpl extends AddToFavRepo{
  AddToFavRemoteDataSource addToFavRemoteDataSource;
  AddToFavRepoImpl({required this.addToFavRemoteDataSource});
  @override
  Future<Either<Failures, AddToFavEntity>> addToFav(String productId) async {
    var either= await addToFavRemoteDataSource.addToFav(productId);
    return either.fold((L)=>Left(L), (R)=>Right(R));
  }

}