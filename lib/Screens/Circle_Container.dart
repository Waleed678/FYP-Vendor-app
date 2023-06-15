import 'package:flutter/material.dart';

class Circle extends StatefulWidget {
  const Circle({super.key});

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  @override
  Widget build(BuildContext context) {
    return  Container(
                      width: 35, height: 35,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 1),
                        shape: BoxShape.circle),
                    );
  }
}