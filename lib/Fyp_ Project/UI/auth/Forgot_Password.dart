import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/Fyp_%20Project/Widgets/round_button.dart';
import 'package:fyp_app/Fyp_%20Project/utils/Utils.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          TextFormField(
            controller: emailController,
            decoration:InputDecoration(
                                      filled: true,
                                         border: new OutlineInputBorder(
                                   ),
                                     fillColor: Colors.grey[300],
                                    enabledBorder:OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(15)
                                   ),
                                      labelText: "+92123 4567 8",
                                         ),
          ),
          SizedBox(height: 40,),
          RoundButon(title: 'Enter email', onTap: (){
            auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value) {
              Utils().toastMessage('we have send you email to recover password, please check email'); 
            }).onError((error, stackTrace){
              Utils().toastMessage(error.toString());
            });
          })
        ]),
      ),
    );
  }
}