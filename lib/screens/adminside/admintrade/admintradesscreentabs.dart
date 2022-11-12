import 'package:flutter/material.dart';
import 'package:tradom_io/db/function/tradecategory/tradecategoryfunction.dart';
import 'package:tradom_io/db/function/tradeideas/tradeidea_functions.dart';
import 'package:tradom_io/screens/adminside/admintrade/admintradescreenintradaytab.dart';
import 'package:tradom_io/screens/adminside/admintrade/admintradescreenpositionaltab.dart';
import 'package:tradom_io/screens/userside/trades/trackrecord.dart';
import 'package:tradom_io/screens/userside/trades/tradescreenintraday.dart';
import 'package:tradom_io/screens/userside/trades/tradescreenpositional.dart';

class AdminTradesScreenTabs extends StatefulWidget {
  const AdminTradesScreenTabs({super.key});

  @override
  State<AdminTradesScreenTabs> createState() => _TradesScreenState();
}

class _TradesScreenState extends State<AdminTradesScreenTabs> {
  @override
  void initState() {
    // TODO: implement initState
    CategoryDB().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final wSize = MediaQuery.of(context).size.width;
    gettradeidea();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 1,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 34, 86, 133),
            labelColor: Color.fromARGB(255, 34, 86, 133),
            unselectedLabelColor: Color.fromARGB(255, 34, 86, 133),
            tabs: [
              Tab(
                text: "Intraday",
              ),
              Tab(text: "Positional"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AdminTradescreenintradayTab(),
            AdminTradescreenpostionalTab(),
          ],
        ),
      ),
    );
  }
}
