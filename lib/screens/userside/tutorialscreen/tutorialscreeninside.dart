import 'package:flutter/material.dart';

class TutorialScreenInside extends StatelessWidget {
  final String title;
  final int id;

  const TutorialScreenInside(
      {super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 132, 122),
        title: const Text('Tradom.io',
            style: TextStyle(fontFamily: 'bauhaus', fontSize: 25)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: double.maxFinite,
              height: 200,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 31, 132, 122),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
