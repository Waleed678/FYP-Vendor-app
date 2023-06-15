import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/Fyp_%20Project/UI/auth/Forgot_Password.dart';
import 'package:fyp_app/Fyp_%20Project/UI/auth/login_with_phone-number.dart';
import 'package:fyp_app/Fyp_%20Project/Widgets/round_button.dart';
import 'package:fyp_app/Fyp_%20Project/utils/Utils.dart';
import 'package:fyp_app/Fyp_%20Project/UI/auth/Signup.dart';
import 'package:fyp_app/services/auth_services.dart';

import '../../../Screens/Tab_bar.dart';
import '../../../model/vendor_model.dart';
import '../../../services/vendor_services.dart';
import '../homescreen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  final AuthServices _authServices = AuthServices();
  VendorServices _vendorServices = VendorServices();
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

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
                padding: const EdgeInsets.only(top: 150, left: 90),
                child: Row(
                  children: const [
                    Text(
                      "Pet",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
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
                            border: OutlineInputBorder(),
                            fillColor: Colors.grey[300],
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            prefixIcon: const Icon(Icons.email_outlined),
                            labelText: "john@gmail.com",
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
                                  border: OutlineInputBorder(),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 190, top: 10),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPassword()));
                            },
                            child: const Text(
                              'Forgot password',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: 260,
                child: RoundButon(
                  title: 'LogIn',
                  loading: loading,
                  onTap: () {
                    bool isValidate = _formkey.currentState!.validate();
                    if (isValidate) {
                      setState(() {
                        loading = true;
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(),));
                      });
                      _authServices
                          .loginUser(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) {
                        _vendorServices.createUser(VendorModel(
                          uid: value.user!.uid,
                          email: emailController.text,
                          imageUrl: '',
                        ));
                        setState(() {
                          loading = false;
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomeScreen()));
                      }).onError((error, stackTrace) {
                        Utils().toastMessage(error.toString());
                        setState(() {
                          loading = false;
                        });
                      });
                    } else {
                      return;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150, left: 100),
                child: Row(
                  children: [
                    const Text("Create account"),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Signup(),
                              ));
                        },
                        child: const Text(
                          '  Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        )),
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
