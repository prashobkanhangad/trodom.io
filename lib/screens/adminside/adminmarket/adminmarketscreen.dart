import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tradom_io/db/function/market/marketfunctions.dart';
import 'package:tradom_io/db/model/marketmodel/marketdatamodel.dart';
import 'package:tradom_io/screens/adminside/adminmarket/addingmarketscreen.dart';
import 'package:tradom_io/screens/adminside/adminmarket/adminmarketscreeninside.dart';

class AdminmarketScreen extends StatelessWidget {
  const AdminmarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wSize = MediaQuery.of(context).size.width;
    getmarket();
    return Column(
      children: [
        Container(
          height: 50,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color.fromARGB(255, 243, 248, 254),
          ),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddingmarketScreen(),
                ));
              },
              icon: Icon(Icons.add)),
        ),

        // add option  ending here

        Expanded(
          child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 243, 248, 254)),

              //listview starts here

              child: ValueListenableBuilder(
                  valueListenable: marketnotifier,
                  builder: (BuildContext ctx, List<marketmodel> marketlist,
                      Widget? child) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          final marketdata = marketlist[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15, top: 5, bottom: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return AdminmarketinsideScreen(
                                      id: index,
                                      title: marketdata.markettitle,
                                      news: marketdata.marketnews,
                                      imagenews: marketdata.marketimage,
                                      // index: index.toString(),
                                    );
                                  },
                                ));
                              },
                              child: Container(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: double.infinity,
                                height: 220,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 45,
                                        child: Text(
                                          marketdata.markettitle,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: FileImage(File(
                                                    marketdata.marketimage))),
                                            width: wSize * 0.35,
                                            height: 100,
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: wSize * 0.5,
                                            height: 110,
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            child: Text(
                                              marketdata.marketnews,
                                              textAlign: TextAlign.justify,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Row(
                                          children: [
                                            Text(marketdata.marketdate),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
                        itemCount: marketlist.length);
                  })),
        ),
      ],
    );
  }
}
