import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/Fyp_%20Project/utils/Utils.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/ulpoad_file.dart';
import '../Widgets/EditProfileTxtFeild.dart';

class EditProfile extends StatefulWidget {
  final String name;
  final String email;
  final String image;
  final String id;

  const EditProfile(
      {Key? key, required this.name, required this.email, required this.image, required this.id})
      : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    name = TextEditingController(text: widget.name);
    email = TextEditingController(text: widget.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Edit Profile')),
        backgroundColor: Colors.green.shade300,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 170,
                      width: 170,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(500),
                        child: widget.image.isEmpty && imageUrl.isEmpty
                            ? Image.asset("assets/images/profilepic.webp")
                            : imageUrl == ""
                            ? Image.network(
                          widget.image,
                        )
                            : Image.network(
                          imageUrl,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(40)),
                        child: InkWell(
                            onTap: () {
                              getImage();
                            },
                            child: const Center(child: Icon(Icons.edit))),
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.email,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                //edit profile

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EditProfileTextFeild(
                      controller: name,
                      labeltxt: "Fullname",
                      hnttxt: "Hamza khan",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    EditProfileTextFeild(
                      controller: email,
                      labeltxt: "E-Mail",
                      hnttxt: "hamzakhan@gmail.com",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: Text(
                          'cancel',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await FirebaseFirestore.instance.collection("Vendor")
                            .doc(widget.id)
                            .update(
                            {
                              "imageUrl": imageUrl,
                              "name": name.text,
                            }).then((value) {
                              Utils().toastMessage("Profile updated Successfully");
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green.shade300,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ImagePicker picker = ImagePicker();

  File? file;

  String imageUrl = "";

  Future getImage() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);
    if (pickedFile != null && pickedFile.path != null) {
      file = File(pickedFile.path);
      setState(() {});
      imageUrl = await UploadFileServices().getUrl(context, file: file!);
      setState(() {});
    }
  }
}
