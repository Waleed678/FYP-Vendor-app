import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/Fyp_%20Project/UI/posts/postsScreen.dart';
import 'package:fyp_app/Fyp_%20Project/Widgets/round_button.dart';
import 'package:fyp_app/Fyp_%20Project/utils/Utils.dart';

class varifyCodeScreen extends StatefulWidget {
  final String VerificationId ;

  const varifyCodeScreen({Key? key, required this.VerificationId}) : super(key: key);

  @override
  State<varifyCodeScreen> createState() => _varifyCodeScreenState();
}

class _varifyCodeScreenState extends State<varifyCodeScreen> {
  

    bool loading = false;
  final VerificationCodeController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("verify"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          SizedBox(height: 80,),

          TextFormField(
            controller: VerificationCodeController,
           // keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '6 digit code'
            ),
          ),
           SizedBox(height: 80,),
           RoundButon(title:'Verify',loading: loading, onTap: ()async{
            setState(() {
              loading = true;
            });
            final Credential = PhoneAuthProvider.credential(
              verificationId: widget.VerificationId,
              smsCode: VerificationCodeController.text.toString()
            );
            try{
              await auth.signInWithCredential(Credential);
              Navigator.push(context,MaterialPageRoute(builder: (context) => PostScreen()));
            }catch(e){
               setState(() {
              loading = true;
            });
            Utils().toastMessage(e.toString());

            }
           }
            )
        ]),
      ),
    );
  }
}