import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/Fyp_%20Project/UI/auth/login_screen.dart';
import 'package:fyp_app/Fyp_%20Project/UI/posts/add_posts.dart';
import 'package:fyp_app/Fyp_%20Project/utils/Utils.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);


  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
 
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Post');
  final searchFilter = TextEditingController();
   final editControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,

        title: Text("Post"),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value) {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) =>loginScreen() ));
            }).onError((error, stackTrace) {
              Utils().toastMessage(error.toString());
            });
          }, icon: Icon(Icons.logout_outlined),),
          SizedBox(width: 20,)
        ],
      ),
     body: Column(children: [
      SizedBox(height: 10,),
   
      Expanded (
        child: FirebaseAnimatedList(
          query: ref, 
          defaultChild: Text('Loading'),
          itemBuilder: (context, snapshot, animation, index){


            final title = snapshot.child('title').value.toString();

            if(searchFilter.text.isEmpty){
           return  ListTile(
            title: Text(snapshot.child('title').value.toString()),
            subtitle: Text(snapshot.child('id').value.toString()),
            trailing: PopupMenuButton(
              icon: Icon(Icons.menu),
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: (){
                    Navigator.pop(context);
                    showMyDialog(title , snapshot.child('id').value.toString());
                  },
                  value: 1,
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Edit'),
                    )),
                     PopupMenuItem(
                  value: 1,
                  child: ListTile(
                    onTap: (){
                      Navigator.pop(context);
                      ref.child(snapshot.child('id').value.toString()).remove();
                    },
                    leading: Icon(Icons.delete),
                    title: Text('Delete'),
                    )),
             
              ],
            ),
            );
            }else if(title.toLowerCase().contains(searchFilter.text.toLowerCase().toLowerCase())){
                return  ListTile(
            title: Text(snapshot.child('title').value.toString()),);
            }else {
              return Container();
            } 
            }
          
          
          ),
      ), 
     ]),
  
   floatingActionButton: FloatingActionButton(
    onPressed: (){
     Navigator.push(context, MaterialPageRoute(builder: ((context) => AddPostScreen() ) ));
    },
    child: Icon(Icons.add),
   ),
    );
  }
  Future <void> showMyDialog(String title, String id)async{
    editControler.text  = title;
    return showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Update'),
          content: Container(
            child: TextField(
              controller: editControler,
              decoration: InputDecoration(
                hintText: 'Edit'
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: (){
             Navigator.pop(context);
            }, child: Text('Cancel')),

             TextButton(onPressed: (){
             Navigator.pop(context);
             ref.child(id).update({
              'title' : editControler.text.toLowerCase()
             }).then((value){
              Utils().toastMessage('Post Update');

             }).onError((error, stackTrace) {
              Utils().toastMessage(error.toString());
             });
            }, child: Text('Update')),
          ],
        );
      }
      );
  } 
}

