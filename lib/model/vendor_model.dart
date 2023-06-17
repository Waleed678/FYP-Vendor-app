

import 'dart:convert';

VendorModel vendorModelFromJson(String str) =>
    VendorModel.fromJson(json.decode(str));

String vendorModelToJson(VendorModel data) => json.encode(data.toJson());

class VendorModel {
  String? uid;
  String? email;
  String? imageUrl;
  String? name;

  VendorModel({
    this.uid,
    this.email,
    this.imageUrl,
    this.name,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
        uid: json["uid"],
        email: json["email"],
        imageUrl: json["imageUrl"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "imageUrl": imageUrl,
        "name": name,
      };
}
