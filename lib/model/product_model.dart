// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) =>
    json.encode(data.toJson(data.docId.toString()));

class ProductModel {
  String? uid;
  String? docId;
  String? name;
  String? category;
  String? imageURl;
  String? address;
  String? color;
  String? weight;
  String? price;
  String? description;
  String? contactNo;

  ProductModel({
    this.uid,
    this.docId,
    this.name,
    this.category,
    this.imageURl,
    this.address,
    this.color,
    this.weight,
    this.price,
    this.description,
    this.contactNo,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        uid: json["uid"],
        docId: json["docId"],
        name: json["name"],
        category: json["category"],
        imageURl: json["imageURl"],
        address: json["address"],
        color: json["color"],
        weight: json["weight"],
        price: json["price"],
        description: json["description"],
        contactNo: json["contactNO"],
      );

  Map<String, dynamic> toJson(String id) => {
        "uid": uid,
        "docId": id,
        "name": name,
        "category": category,
        "imageURl": imageURl,
        "address": address,
        "color": color,
        "weight": weight,
        "price": price,
        "description": description,
        "contactNO": contactNo,
      };
}
