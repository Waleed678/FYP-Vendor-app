import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/Fyp_%20Project/UI/auth/login_screen.dart';
import 'package:fyp_app/Fyp_%20Project/Widgets/round_button.dart';
import 'package:fyp_app/Fyp_%20Project/utils/Utils.dart';
import 'package:fyp_app/model/vendor_model.dart';
import 'package:fyp_app/services/auth_services.dart';
import 'package:fyp_app/services/vendor_services.dart';

import '../../utils/Utils.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  AuthServices _authServices = AuthServices();
  VendorServices _vendorServices = VendorServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 160, left: 90),
                child: Row(
                  children: [
                    const Text(
                      "Pet",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "World",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 320,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              filled: true,
                              border: new OutlineInputBorder(),
                              fillColor: Colors.grey[300],
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: "jonhn@gmail.com",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Email';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 320,
                          child: ValueListenableBuilder(
                              valueListenable: toggle,
                              builder: (context, value, child) {
                                return TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: passwordController,
                                  obscureText: toggle.value,
                                  decoration: InputDecoration(
                                    filled: true,
                                    border: new OutlineInputBorder(),
                                    fillColor: Colors.grey[300],
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          toggle.value = !toggle.value;
                                        },
                                        child: Icon(toggle.value
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility)),
                                    labelText: "*********",
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter password';
                                    }
                                    return null;
                                  },
                                );
                              }),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 260,
                child: RoundButon(
                    title: 'sign up',
                    loading: loading,
                    onTap: () {
                      bool isValidate = _formkey.currentState!.validate();
                      if (isValidate) {
                        setState(() {
                          loading = true;
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(),));
                        });
                        _authServices
                            .registerUser(
                                email: emailController.text,
                                password: passwordController.text)
                            .then((value) {
                          _vendorServices.createUser(VendorModel(
                            uid: value.user!.uid,
                            email: emailController.text,
                            imageUrl: '',
                          ));
                        }).then((value) {
                          emailController.clear();
                          passwordController.clear();
                          Utils().toastMessage('Register Successfully');
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => loginScreen()));
                          setState(() {
                            loading = false;
                          });
                        }).onError((error, stackTrace) {
                          setState(() {
                            loading = false;
                          });
                          Utils().toastMessage("$error");
                        });
                      }
                    }),
              ),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120, left: 80),
                child: Row(
                  children: [
                    const Text("Already have an account"),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const loginScreen(),
                              ));
                        },
                        child: const Text(
                          ' Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
