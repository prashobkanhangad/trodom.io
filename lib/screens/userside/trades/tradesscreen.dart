import 'package:flutter/material.dart';
import 'package:tradom_io/db/function/tradeideas/tradeidea_functions.dart';
import 'package:tradom_io/screens/userside/trades/trackrecord.dart';
import 'package:tradom_io/screens/userside/trades/tradescreenintraday.dart';
import 'package:tradom_io/screens/userside/trades/tradescreenpositional.dart';

class TradesScreen extends StatefulWidget {
  const TradesScreen({super.key});

  @override
  State<TradesScreen> createState() => _TradesScreenState();
}

class _TradesScreenState extends State<TradesScreen> {
  @override
  Widget build(BuildContext context) {
    final wSize = MediaQuery.of(context).size.width;
    gettradeidea();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 1,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 31, 132, 122),
            labelColor: Color.fromARGB(255, 31, 132, 122),
            unselectedLabelColor: Color.fromARGB(255, 31, 132, 122),
            tabs: [
              Tab(
                text: "Intraday",
              ),
              Tab(text: "Positional"),
              Tab(text: "Track Record")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Tradescreenintraday(),
            Tradescreenpostional(),
            TrackRecord()
          ],
        ),
      ),
    );
  }
}
