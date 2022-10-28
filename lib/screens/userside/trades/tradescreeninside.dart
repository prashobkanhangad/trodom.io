import 'package:flutter/material.dart';

class TradeinsideScreen extends StatelessWidget {
  final String stockname, stoploss, entryprice, targetprice;

  const TradeinsideScreen(
      {super.key,
      required this.stockname,
      required this.stoploss,
      required this.entryprice,
      required this.targetprice});

  @override
  Widget build(BuildContext context) {
    final wSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 86, 133),
        title: const Text('Tradom.io',
            style: TextStyle(fontFamily: 'bauhaus', fontSize: 25)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12, top: 12),
            child: Container(
              height: 100,
              width: double.maxFinite,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 8),
                    child: Text(stockname,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: wSize * 0.31,
                        // color: Color.fromARGB(255, 228, 228, 228),

                        child: Column(
                          children: [
                            const Text(
                              'Stop Loss',
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                            Text(stoploss,
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
                            Text(entryprice,
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
                                style: TextStyle(
                                    fontSize: 18, color: Colors.green)),
                            Text(targetprice,
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
            ),
          ),
        ],
      ),
    );
  }
}
