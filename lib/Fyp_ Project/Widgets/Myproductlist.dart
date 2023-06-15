import 'package:flutter/material.dart';
class MyProductScreen extends StatefulWidget {
  const MyProductScreen({Key? key}) : super(key: key);

  @override
  State<MyProductScreen> createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
      height: 120,
decoration: BoxDecoration(
  border: Border.all(width: 2,color: Colors.grey.shade300)
),
      child: Row(
        children: [
          Container(
              height: 120,
              width: 120,
              child: Image(image: AssetImage("asset/istockphoto-992637094-612x612.jpg"),fit: BoxFit.fill,)),
          SizedBox(
            width: 20,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Rs 800",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
              Text("German",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
              Text("Kohat",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
            ],
          )
        ],
      ),
    );

  }
}
