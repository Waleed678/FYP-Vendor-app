import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fyp_app/Fyp_%20Project/Widgets/round_button.dart';
import 'package:fyp_app/Fyp_%20Project/utils/Utils.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  
  final postController = TextEditingController();
  bool loading = false;
  final database = FirebaseDatabase.instance.ref('Post');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Post")
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

                 String id = DateTime.now().millisecondsSinceEpoch.toString(); 

             database.ref.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
              'title' : postController.text.toString(),
              'id' : id 
             }).then((value) {
               Utils().toastMessage('Post added');
                setState(() {
                  loading = false;
                });
             }).onError((error, stackTrace) {
              Utils().toastMessage(error.toString());
               setState(() {
                  loading = false;
                });
             });
           
          
              })
            ],
          ),
        ),
    );
  }

  
}