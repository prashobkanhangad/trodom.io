import 'dart:io';

import 'package:flutter/material.dart';

class LearninsideScreen extends StatelessWidget {
  final String title, news, learnimage;

  const LearninsideScreen(key, this.title, this.news, this.learnimage);

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
              image: FileImage(File(learnimage)),
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
