import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/add_to_cart_remote_data_source.dart';
import 'package:ecommerce_app/domain/entites/add_to_cart_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/add_to_cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddToCartRepo)
class AddToCartRepoImpl extends AddToCartRepo{
  AddToCartRemoteDataSource remoteDataSource;
  AddToCartRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failures, AddToCartEntity>> addToCart(String productId) async{
    var either= await remoteDataSource.addToCart(productId);
    return either.fold((error)=> Left(error), (data)=>Right(data));
  }

}