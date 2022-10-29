import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../navigation_bar/bottom_nav.dart';
import '../signup/signupscreen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController mobilecontroller = TextEditingController();

  final TextEditingController otpcontroller = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 31, 132, 122),
        image: DecorationImage(
            image: AssetImage('asset/login_page_background.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const SizedBox(
                  width: 180,
                  child: Image(image: AssetImage('asset/tradom_logo.png')),
                ),
                const SizedBox(
                  height: 120,
                ),
                TextFormField(
                  controller: mobilecontroller,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ('please enter mobile number');
                    }
                    // if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    //     .hasMatch(value)) {
                    //   return ("Please Enter a valid email");
                    // }
                    return null;
                  },
                  onSaved: (value) {
                    mobilecontroller.text = value!;
                  },
                  decoration: InputDecoration(
                    focusColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Mobile Number',
                    hintStyle: const TextStyle(fontSize: 17),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: otpcontroller,
                  keyboardType: TextInputType.number,
                  // validator: (String? value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter some text';
                  //   }
                  //   return null;
                  // },
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return ('please enter your password');
                    }
                    if (!regex.hasMatch(value)) {
                      return ("please enter minimum 6 characters");
                    }
                  },
                  onSaved: (value) {
                    otpcontroller.text = value!;
                  },
                  decoration: InputDecoration(
                      focusColor: Colors.black,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Otp',
                      hintStyle: const TextStyle(fontSize: 17)),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () =>
                        // signin(mobilecontroller.text, otpcontroller.text),
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: ((context) => const BottomnavScreen()))),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 186, 255, 250),
                        foregroundColor: Colors.black),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ));
                    },
                    child: const Text(
                      'No Account? Create One',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))
              ],
            ),
          )),
    );
  }

  // void signin(String email, String password) async {
  //   // if (_formKey.currentState == null) {
  //   //   return;

  //   // }
  //   if (_formKey.currentState!.validate()) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(const SnackBar(content: Text('Processing Data')));
  //     await _auth
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         // .signInWithPhoneNumber(phoneNumber)
  //         .then((uid) => {
  //               Fluttertoast.showToast(msg: "Login Sussesfull"),
  //               Navigator.of(context).pushReplacement(MaterialPageRoute(
  //                 builder: (context) => BottomnavScreen(),
  //               ))
  //             })
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     });
  //   }
  // }
}
