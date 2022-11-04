import 'package:flutter/material.dart';
import 'package:tradom_io/screens/userside/tutorialscreen/tutorialscreeninside.dart';

class TutorialScrenn extends StatelessWidget {
  TutorialScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 132, 122),
        title: const Text('Tradom.io',
            style: TextStyle(fontFamily: 'bauhaus', fontSize: 25)),
        centerTitle: true,
      ),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 239, 247, 246)),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8, top: 10),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TutorialScreenInside(
                      title: coursesList[index], id: index),
                )),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      coursesList[index],
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: coursesList.length,
          separatorBuilder: (context, index) {
            return const SizedBox(
                // height: 0,
                );
          },
        ),
      ),
    );
  }

  List coursesList = [
    'Introduction To Stock MArket',
    'Basics of stock market',
    'Intraday trading in equity',
    'Swing Trading',
    'Futures and options'
  ];
}
