import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/Fyp_%20Project/UI/Upload_Image/Upload_image.dart';
import 'package:fyp_app/Fyp_%20Project/UI/auth/login_screen.dart';


class SplashServices{
  void islogin(context){

    final auth = FirebaseAuth.instance;
    final User = auth.currentUser;
    if(User!=null){
     Timer(Duration(seconds: 3), ()=>Navigator.push(context, MaterialPageRoute(
      builder: (context) => UploadImageScreen()))
      );
    }else{
       Timer(Duration(seconds: 3), ()=>Navigator.push(context, MaterialPageRoute(
        builder: (context) => loginScreen())));
    }

  
  
  }
} 