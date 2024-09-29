import 'package:ecommerce_app/domain/entites/add_to_cart_entity.dart';

class AddToCartDto extends AddToCartEntity{
  AddToCartDto({
      super.status,
      super.message,
      super.numOfCartItems,
      super.cartId,
      super.data,
  this.statusMsg});

  AddToCartDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg=json['statusMsg'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddToCartDataDto.fromJson(json['data']) : null;
  }
  String?statusMsg;

}

class AddToCartDataDto extends AddToCartDataEntity {
  AddToCartDataDto({
      super.id,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.totalCartPrice,});

  AddToCartDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddToCartProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }


}

class AddToCartProductsDto  extends AddToCartProductEntity{
  AddToCartProductsDto({
      super.count,
      super.id,
      super.product,
      super.price,});

  AddToCartProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }

}