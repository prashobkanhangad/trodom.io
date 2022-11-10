// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../../../db/model/usermodel/usermodel.dart';

// class UserManagement extends StatefulWidget {
//   const UserManagement({super.key});

//   @override
//   State<UserManagement> createState() => _UserManagementState();
// }

// class _UserManagementState extends State<UserManagement> {
//   // User? user = FirebaseAuth.instance.currentUser;
//   // UserModel loggedInuser = UserModel();

//   // @override
//   // void initState() {
//   //   // TODO: implement initState

//   //   super.initState();
//   //   FirebaseFirestore.instance
//   //       .collection('users')
//   //       .doc(user!.uid)
//   //       .get()
//   //       .then((value) {
//   //     loggedInuser = UserModel.fromMap(value.data());
//   //     setState(() {});
//   //     // print(value.toString());
//   //   });
//   //   //
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 34, 86, 133),
//         title: const Text('Tradom.io'),
//         centerTitle: true,
//       ),
//       body: Container(
//         decoration:
//             const BoxDecoration(color: Color.fromARGB(255, 241, 247, 255)),
//         child: ListView.separated(
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
//                 child: Container(
//                   width: double.maxFinite,
//                   height: 80,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                             height: 70,
//                             width: 70,
//                             decoration: BoxDecoration(
//                                 color: Color.fromARGB(255, 22, 19, 19),
//                                 borderRadius: BorderRadius.circular(7))),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//             separatorBuilder: (context, index) {
//               return SizedBox();
//             },
//             itemCount: 5),
//       ),
//     );
//   }
// }
