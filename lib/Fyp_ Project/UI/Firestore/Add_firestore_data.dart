import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/Fyp_%20Project/Widgets/round_button.dart';
import 'package:fyp_app/Fyp_%20Project/utils/Utils.dart';


class AddFirestoreDataScreen extends StatefulWidget {
  const AddFirestoreDataScreen({Key? key}) : super(key: key);

  @override
  State<AddFirestoreDataScreen> createState() => _AddFirestoreDataScreenState();
}

class _AddFirestoreDataScreenState extends State<AddFirestoreDataScreen> {
  
  final postController = TextEditingController();
  bool loading = false;
  final fireStore = FirebaseFirestore.instance.collection('user');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add FireStoreData")
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TextFormField(
                maxLines: 4,
                controller: postController,
                decoration: InputDecoration(
                  hintText: 'what is in your mind',
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RoundButon(title: 'Add',
              loading: loading,
               onTap: (){
                setState(() {
                  loading = true;
                });
              String id = DateTime.now().microsecondsSinceEpoch.toString();
             fireStore.doc(id).set({
                'title' : postController.text.toString(),
                
               }).then((value){
                setState(() {
                  loading = false;
                });
                
                Utils().toastMessage('post added');
               }).onError(( error, stackTrace) {
                setState(() {
                  loading = false;
                }); 
                Utils().toastMessage(error.toString());
               });

           
           
           
          
              })
            ],
          ),
        ),
    );
  }

  
}