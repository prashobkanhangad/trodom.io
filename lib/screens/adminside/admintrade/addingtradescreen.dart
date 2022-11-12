import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tradom_io/db/function/tradecategory/tradecategoryfunction.dart';

import 'package:tradom_io/db/function/tradeideas/tradeidea_functions.dart';
import 'package:tradom_io/db/model/tradecategory/tradecategory.dart';
import 'package:tradom_io/db/model/tradeideamodel/tradeideadatamodel.dart';
import 'package:tradom_io/screens/adminside/admintrade/radiobutton.dart';

import '../adminnavbar/adminnavbar.dart';

class AddingtradeSCreen extends StatefulWidget {
  AddingtradeSCreen({super.key});

  @override
  State<AddingtradeSCreen> createState() => _AddingtradeSCreenState();
}

enum SingingCharacter { intraday, positional }

class _AddingtradeSCreenState extends State<AddingtradeSCreen> {
  final _stoplosscontroller = TextEditingController();

  final _entrypricecontroller = TextEditingController();

  final _targetpricecontroller = TextEditingController();

  final _stocknamecontroller = TextEditingController();

  SingingCharacter? character = SingingCharacter.intraday;

  @override
  Widget build(BuildContext context) {
    final wSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 86, 133),
        title: const Text('Tradom.io'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 7.0, right: 7, top: 12),
        child: Card(
          child: Container(
            height: 300,
            width: wSize,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(7)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text('  Add Trade Ideas Here',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 30,
                    width: 318,
                    child: TextField(
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlignVertical: TextAlignVertical.bottom,
                      controller: _stocknamecontroller,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.characters,
                      // cursorHeight: 10,
                      decoration: InputDecoration(
                        focusColor: Colors.black,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                        hintText: 'Stock Name',
                        hintStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 22),
                  child: Row(
                    children: const [
                      TradeScreenmRadiobutton(
                          title: 'Intraday', type: CategoryType.intraday),
                      Spacer(),
                      TradeScreenmRadiobutton(
                          title: 'Positional', type: CategoryType.positional)
                    ],
                  ),
                ),

                //

                // Row(
                //   children: [
                //     Container(
                //       width: 180,
                //       child: ListTile(
                //         title: const Text('Intraday'),
                //         leading: Radio<SingingCharacter>(
                //           value: SingingCharacter.intraday,
                //           groupValue: character,
                //           onChanged: (SingingCharacter? value) {
                //             setState(() {
                //               character = value;
                //             });
                //           },
                //         ),
                //       ),
                //     ),
                //     Container(
                //       width: 180,
                //       child: ListTile(
                //         title: const Text('Positional'),
                //         leading: Radio<SingingCharacter>(
                //           value: SingingCharacter.positional,
                //           groupValue: character,
                //           onChanged: (SingingCharacter? value) {
                //             setState(() {
                //               character = value;
                //             });
                //           },
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                //
                SizedBox(),
                Row(
                  children: [
                    Container(
                      height: 65,
                      width: wSize * 0.31,
                      // color: Color.fromARGB(255, 228, 228, 228),

                      child: Column(
                        children: [
                          const Text(
                            'Stop Loss',
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 30,
                            width: 80,
                            child: TextField(
                              controller: _stoplosscontroller,
                              keyboardType: TextInputType.number,
                              // cursorHeight: 10,
                              decoration: InputDecoration(
                                focusColor: Colors.black,
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // decoration: BoxDecoration(color: Colors.amber),
                    ),
                    Container(
                      height: 65,
                      width: wSize * 0.31,
                      // color: Color.fromARGB(255, 228, 228, 228),

                      child: Column(
                        children: [
                          Text('Entry Price', style: TextStyle(fontSize: 18)),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 30,
                            width: 80,
                            child: TextField(
                              controller: _entrypricecontroller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                focusColor: Colors.black,
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 65,
                      width: wSize * 0.31,
                      child: Column(
                        children: [
                          const Text('Target Price',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.green)),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 30,
                            width: 80,
                            child: TextField(
                              controller: _targetpricecontroller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                focusColor: Colors.black,
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            ontradingsubmitbuttonpressed();
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AdminnavbarScreen(
                                passingselectedindex: 0,
                              ),
                            ));
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ontradingsubmitbuttonpressed() {
    final _stoploss = _stoplosscontroller.text;
    final _entryprice = _entrypricecontroller.text;
    final _targetprice = _targetpricecontroller.text;
    final _stockname = _stocknamecontroller.text;
    final _type = selectedCategoryNotifier.value;

    if (_stoploss.isEmpty ||
        _entryprice.isEmpty ||
        _targetprice.isEmpty ||
        _stockname.isEmpty) {
      return;
    }

    // final _tradeideas = tradeideamodel(
    //     id: DateTime.now().microsecondsSinceEpoch.toString(),
    //     stockname: _stockname,
    //     stoploss: _stoploss,
    //     entryprice: _entryprice,
    //     targetprice: _targetprice,
    //     type: _type.toString());

    // addtradeidea(_tradeideas);

    final _catogorytrade = CategoryModel(
        type: _type,
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        entryprice: _entryprice,
        stockname: _stockname,
        stoploss: _stoploss,
        targetprice: _targetprice);

    CategoryDB().insertCategory(_catogorytrade);

    // log(_stockname);
  }
}
