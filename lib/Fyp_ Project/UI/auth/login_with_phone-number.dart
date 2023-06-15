import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/Fyp_%20Project/UI/auth/Varify_code.dart';
import 'package:fyp_app/Fyp_%20Project/Widgets/round_button.dart';
import 'package:fyp_app/Fyp_%20Project/utils/Utils.dart';


class loginWithPhoneNumber extends StatefulWidget {
  const loginWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<loginWithPhoneNumber> createState() => _loginWithPhoneNumberState();
}

class _loginWithPhoneNumberState extends State<loginWithPhoneNumber> {

  bool loading = false;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 190,horizontal: 20),
        child: Column(children: [
          SizedBox(height: 80,),

          SizedBox(
            width: 320, height: 50,
            child: TextFormField(
              controller: phoneNumberController,
              //keyboardType: TextInputType.number,
             decoration:InputDecoration(
                                      filled: true,
                                         border: new OutlineInputBorder(
                                   ),
                                     fillColor: Colors.grey[300],
                                    enabledBorder:OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(15),
                                   ),
                                      labelText: "+123 334 443 54",
                                       ),
            ),
          ),
           SizedBox(height: 80,),
           RoundButon(
            title:'Login',loading: loading, onTap: (){
            setState(() {
              loading = true;
            });
          auth.verifyPhoneNumber(
            phoneNumber: phoneNumberController.text ,
            verificationCompleted: (_){
                setState(() {
              loading = false;
            });
            }, 
            verificationFailed: (e){
              setState(() {
              loading = false;
            });
              Utils().toastMessage(e.toString());
            }, 
            codeSent: (String VerificationId , int? token){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => varifyCodeScreen(VerificationId: VerificationId ,)));
            setState(() {
              loading = false;
            });
            }, 
            codeAutoRetrievalTimeout: (e){
              setState(() {
              loading = false;
            });
            Utils().toastMessage(e.toString());
            } );
            
            
          
           })
        ]),
      ),

      )     
    );
  }
}