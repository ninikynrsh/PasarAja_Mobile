import 'package:pasaraja_mobile/core/entities/complain_entity.dart';

class ComplainModel extends ComplainEntity {
  const ComplainModel({
    final int? idComplain,
    final int? idUser,
    final int? idShop,
    final int? idProduct,
    final String? reason,
    final String? productName,
    final String? productPhoto,
    final String? fullName,
    final String? email,
    final String? userPhoto,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) : super(
          idComplain: idComplain,
          idUser: idUser,
          idShop: idShop,
          idProduct: idProduct,
          reason: reason,
          productName: productName,
          productPhoto: productPhoto,
          fullName: fullName,
          email: email,
          userPhoto: userPhoto,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory ComplainModel.fromJson(Map<String, dynamic> json) => ComplainModel(
        idComplain: json["id_complain"],
        idUser: json["id_user"],
        idShop: json["id_shop"],
        idProduct: json["id_product"],
        reason: json["reason"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        productName: json["product_name"],
        productPhoto: json["product_photo"],
        fullName: json["full_name"],
        email: json["email"],
        userPhoto: json["user_photo"],
      );

  static List<ComplainModel> fromList(List<dynamic> json) =>
      json.map((dynamic i) => ComplainModel.fromJson(i)).toList();
}
