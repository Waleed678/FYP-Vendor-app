import 'package:flutter/material.dart';
import 'package:fyp_app/Screens/Add_New_Product.dart';
import 'package:fyp_app/Screens/Image_Container.dart';
import 'package:fyp_app/Screens/Product.dart';
import 'package:fyp_app/Screens/Tab_bar.dart';

class MyShop extends StatefulWidget {
  @override
  MyShopState createState() => MyShopState();
}

class MyShopState extends State<MyShop> {
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: SizedBox(
        height: 80, width: 100,
        child: FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewProduct(),));
        },backgroundColor: Color.fromRGBO(34, 214, 192, 1),
        child: Center(child: Text('Upload\nData')),),
      ),
      backgroundColor: Colors.white,
       appBar: AppBar(title: Text('My Shop',style: TextStyle(color: Colors.black),),centerTitle: true, leading: 
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,)),
        backgroundColor: Colors.white ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(children: [
                  imageContainer(),
                           
                             SizedBox(width: 10,),
                        
                            Padding(
                  padding: const EdgeInsets.symmetric(vertical: 70,horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shop Name',style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Business email'),
                       
                    ],   ),
                  )    ],),       
                ),   ),
        
                
            
              SizedBox(
          height: 600,
          child:  TabBarBody(),
              ),
             
             
            ]   ),
        ),
    
    );
  }
}