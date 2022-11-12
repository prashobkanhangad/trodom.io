import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tradom_io/db/function/learn/learnfunctions.dart';
import 'package:tradom_io/screens/adminside/adminlearn/editlearnscreen.dart';

import '../adminnavbar/adminnavbar.dart';

class AdminlearninsideScreen extends StatelessWidget {
  final String title, news, imagelearn;
  int id;

  AdminlearninsideScreen(
      {super.key,
      required this.title,
      required this.news,
      required this.imagelearn,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 86, 133),
        title: Text('Tradom.io'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 12),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditlearnScreen(index: id)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(255, 34, 86, 133),
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
                              deletelearnl(id);
                              // log(id.toString());

                              Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AdminnavbarScreen(
                                  passingselectedindex: 4,
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
                        color: Color.fromARGB(255, 34, 86, 133),
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
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 230,
            width: double.maxFinite,
            child: Image(
              fit: BoxFit.cover,
              image: id < 1
                  ? const AssetImage(
                      'asset/Jargon-Bluechip-Stocks-_23-05-21-01.png')
                  : id < 2
                      ? const AssetImage('asset/dii.png')
                      : id < 3
                          ? const AssetImage('asset/ulips.png')
                          : id < 4
                              ? const AssetImage(
                                  'asset/Editorial_FII_12-01-21-01-1.png')
                              : id < 5
                                  ? const AssetImage('asset/crypto02.png')
                                      as ImageProvider
                                  : FileImage(File(imagelearn.toString())),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Text(news,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 20,
                )),
          ),
        ],
      ),
    );
  }
}
