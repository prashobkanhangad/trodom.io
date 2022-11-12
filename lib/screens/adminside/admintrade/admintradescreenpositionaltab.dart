import 'package:flutter/material.dart';
import 'package:tradom_io/db/function/tradecategory/tradecategoryfunction.dart';

import '../../../db/function/tradeideas/tradeidea_functions.dart';
import '../../../db/model/tradecategory/tradecategory.dart';
import '../../../db/model/tradeideamodel/tradeideadatamodel.dart';
import 'addingtradescreen.dart';
import 'admintradescreeninside.dart';

class AdminTradescreenpostionalTab extends StatelessWidget {
  const AdminTradescreenpostionalTab({super.key});

  @override
  Widget build(BuildContext context) {
    final wSize = MediaQuery.of(context).size.width;

    return Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 239, 247, 246)),
        child: Column(children: [
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
                    builder: (context) => AddingtradeSCreen(),
                  ));
                },
                icon: Icon(Icons.add)),
          ),
          Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 243, 248, 254)),

                  //

                  //listview stars here

                  //

                  child: ValueListenableBuilder(
                    valueListenable:
                        CategoryDB().positionalCategoryListListener,
                    builder: (BuildContext ctx,
                        List<CategoryModel> tradeidealist, Widget? child) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            final tradedata = tradeidealist[index];

                            return GestureDetector(
                              onTap: (() =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        AdmintradeinsideScreen(
                                      id: tradedata.id,
                                      entryprice: tradedata.entryprice,
                                      stockname: tradedata.stockname,
                                      stoploss: tradedata.stoploss,
                                      targetprice: tradedata.targetprice,
                                      index: index,
                                    ),
                                  ))),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 5.0, right: 7, bottom: 7),
                                child: Card(
                                  child: Container(
                                    height: 100,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12.0, top: 10),
                                          child: Text(tradedata.stockname,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
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
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.red),
                                                  ),
                                                  Text(tradedata.stoploss,
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.red)),
                                                ],
                                              ),
                                              // decoration: BoxDecoration(color: Colors.amber),
                                            ),
                                            SizedBox(
                                              height: 50,
                                              width: wSize * 0.31,
                                              // color: Color.fromARGB(255, 228, 228, 228),

                                              child: Column(
                                                children: [
                                                  const Text('Entry Price',
                                                      style: TextStyle(
                                                          fontSize: 18)),
                                                  Text(tradedata.entryprice,
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                              // decoration: BoxDecoration(color: Colors.amber),
                                            ),
                                            SizedBox(
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.green)),
                                                ],
                                              ),
                                              // decoration: BoxDecoration(color: Colors.amber),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
                  )))
        ]));
  }
}
