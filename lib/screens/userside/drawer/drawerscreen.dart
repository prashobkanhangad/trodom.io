import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tradom_io/db/model/usermodel/usermodel.dart';
import 'package:tradom_io/screens/userside/payment/paymentscreen.dart';

import '../loginscreen/loginscreen.dart';

var data;

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _SideScreenState();
}

class _SideScreenState extends State<DrawerScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInuser = UserModel();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInuser = UserModel.fromMap(value.data());
      setState(() {});
      // print(value.toString());
    });
    //
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(255, 31, 132, 122),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 239, 238, 238),
                          border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 31, 132, 122)),
                        ),

                        child: loggedInuser.photoURL == null
                            ? const Center(
                                child: Image(
                                    image: AssetImage(
                                        'asset/150-1503945_transparent-user-png-default-user-image-png-png.png')))
                            : Image(
                                fit: BoxFit.cover,
                                image: FileImage(
                                    File(loggedInuser.photoURL.toString()))),
                        // child: IconButton(
                        //     onPressed: () {},
                        //     icon: const Icon(Icons.camera_alt)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      loggedInuser.displayName == null
                          ? Container(
                              width: 120,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 225, 231, 228),
                                  borderRadius: BorderRadius.circular(4)),
                            )
                          : Text(
                              loggedInuser.displayName.toString(),
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      loggedInuser.email == null
                          ? Container(
                              width: 200,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 225, 231, 228),
                                  borderRadius: BorderRadius.circular(4)),
                            )
                          : Text(loggedInuser.email.toString(),
                              style: const TextStyle(
                                fontSize: 22,
                              )),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                //
                const Divider(
                  thickness: 2,
                ),
                //
                const SizedBox(
                  height: 270,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: [
                      // GestureDetector(
                      //   onTap: () =>
                      //       Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => PaymentScreen(),
                      //   )),
                      //   child: Row(
                      //     children: const [
                      //       Icon(
                      //         Icons.tv,
                      //         size: 20,
                      //       ),
                      //       SizedBox(
                      //         width: 10,
                      //       ),
                      //       Text('Subscribe Tutorials',
                      //           style: TextStyle(
                      //               fontSize: 20, fontWeight: FontWeight.bold))
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        child: Row(
                          children: const [
                            Icon(
                              Icons.privacy_tip,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Privacy Policy',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.newspaper,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Terms of use',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.share,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Share to friends',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: (context),
                            builder: (context) => AlertDialog(
                              title: Text('Are you sure you want to Delete?'),
                              actions: [
                                TextButton(
                                    onPressed: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()),
                                        ),
                                    child: Text('Yes')),
                                TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text('No'))
                              ],
                            ),
                          );
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.delete,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Delete Account',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: (context),
                            builder: (context) => AlertDialog(
                              title: Text('Are you sure you want to logout?'),
                              actions: [
                                TextButton(
                                    onPressed: logout, child: Text('Yes')),
                                TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text('No'))
                              ],
                            ),
                          );
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.logout,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Logout',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ));
  }
}
