import 'package:flutter/material.dart';
class shopInformationContainer extends StatelessWidget {
  final String txt;
  shopInformationContainer({required this.txt});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Text(
            txt,
        ),
      ),
    );
  }
}
