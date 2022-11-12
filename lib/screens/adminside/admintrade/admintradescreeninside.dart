import 'package:flutter/material.dart';
import 'package:tradom_io/db/function/tradecategory/tradecategoryfunction.dart';
import 'package:tradom_io/db/function/tradeideas/tradeidea_functions.dart';
import 'package:tradom_io/screens/adminside/admintrade/edittradescreen.dart';

import '../adminnavbar/adminnavbar.dart';

class AdmintradeinsideScreen extends StatelessWidget {
  final String stockname, stoploss, entryprice, targetprice, id;
  final int index;

  AdmintradeinsideScreen(
      {super.key,
      required this.stockname,
      required this.stoploss,
      required this.entryprice,
      required this.targetprice,
      required this.id,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final wSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 86, 133),
        title: const Text('Tradom.io'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 12),
            child: SizedBox(
              width: double.maxFinite,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EdittradeideaSCreen(
                          id: id,
                          index: index,
                          entryprice: entryprice,
                          stockname: stockname,
                          stoploss: stoploss,
                          targetprice: targetprice),
                    )),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 34, 86, 133),
                      ),
                      width: 150,
                      height: 40,
                      child: const Center(
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'Are You Sure To Delete',
                          style: TextStyle(fontSize: 18),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {
                              CategoryDB().deleteCategory(id);
                              // log(id.toString());

                              Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AdminnavbarScreen(
                                  passingselectedindex: 0,
                                ),
                              ));
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 34, 86, 133),
                      ),
                      width: 150,
                      height: 40,
                      child: const Center(
                        child: Text(
                          'Delete',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
