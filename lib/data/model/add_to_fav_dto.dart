import 'package:ecommerce_app/domain/entites/add_to_fav_entity.dart';

class AddToFavDto extends AddToFavEntity {
  AddToFavDto({
      super.status,
      super.message,
      super.data,
  this.statusMsg});

  AddToFavDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
 String ? statusMsg;


}