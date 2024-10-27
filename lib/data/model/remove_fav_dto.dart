import 'package:ecommerce_app/domain/entites/remove_fav_entity.dart';

class RemoveFavDto extends RemoveFavEntity {
  RemoveFavDto({
      super.status,
      super.message,
      super.data,
  this.statusMsg});

  RemoveFavDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg=json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  String ? statusMsg;

}