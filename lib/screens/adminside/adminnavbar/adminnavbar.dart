import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tradom_io/db/function/tradecategory/tradecategoryfunction.dart';
import 'package:tradom_io/screens/adminside/admindrawer/admindrawer.dart';
import 'package:tradom_io/screens/adminside/adminhome/adminhomescreen.dart';
import 'package:tradom_io/screens/adminside/adminlearn/adminlearnscreen.dart';
import 'package:tradom_io/screens/adminside/adminmarket/adminmarketscreen.dart';
import 'package:tradom_io/screens/adminside/admintrade/admintradescreen.dart';
import 'package:tradom_io/screens/adminside/adminsignals/adminsignalscreen.dart';
import 'package:tradom_io/screens/adminside/admintrade/admintradesscreentabs.dart';

class AdminnavbarScreen extends StatefulWidget {
  int passingselectedindex;

  AdminnavbarScreen({super.key, required this.passingselectedindex});

  @override
  State<AdminnavbarScreen> createState() => _BottomNavState();
}

class _BottomNavState extends State<AdminnavbarScreen> {
//  final _currentSelectedIndex =  Widget();
  @override
  void initState() {
    // TODO: implement initState
    CategoryDB().refreshUI();

    super.initState();
  }

  final pages = [
    AdminTradesScreenTabs(),
    // AdmintradesScreen(),
    AdminsignalScreen(),
    AdminhomeScreen(),
    AdminmarketScreen(),
    AdminlearnScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: AdmindrawerScreen()),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 86, 133),
        leadingWidth: 70,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.account_circle,
                size: 35,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text(
          'Tradom.io',
          style: TextStyle(fontFamily: 'bauhaus', fontSize: 25),
        ),
        centerTitle: true,
      ),
      //If you want to show body behind the navbar, it should be true
      extendBody: true,
      body: pages[widget.passingselectedindex],
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: Color.fromARGB(255, 34, 86, 133),
        currentIndex: widget.passingselectedindex,
        onTap: (newIndex) {
          setState(() {
            widget.passingselectedindex = newIndex;
          });
        },
        items: [
          FloatingNavbarItem(icon: Icons.candlestick_chart, title: 'Trades'),
          FloatingNavbarItem(icon: Icons.show_chart, title: 'Signal'),
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.newspaper, title: 'Market'),
          FloatingNavbarItem(icon: Icons.tv, title: 'Learn'),
        ],
      ),
    );
  }
}
