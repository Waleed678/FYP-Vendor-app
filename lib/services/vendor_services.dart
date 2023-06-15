import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/vendor_model.dart';

class VendorServices{
  /// create user
  Future createUser(VendorModel userModel) async {
    return await FirebaseFirestore.instance
        .collection("Vendor")
        .doc(userModel.uid.toString())
        .set(userModel.toJson());
  }

  /// Fetct Users Record
  Stream<VendorModel> fetchUserRecord(String userID) {
    return FirebaseFirestore.instance
        .collection("Vendor")
        .doc(userID)
        .snapshots()
        .map((userData) =>
        VendorModel.fromJson(userData.data() as Map<String, dynamic>));
  }
}