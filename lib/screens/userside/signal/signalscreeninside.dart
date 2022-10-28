import 'dart:io';

import 'package:flutter/material.dart';

class SignalinsideScreen extends StatelessWidget {
  final String title, signalimage;

  const SignalinsideScreen(
      {super.key, required this.title, required this.signalimage});

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
