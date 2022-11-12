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

  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

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
            child: Form(
              key: _formKey,
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
                    height: 100,
                  ),
                  TextFormField(
                    style: TextStyle(fontSize: 20),
                    autofocus: false,
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Enter Email");
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Please Enter a valid email");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      emailcontroller.text = value!;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 13.0,
                        horizontal: 10.0,
                      ),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 31, 132, 122),
                      ),
                      focusColor: Colors.black,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      hintText: 'Email',
                      hintStyle: const TextStyle(fontSize: 17),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(fontSize: 20),
                    autofocus: false,
                    obscureText: true,
                    controller: passwordcontroller,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return ('Please enter your password');
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Please enter minimum 6 characters");
                      }
                    },
                    onSaved: (value) {
                      passwordcontroller.text = value!;
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 13.0,
                          horizontal: 10.0,
                        ),
                        prefixIcon: Icon(Icons.vpn_key,
                            color: Color.fromARGB(255, 31, 132, 122)),
                        focusColor: Colors.black,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        hintText: 'Password',
                        hintStyle: const TextStyle(fontSize: 17)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () => signin(
                          emailcontroller.text.trim(), passwordcontroller.text),
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
                          builder: (context) => SignupScreen(),
                        ));
                      },
                      child: const Text(
                        'No Account? Create One',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))
                ],
              ),
            ),
          )),
    );
  }

  void signin(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      // showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (context) => const Center(
      //     child: CircularProgressIndicator(
      //       color: Color.fromARGB(255, 255, 255, 255),
      //     ),
      //   ),
      // );

      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                // Fluttertoast.showToast(msg: "Login Sussesfull"),
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => BottomnavScreen(selectedindex: 2),
                ))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
