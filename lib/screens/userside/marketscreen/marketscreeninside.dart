import 'dart:io';

import 'package:flutter/material.dart';

class MarketinsideScreen extends StatelessWidget {
  final String title, news, imagenews;
  final int? id;

  const MarketinsideScreen(
      {super.key,
      required this.title,
      required this.news,
      required this.imagenews,
      this.id});

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
            padding: EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            width: double.maxFinite,
            child: Image(
              fit: BoxFit.cover,
              image: id! < 1
                  ? const AssetImage(
                          'asset/beautiful-shot-snowy-mountains-with-dark-blue-sky-scaled.jpg')
                      as ImageProvider
                  : FileImage(File(imagenews)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
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
