import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tradom_io/screens/userside/marketscreen/marketscreeninside.dart';
import '../../../db/function/market/marketfunctions.dart';
import '../../../db/model/marketmodel/marketdatamodel.dart';

class Premarket extends StatelessWidget {
  const Premarket({super.key});

  @override
  Widget build(BuildContext context) {
    final wSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 239, 247, 246)),
        child: ValueListenableBuilder(
            valueListenable: marketnotifier,
            builder: (BuildContext ctx, List<marketmodel> marketlist,
                Widget? child) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final marketdata = marketlist[index];
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MarketinsideScreen(
                                  title: marketdata.markettitle,
                                  news: marketdata.marketnews,
                                  imagenews: marketdata.marketimage),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          width: double.infinity,
                          height: 210,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    SizedBox(
                                      width: wSize * 0.35,
                                      height: 100,
                                      child: Image(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                              File(marketdata.marketimage))),
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
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(marketdata.marketdate)
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 5,
                    );
                  },
                  itemCount: marketlist.length);
            }),
      ),
    );
  }
}
