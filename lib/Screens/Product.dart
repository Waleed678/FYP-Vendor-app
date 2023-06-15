import 'package:flutter/material.dart';
import 'package:fyp_app/Screens/Circle_Container.dart';
import 'package:fyp_app/Screens/My_Shop.dart';


class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},backgroundColor: Color.fromRGBO(34, 214, 192, 1),
      child: Text('Edit')),
      backgroundColor: Colors.white,
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyShop()));
      }, icon: Icon(Icons.arrow_back,size: 30,color: Colors.black,)),backgroundColor: Colors.white,),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 28),
            child: Container(
              child: Center(child: Text('Image',style: TextStyle(fontWeight: FontWeight.bold),)),
              width: 350, height: 130,
              decoration: BoxDecoration(
              color: Color.fromRGBO(217, 217, 217, 1),
              borderRadius: BorderRadius.circular(10)
              ),
            ),   ),
            Padding(
              padding: const EdgeInsets.only(right: 205),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color.fromRGBO(81, 81, 81, 1)),),
                  Text('Rs 500',style: TextStyle(fontSize: 15,color: Color.fromRGBO(81, 81, 81, 1))),
                  SizedBox(height: 30,),
                 Text('Discription',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color.fromRGBO(81, 81, 81, 1)))
                
                ],   ),  ),
                SizedBox(height: 10,),  
                   
                Container(
              width: 350, height: 150,
              color: Color.fromRGBO(217, 217, 217, 1),
              child: Center(child: Text('Description',style: TextStyle(fontWeight: FontWeight.bold),)),           
            ),
             SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(right: 300),
              child: Text('Review',style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(115, 115, 115, 1)),),
            ),
             SizedBox(height: 15,),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Row(
                      children: [
                     Circle(),
                      SizedBox(width: 10,),
                     Text('User Name'),
                      ],  ),  ),
    
                  SizedBox(
                      height: 3,
                     ),
                    
    
                   SizedBox(
                    width: 330, height: 53,
                     child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Color.fromRGBO(217, 217, 217, 1),
                        filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                      ),
                     ),
                   ),
    
                   SizedBox(
                    height: 20,
                   ),
                    SizedBox(
                      width: 350,
                      child: Divider(
                        color: Colors.black,
                       ),
                    ),
    
                   Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Row(
                      children: [
                     Circle(),
                      SizedBox(width: 10,),
                     Text('User Name'),
                      ],  ),  ),
    
                  SizedBox(
                      height: 3,
                     ),
    
                   SizedBox(
                    width: 330, height: 53,
                     child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Color.fromRGBO(217, 217, 217, 1),
                        filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                      ),
                     ),
                   ),
    
                 
                ],
              ),
            )
             
           
         
        ],
      ),
    ),
    
    );
  }
}