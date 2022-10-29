import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tradom_io/db/function/signal/signalfunctions.dart';
import 'package:tradom_io/screens/adminside/adminnavbar/adminnavbar.dart';
import 'package:tradom_io/screens/adminside/adminsignals/adminsignalscreen.dart';
import 'package:tradom_io/screens/adminside/adminsignals/editsignalscreen.dart';

class AdminsignalinsideScreen extends StatelessWidget {
  final String title, signalimage;
  int id;

  AdminsignalinsideScreen(
      {super.key,
      required this.title,
      required this.signalimage,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 86, 133),
        title: const Text('Tradom.io'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 12),
            child: SizedBox(
              width: double.maxFinite,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditsignalScreen(
                                index: id,
                                signaltitle: title,
                                signalimage: signalimage,
                              )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 34, 86, 133),
                      ),
                      width: 150,
                      height: 40,
                      child: const Center(
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'Are You Sure To Delete',
                          style: TextStyle(fontSize: 18),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {
                              deletesignal(id);

                              Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AdminnavbarScreen(
                                  passingselectedindex: 1,
                                ),
                              ));
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 34, 86, 133),
                      ),
                      width: 150,
                      height: 40,
                      child: const Center(
                        child: Text(
                          'Delete',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: SizedBox(
              // child: Placeholder(),
              height: 200,
              width: double.maxFinite,
              child: Image(
                fit: BoxFit.cover,
                image: FileImage(File(signalimage)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// deletefromhive(int id) async {
//   await databasebox.deleteAt(id);
// }

// upadatefromhive(int id, value) async {
//   await databasebox.putAt(id, value);
// }
