import 'package:flutter/material.dart';

import 'package:tradom_io/db/function/tradeideas/tradeidea_functions.dart';
import 'package:tradom_io/db/model/tradeideamodel/tradeideadatamodel.dart';
import 'package:tradom_io/screens/adminside/admintrade/radiobutton.dart';

import '../adminnavbar/adminnavbar.dart';

class AddingtradeSCreen extends StatelessWidget {
  AddingtradeSCreen({super.key});

  final _stoplosscontroller = TextEditingController();
  final _entrypricecontroller = TextEditingController();

  final _targetpricecontroller = TextEditingController();
  final _stocknamecontroller = TextEditingController();

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
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 300,
          width: double.maxFinite,
          decoration: const BoxDecoration(color: Colors.white),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              TradeScreenmRadiobutton(),
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
    );
  }

  ontradingsubmitbuttonpressed() {
    final _stoploss = _stoplosscontroller.text;
    final _entryprice = _entrypricecontroller.text;
    final _targetprice = _targetpricecontroller.text;
    final _stockname = _stocknamecontroller.text;

    if (_stoploss.isEmpty ||
        _entryprice.isEmpty ||
        _targetprice.isEmpty ||
        _stockname.isEmpty) {
      return;
    }

    final _tradeideas = tradeideamodel(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        stockname: _stockname,
        stoploss: _stoploss,
        entryprice: _entryprice,
        targetprice: _targetprice);
    addtradeidea(_tradeideas);
  }
}
