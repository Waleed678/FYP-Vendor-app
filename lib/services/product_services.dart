import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/product_model.dart';

class ProductServices {
  ///Create product
  Future createProduct(ProductModel productModel) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("product").doc();
    return await docRef.set(productModel.toJson(docRef.id));
  }

  Stream<List<ProductModel>> fetchAllProducts() {
    return FirebaseFirestore.instance
        .collection("product")
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((docList) =>
            docList.docs.map((e) => ProductModel.fromJson(e.data())).toList());
  }
}
