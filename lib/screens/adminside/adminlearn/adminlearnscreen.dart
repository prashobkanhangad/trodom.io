import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tradom_io/db/function/learn/learnfunctions.dart';
import 'package:tradom_io/db/model/learn/learndatamodel.dart';
import 'package:tradom_io/screens/adminside/adminlearn/addinglearnscreen.dart';
import 'package:tradom_io/screens/adminside/adminlearn/adminlearnscreeninside.dart';

class AdminlearnScreen extends StatelessWidget {
  const AdminlearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 243, 248, 254),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddinglaernScreen(),
                ));
              },
              icon: Icon(Icons.add)),
        ),
        Expanded(
          child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 243, 248, 254)),
              child: ValueListenableBuilder(
                  valueListenable: learnnotifier,
                  builder: (BuildContext ctx, List<learnmodel> learnlist,
                      Widget? child) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          final learndata = learnlist[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return AdminlearninsideScreen(
                                    id: index,
                                    title: learndata.learntitle,
                                    news: learndata.learncontent,
                                    imagelearn: learndata.learnimage,
                                  );
                                },
                              ));
                            },
                            child: Container(
                              width: double.maxFinite,
                              // height: 230,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12, top: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.maxFinite,
                                      height: 200,
                                      child: Image(
                                          fit: BoxFit.cover,
                                          // height: 170,
                                          image: FileImage(
                                              File(learndata.learnimage))),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      learndata.learntitle,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: learnlist.length);
                  })),
        ),
      ],
    );
  }
}
