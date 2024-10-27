import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/get_cart_remote_data_source.dart';
import 'package:ecommerce_app/domain/entites/get_cart_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/get_cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : GetCartRepo)
class GetCartRepoImpl extends GetCartRepo {
  @override
  GetCartRemoteDataSource remoteDataSource;

  GetCartRepoImpl({required this.remoteDataSource});

  Future<Either<Failures, GetCartEntity>> getCart() async {
    var either = await remoteDataSource.getCart();
    return either.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failures, GetCartEntity>> deleteItemInCart(String productId) async{
   var either=await remoteDataSource.deleteItemInCart(productId);
   return either.fold((l)=> Left(l), (r)=>Right(r));
  }

  @override
  Future<Either<Failures, GetCartEntity>> updateItemInCart(String productId, int count) async{
   var either = await remoteDataSource.updateItemInCart(productId, count);
   return either.fold((l)=> Left(l), (r)=>Right(r));

  }
}