import 'package:flutter/material.dart';

class imageContainer extends StatefulWidget {
  const imageContainer({super.key});

  @override
  State<imageContainer> createState() => _imageContainerState();
}

class _imageContainerState extends State<imageContainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120,height: 120,
        decoration: BoxDecoration(
          color: Color.fromRGBO(217, 217, 217, 0.904),
         shape: BoxShape.circle
        ),
      ),
    );
  }
}