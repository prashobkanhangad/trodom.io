import 'dart:io';

import 'package:flutter/material.dart';

class LearninsideScreen extends StatelessWidget {
  final String title, news, learnimage;
  int id;

  LearninsideScreen(key, this.title, this.news, this.learnimage, this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 132, 122),
        title: const Text('Tradom.io',
            style: TextStyle(fontFamily: 'bauhaus', fontSize: 25)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 230,
            width: double.maxFinite,
            child: Image(
              fit: BoxFit.cover,
              image:  id < 1
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
                                  : FileImage(File(learnimage)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Container(
              // height: 370,
              child: Text(news,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 20,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
