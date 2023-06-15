import 'package:flutter/material.dart';


class RoundButon extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  const RoundButon({Key? key , 
  required this.title,
  required this.onTap,
  this.loading = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: loading ? CircularProgressIndicator(strokeWidth: 3,color: Colors.white  ,): Text(title,)),
      ),
    );
  }
}