import 'package:flutter/material.dart';

import 'package:tradom_io/screens/userside/marketscreen/marketscreen.dart';
import 'package:tradom_io/screens/userside/marketscreen/postmarket.dart';
import 'package:tradom_io/screens/userside/marketscreen/premarket.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({super.key});

  @override
  Widget build(BuildContext context) {
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
              Tab(text: "All"),
              Tab(text: "Pre Market"),
              Tab(text: "Post Market")
            ],
          ),
        ),
        body: TabBarView(
          
          children: [
            MarketScreen(),
            Premarket(),
            Postmarket(),
          ],
        ),
      ),
    );
  }
}
