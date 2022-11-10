import 'package:flutter/material.dart';
import 'package:tradom_io/screens/userside/trades/tradescreeninside.dart';

import '../../../db/function/tradeideas/tradeidea_functions.dart';
import '../../../db/model/tradeideamodel/tradeideadatamodel.dart';

class Tradescreenintraday extends StatelessWidget {
  const Tradescreenintraday({super.key});

  @override
  Widget build(BuildContext context) {
    final wSize = MediaQuery.of(context).size.width;
    return Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 239, 247, 246)),

        //

        //listview stars here

        //

        child: ValueListenableBuilder(
          valueListenable: tradeidealistnotifier,
          builder: (BuildContext ctx, List<tradeideamodel> tradeidealist,
              Widget? child) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final tradedata = tradeidealist[index];

                  return Padding(
                    padding: const EdgeInsets.only(left: 7.0, right: 7, top: 7),
                    child: Card(
                      child: Container(
                        height: 130,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 10),
                              child: Text(tradedata.stockname,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: wSize * 0.31,
                                  // color: Color.fromARGB(255, 228, 228, 228),

                                  child: Column(
                                    children: [
                                      const Text(
                                        'Stop Loss',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.red),
                                      ),
                                      Text(tradedata.stoploss,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red)),
                                    ],
                                  ),
                                  // decoration: BoxDecoration(color: Colors.amber),
                                ),
                                Container(
                                  height: 50,
                                  width: wSize * 0.31,
                                  // color: Color.fromARGB(255, 228, 228, 228),

                                  child: Column(
                                    children: [
                                      const Text('Entry Price',
                                          style: TextStyle(fontSize: 18)),
                                      Text(tradedata.entryprice,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  // decoration: BoxDecoration(color: Colors.amber),
                                ),
                                Container(
                                  height: 50,
                                  width: wSize * 0.31,
                                  // color: Color.fromARGB(255, 228, 228, 228),

                                  child: Column(
                                    children: [
                                      const Text('Target Price',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.green)),
                                      Text(tradedata.targetprice,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green)),
                                    ],
                                  ),
                                  // decoration: BoxDecoration(color: Colors.amber),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Spacer(),
                                  Text(
                                    'Trade Status - ',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 63, 63, 63),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text('Running',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                itemCount: tradeidealist.length);
          },
        ));
  }
}
