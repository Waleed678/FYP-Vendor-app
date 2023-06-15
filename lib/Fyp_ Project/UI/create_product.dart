import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/Fyp_%20Project/utils/Utils.dart';
import 'package:fyp_app/model/product_model.dart';
import 'package:fyp_app/services/product_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../services/ulpoad_file.dart';
import '../Widgets/EditProfileTxtFeild.dart';

class Createshop extends StatefulWidget {
  const Createshop({Key? key}) : super(key: key);

  @override
  State<Createshop> createState() => _CreateshopState();
}

class _CreateshopState extends State<Createshop> {
  TextEditingController _name = TextEditingController();
  TextEditingController _category = TextEditingController();
  TextEditingController _color = TextEditingController();
  TextEditingController _weight = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _description = TextEditingController();
  ProductServices _productServices = ProductServices();
  bool isLoading = false;

  makeLoadingTrue() {
    setState(() {
      isLoading = true;
    });
  }

  makeLoadingFalse() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading : isLoading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'Create ',
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          'Product',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 170,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey.shade400,
                      child: imageUrl.isEmpty
                          ? Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Upload Image'),
                            IconButton(
                                onPressed: () {
                                  getImage();
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 30,
                                ))
                          ],
                        ),
                      )
                          : Image.network(imageUrl,fit: BoxFit.cover,),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    EditProfileTextFeild(
                      controller: _name,
                      labeltxt: "name",
                      hnttxt: "Product Name",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EditProfileTextFeild(
                      controller: _category,
                      labeltxt: "Catagories",
                      hnttxt: "Dog",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EditProfileTextFeild(
                      controller: _color,
                      labeltxt: "Color",
                      hnttxt: "color",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EditProfileTextFeild(
                      controller: _weight,
                      labeltxt: "Weight",
                      hnttxt: "Weight",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EditProfileTextFeild(
                      controller: _address,
                      labeltxt: "Address",
                      hnttxt: "Address",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    EditProfileTextFeild(
                      controller: _contact,
                      labeltxt: "contact no",
                      hnttxt: "contact no",
                    ),
                    const SizedBox(
                      height: 25,
                    ),  EditProfileTextFeild(
                      controller: _price,
                      labeltxt: "Price",
                      hnttxt: "Price",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //description

                    TextFormField(
                      maxLines: 6,
                      controller: _description,
                      decoration: const InputDecoration(

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),

                        labelText: "Decription",
                        hintText: "Decription",
                      ),
                    ),
                    //buttons
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        makeLoadingTrue();
                        _productServices.createProduct(ProductModel(
                            uid: FirebaseAuth.instance.currentUser!.uid,
                            name: _name.text,
                            category: _category.text,
                            color: _color.text,
                            weight: "${_weight.text}Kg",
                            address: _address.text,
                            contactNo: _contact.text,
                            description: _description.text,
                            imageURl: imageUrl,
                          price:  _price.text,


                        )).then((value) {
                          makeLoadingFalse();
                          Utils().toastMessage("Product Create Successfully");
                        }).onError((error, stackTrace) {
                          makeLoadingFalse();
                          Utils().toastMessage("$error");
                        });
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.green.shade300,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text(
                            'Create',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
