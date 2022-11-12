import 'package:flutter/material.dart';
import 'package:tradom_io/db/model/tradecategory/tradecategory.dart';
import '../../../db/function/tradecategory/tradecategoryfunction.dart';


class LatestTrade extends StatelessWidget {
  const LatestTrade({super.key});

  @override
  Widget build(BuildContext context) {
    final wSize = MediaQuery.of(context).size.width;

    return ValueListenableBuilder(
        valueListenable: CategoryDB().intradayCategoryListListener,
        builder: (BuildContext ctx, List<CategoryModel> tradeidealist,
            Widget? child) {
          final tradedata = tradeidealist[tradeidealist.length - 1];
          // log(tradedata.id);
          {
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
                      Text(tradedata.stockname,
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
                            Text(tradedata.stoploss,
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
                            Text(tradedata.entryprice,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: wSize * 0.31,
                        child: Column(
                          children: [
                            const Text('Target Price',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.green)),
                            Text(tradedata.targetprice,
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
          }
        });
  }
}
