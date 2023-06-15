import 'package:flutter/material.dart';

import '../UI/Uploadpets.dart';
import 'shopinformationcontainer.dart';
class Bottomshop extends StatelessWidget {
  const Bottomshop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => UploadPets()));
        },
        child: Container(
          height: 50,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.green.shade300
          ),
          child: Center(child: Text("Upload",style: TextStyle(
            fontWeight: FontWeight.bold
          ),)),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height:230,
        width: double.infinity,
        child: Image(image: AssetImage("asset/istockphoto-992637094-612x612.jpg"),fit: BoxFit.fill,)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                Text("Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                  SizedBox(height: 10),
                shopInformationContainer(txt: "hamza shop",),
                  SizedBox(height: 10),
                  Text("ShopCatagories",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                  SizedBox(height: 10),
                  shopInformationContainer(txt: "dogs",),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total pets",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
              Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text(
                    "10",
                  ),
                ),
              ),
                      Text("Sell pets",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
        Container(
          height: 50,
          width: 80,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Text(
              "6",
            ),
          ),
        ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Text("Description",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                  Container(
                    height: 140,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 2),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text
                          ("The German Shepherd Dog is one of America’s most popular dog breeds — \nfor good reasons. They’re intelligent and capable working dogs. Their devotion and courage are unmatched. And they're amazingly versatile"

                        ),
                      ),
                    ),
                  ),
              ],),
            ),
          ],
        ),
      ),
    );
  }
}

