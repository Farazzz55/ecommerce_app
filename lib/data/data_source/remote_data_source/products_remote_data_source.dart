import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/product_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class ProductRemoteDataSource {
 Future<Either<Failures,ProductResponseEntity>> getProductData();
}