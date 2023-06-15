import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/services/vendor_services.dart';
import 'package:provider/provider.dart';

import '../../model/vendor_model.dart';
import '../UI/EditProfile.dart';

class BottomProfile extends StatefulWidget {
  const BottomProfile({Key? key}) : super(key: key);

  @override
  State<BottomProfile> createState() => _BottomProfileState();
}

class _BottomProfileState extends State<BottomProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Profile')),
        backgroundColor: Colors.green.shade300,
      ),
      body: StreamProvider.value(
        initialData: VendorModel(),
        value: VendorServices()
            .fetchUserRecord(FirebaseAuth.instance.currentUser!.uid),
        builder: (context, ctx) {
          VendorModel userData = context.watch<VendorModel>();
          return Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                      height: 170,
                      width: 170,
                      child: CircleAvatar(
                          child: Image(
                        image:  NetworkImage(userData.imageUrl.toString())
                           ,
                      ))),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    userData.name.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    userData.email.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //edit profile
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile(
                                    name: userData.name.toString(),
                                    email: userData.email.toString(),
                                    image: userData.imageUrl.toString(), id: userData.uid.toString(),
                                  )));
                    },
                    child: Container(
                      height: 50,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Colors.green.shade300,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                          child: Text(
                        'Edit Profile',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 3),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              userData.name.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),

                      //email
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 3),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              userData.email.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
