import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('My Shop',style: TextStyle(color: Colors.black),),centerTitle: true, leading: 
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,)),
        backgroundColor: Colors.white ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 30),
              child: Container(
                child: Center(child: Text('Add Product\nimage',style: TextStyle(fontWeight: FontWeight.bold),)),
                width: 180, height: 180,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 0.5),
                  shape: BoxShape.circle
                ),    ),   ),
                      
                SizedBox(height: 20,),
        
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 360,height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'Product Title',
                             fillColor: Color.fromRGBO(217, 217, 217, 0.295),
                            filled: true,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(9))
                            ),     ),  ),
                             
                         SizedBox(height: 20,),
                  
                        SizedBox(
                          width: 360,height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'Product Discription',
                            fillColor: Color.fromRGBO(217, 217, 217, 0.295),
                            filled: true,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(9))
                            ), ),   ),
                  
                         SizedBox(height: 20,),
                  
                        SizedBox(
                          width: 360,height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'Size',
                           fillColor: Color.fromRGBO(217, 217, 217, 0.295),
                            filled: true,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(9))
                            ),   ),  ),
                            
                         SizedBox(height: 20,),
                  
                        SizedBox(
                          width: 360,height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'Available',
                             fillColor: Color.fromRGBO(217, 217, 217, 0.295),
                             filled: true,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(9))
                            ),    ),    ),
                        SizedBox(height: 20,),
                        
                        SizedBox(
                          width: 360,height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'Shipping Price',
                           fillColor: Color.fromRGBO(217, 217, 217, 0.295),
                            filled: true,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(9))
                            ),
                            
                          ),   ),
                      ],
                    ),
                  ),
        
                  SizedBox(height: 30,),
        
                 SizedBox(
                   width: 360,height: 50,
                  child: ElevatedButton(onPressed: (){}, child: Text('Upload'),
                    style: ElevatedButton.styleFrom(primary:Color.fromARGB(255, 217, 217, 217),onPrimary:Colors.black,),
                  ))
          
          ]),
        ),
    );
  }
}

