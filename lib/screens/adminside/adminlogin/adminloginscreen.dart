import 'package:flutter/material.dart';
import 'package:tradom_io/screens/adminside/adminnavbar/adminnavbar.dart';

import '../../userside/loginscreen/loginscreen.dart';

class AdminloginScreen extends StatelessWidget {
  AdminloginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/admin_login_page_background.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(
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
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 305,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                            color: Color.fromARGB(255, 34, 86, 133),
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
                        height: 25,
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
                            return ("Please enter minimum 5 characters");
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
                            prefixIcon: const Icon(Icons.vpn_key,
                                color: Color.fromARGB(255, 34, 86, 133)),
                            focusColor: Colors.black,
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: 'Password',
                            hintStyle: const TextStyle(fontSize: 17)),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) =>
                            //       AdminnavbarScreen(passingselectedindex: 2),
                            // ));
                            onsigninbuttonpressed(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 184, 219, 255),
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
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  onsigninbuttonpressed(context) async {
    if (_formKey.currentState!.validate()) {
      if (emailcontroller.text.trim() == 'admin@gmail.com' &&
          passwordcontroller.text.trim() == '123456')
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AdminnavbarScreen(passingselectedindex: 0),
        ));
    }
  }
}
