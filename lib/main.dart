import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/Fyp_%20Project/UI/auth/login_screen.dart';

import 'Fyp_ Project/UI/posts/add_posts.dart';
import 'Fyp_ Project/UI/posts/postsScreen.dart';
import 'Screens/Add_New_Product.dart';
import 'Screens/Circle_Container.dart';
import 'Screens/Image_Container.dart';
import 'Screens/My_Shop.dart';
import 'Screens/Product.dart';
import 'Screens/Tab_bar.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        home:  loginScreen()
    );
  }
}