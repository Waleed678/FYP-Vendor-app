import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/Fyp_%20Project/UI/Firestore/Add_firestore_data.dart';
import 'package:fyp_app/Fyp_%20Project/UI/auth/login_screen.dart';
import 'package:fyp_app/Fyp_%20Project/utils/Utils.dart';

class FirestoreScreen extends StatefulWidget {
  const FirestoreScreen({Key? key}) : super(key: key);

  @override
  State<FirestoreScreen> createState() => _FirestoreScreenState();
}

class _FirestoreScreenState extends State<FirestoreScreen> {
  final auth = FirebaseAuth.instance;
  final editControler = TextEditingController();
  final fireStore = FirebaseFirestore.instance.collection('user').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('user');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Firestore"),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => loginScreen()));
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },
            icon: Icon(Icons.logout_outlined),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(children: [
        SizedBox(
          height: 10,
        ),
        StreamBuilder<QuerySnapshot>(
            stream: fireStore,
            builder: (BuildContext, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return CircularProgressIndicator();

              if (snapshot.hasError) return Text("Some error");

              return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            ref.doc(snapshot.data!.docs[index]['id'].tostring()).update({
                            'title' : 'Waleed Asghar'
                            }).then((value){
                              Utils().toastMessage('Updated');
                            }).onError((error, stackTrace){
                              Utils().toastMessage(error.toString());
                            }); 
                          },
                          title: Text(
                              snapshot.data!.docs[index]['title'].toString()),
                              subtitle: Text(snapshot.data!.docs[index]['id'].tostring()),
                        );
                      }));
            })
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => AddFirestoreDataScreen())));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> showMyDialog(String title, String id) async {
    editControler.text = title;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update'),
            content: Container(
              child: TextField(
                controller: editControler,
                decoration: InputDecoration(hintText: 'Edit'),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Update')),
            ],
          );
        });
  }
}
