import 'package:flutter/material.dart';
class EditProfileTextFeild extends StatelessWidget {
 final String labeltxt;
 final String hnttxt;
 final  TextEditingController?  controller;
 EditProfileTextFeild({required this.labeltxt,required this.hnttxt,  this.controller});

 @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey,width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ), focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey,width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        contentPadding: EdgeInsets.only(bottom: 2,left: 15),
        labelText:labeltxt,


        hintText: hnttxt,

      ),
    );
  }
}
