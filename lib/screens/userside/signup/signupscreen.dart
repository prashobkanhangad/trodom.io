import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tradom_io/db/model/usermodel/usermodel.dart';
import 'package:tradom_io/screens/adminside/adminlogin/adminloginscreen.dart';

import '../loginscreen/loginscreen.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final namecontroller = TextEditingController();

  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  final confirmpasswordcontroller = TextEditingController();

  final _auth = FirebaseAuth.instance;

  XFile? uploadimagefile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/signup_screen_background.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    IconButton(
                      alignment: Alignment.topLeft,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    Spacer(),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 132.4, top: 6.2),
                    //   child: CircleAvatar(radius: 40,),
                    // ),
                  ],
                ),

                const SizedBox(
                  height: 155,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        keyboardType: TextInputType.name,
                        controller: namecontroller,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{3,}$');
                          if (value!.isEmpty) {
                            return ('Please enter your name');
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Please enter minimum 3 characters");
                          }
                        },
                        onSaved: (value) {
                          namecontroller.text = value!;
                        },
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(
                              fontSize: 12.5,
                              height: .6,
                              color: Colors.white,
                              letterSpacing: 1),
                          prefixIcon: const Icon(
                            Icons.account_circle,
                            color: Color.fromARGB(255, 31, 132, 122),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 13.0,
                            horizontal: 10.0,
                          ),
                          focusColor: Colors.black,
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          hintText: 'Name',
                          hintStyle: TextStyle(fontSize: 17),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailcontroller,
                        textInputAction: TextInputAction.next,
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
                            errorStyle: const TextStyle(
                                fontSize: 12.5,
                                height: .6,
                                color: Colors.white,
                                letterSpacing: 1),
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Color.fromARGB(255, 31, 132, 122),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 13.0,
                              horizontal: 10.0,
                            ),
                            focusColor: Colors.black,
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: 'Email',
                            hintStyle: TextStyle(fontSize: 17)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        keyboardType: TextInputType.name,
                        controller: passwordcontroller,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{6,}$');
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
                            errorStyle: const TextStyle(
                                fontSize: 12.5,
                                height: .6,
                                color: Colors.white,
                                letterSpacing: 1),
                            prefixIcon: const Icon(
                              Icons.vpn_key,
                              color: Color.fromARGB(255, 31, 132, 122),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 13.0,
                              horizontal: 10.0,
                            ),
                            focusColor: Colors.black,
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: 'Password',
                            hintStyle: TextStyle(fontSize: 17)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: const TextStyle(fontSize: 18),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.name,
                        controller: confirmpasswordcontroller,
                        validator: (value) {
                          if (confirmpasswordcontroller.text !=
                              passwordcontroller.text) {
                            return 'Password Didnt match';
                          }
                        },
                        decoration: InputDecoration(
                            errorStyle: const TextStyle(
                                fontSize: 12.5,
                                height: .6,
                                color: Colors.white,
                                letterSpacing: 1),
                            prefixIcon: const Icon(
                              Icons.vpn_key,
                              color: Color.fromARGB(255, 31, 132, 122),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 13.0,
                              horizontal: 10.0,
                            ),
                            focusColor: Colors.black,
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(fontSize: 17)),
                      ),
                      Row(
                        children: [
                          Spacer(),
                          const Text(
                            'Upload Your Photo',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          IconButton(
                              onPressed: () {
                                uploadImage();
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            signUp(
                                emailcontroller.text, passwordcontroller.text);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 186, 255, 250),
                              foregroundColor: Colors.black),
                          child: const Text(
                            'Signup',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 5,
                // ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdminloginScreen(),
                      ));
                    },
                    child: const Text(
                      'Admin Login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))
              ],
            ),
          )),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.massage);
      });
    }
  }

  postDetailsToFirestore() async {
   

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = emailcontroller.text;
    userModel.uid = user!.uid;
    userModel.displayName = namecontroller.text;
    userModel.photoURL = uploadimagefile!.path.toString();

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account Created Successfully ");

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ));
  }

  Future<void> uploadImage() async {
    XFile? pickedfile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      uploadimagefile = pickedfile;
    });
    if (pickedfile == null) return;
  }
}
