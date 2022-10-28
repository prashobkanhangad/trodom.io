import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tradom_io/screens/userside/learn/learninsidescreen.dart';

import '../../../db/function/learn/learnfunctions.dart';
import '../../../db/model/learn/learndatamodel.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: learnnotifier,
        builder: (BuildContext ctx, List<learnmodel> learnlist, Widget? child) {
          return Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 239, 247, 246)),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final learndata = learnlist[index];

                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LearninsideScreen(
                          key,
                          learndata.learntitle,
                          learndata.learncontent,
                          learndata.learnimage),
                    )),
                    child: Container(
                      width: double.maxFinite,
                      // height: 260,
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.maxFinite,
                              height: 190,
                              child: Image(
                                  fit: BoxFit.cover,
                                  // height: 170,
                                  image: FileImage(File(learndata.learnimage))),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                learndata.learntitle,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: learnlist.length),
          );
        });
  }
}
