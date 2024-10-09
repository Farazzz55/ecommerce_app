import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/get_cart_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:flutter/material.dart';

abstract class GetCartRepo {
 Future <Either<Failures,GetCartEntity>> getCart();

}