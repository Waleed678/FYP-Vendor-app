import 'package:flutter/material.dart';

import '../UI/MyProductScreen.dart';


class BottomHome extends StatefulWidget {
  const BottomHome({Key? key}) : super(key: key);

  @override
  State<BottomHome> createState() => _BottomHomeState();
}

class _BottomHomeState extends State<BottomHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'My ',
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    'Shop',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Total ',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    'Products',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              // My Product
              GestureDetector(
                onTap: () {},
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyProduct()));
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      width: 147,
                      height: 150,
                      child: Column(
                        children: [
                          Icon(
                            Icons.pets,
                            size: 80,
                          ),
                          Text(
                            'My',
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 25),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Product',
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
