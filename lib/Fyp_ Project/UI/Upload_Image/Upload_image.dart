import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/Fyp_%20Project/Widgets/round_button.dart';
import 'package:fyp_app/Fyp_%20Project/utils/Utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  bool loading = false;
  File? _image;
  final picker = ImagePicker();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref();

  Future getImageGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("no image picked");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Images")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 50),
            child: InkWell(
              onTap: () {
                getImageGallery();
              },
              child: Container(
                height: 200,
                width: 200,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: _image != null
                    ? Image.file(_image!.absolute)
                    : Center(child: Icon(Icons.image)),
              ),
            ),
          ),
          SizedBox(
            height: 29,
          ),
          RoundButon(
              title: 'Upload',
              loading: loading,
              onTap: () async {
                setState(() {
                  loading = true;
                });

                firebase_storage.Reference ref = firebase_storage
                    .FirebaseStorage.instance
                    .ref('/foldername' +
                        DateTime.now().millisecondsSinceEpoch.toString());

                firebase_storage.UploadTask uploadTask =
                    ref.putFile(_image!.absolute);

                Future.value(uploadTask).then((value) async {
                  var newUrl = await ref.getDownloadURL();

                  databaseRef.child('1').set(
                      {'id': '1212', 'title': newUrl.toString()}).then((value) {
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage('uploaded');
                  }).onError((error, stackTrace) {
                    setState(() {
                      loading = false;
                    });
                  });
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                  setState(() {
                    loading = false;
                  });
                });
              })
        ],
      ),
    );
  }
}
