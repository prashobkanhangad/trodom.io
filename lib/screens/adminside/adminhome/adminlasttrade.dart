
import 'package:flutter/material.dart';

import '../../../db/function/tradeideas/tradeidea_functions.dart';
import '../../../db/model/tradeideamodel/tradeideadatamodel.dart';

class AdminLatestTrade extends StatelessWidget {
  const AdminLatestTrade({super.key});

  @override
  Widget build(BuildContext context) {
    final wSize = MediaQuery.of(context).size.width;

    return ValueListenableBuilder(
        valueListenable: tradeidealistnotifier,
        builder: (BuildContext ctx, List<tradeideamodel> tradeidealist,
            Widget? child) {
          final data = tradeidealist[tradeidealist.length - 1];

          return Container(
            height: 85,
            width: double.maxFinite,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('  Latest Trade - ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(data.stockname,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: wSize * 0.31,
                      child: Column(
                        children: [
                          const Text(
                            'Stop Loss',
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                          Text(data.stoploss,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: wSize * 0.31,
                      child: Column(
                        children: [
                          const Text('Entry Price',
                              style: TextStyle(fontSize: 18)),
                          Text(data.entryprice,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: wSize * 0.31,
                      child: Column(
                        children: [
                          const Text('Target Price',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.green)),
                          Text(data.targetprice,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
