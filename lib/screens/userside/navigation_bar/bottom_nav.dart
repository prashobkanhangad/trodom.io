import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tradom_io/screens/userside/about/about.dart';
import 'package:tradom_io/screens/userside/home/homescreen.dart';
import 'package:tradom_io/screens/userside/learn/learnscreen.dart';
import 'package:tradom_io/screens/userside/marketscreen/tabbar.dart';
import 'package:tradom_io/screens/userside/trades/tradesscreen.dart';
import 'package:tradom_io/screens/userside/signal/signalscreen.dart';
import '../../../db/model/usermodel/usermodel.dart';
import '../drawer/drawerscreen.dart';

class BottomnavScreen extends StatefulWidget {
  const BottomnavScreen({super.key});

  @override
  State<BottomnavScreen> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomnavScreen> {
  int _currentSelectedIndex = 2;

  final pages = [
    const TradesScreen(),
    const SignalScreen(),
    const HomeScreen(),
    const Tabbar(),
    const LearnScreen(),
  ];
  // User? user = FirebaseAuth.instance.currentUser;
  // UserModel loggedInuser = UserModel();

  // @override
  // void initState() {
  //   // TODO: implement initState

  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user!.uid)
  //       .get()
  //       .then((value) {
  //     loggedInuser = UserModel.fromMap(value.data());
  //     setState(() {});
  //     // print(value.toString());
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: DrawerScreen()),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 132, 122),
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
        actions: [
          GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AboutScreen(),
                  )),
                  child: Container(
                      width: 45,
                      child: Image.asset(
                        'asset/tradom_logo.png',
                      )),
                ),
              )),
        ],
      ),
      //If you want to show body behind the navbar, it should be true
      extendBody: true,
      body: pages[_currentSelectedIndex],
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: Color.fromARGB(255, 31, 132, 122),
        currentIndex: _currentSelectedIndex,
        onTap: (newIndex) {
          setState(() {
            _currentSelectedIndex = newIndex;
          });
        },
        items: [
          FloatingNavbarItem(icon: Icons.candlestick_chart, title: 'Trades'),
          FloatingNavbarItem(icon: Icons.show_chart, title: 'SIgnals'),
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.newspaper, title: 'Market'),
          FloatingNavbarItem(icon: Icons.tv, title: 'Learn'),
        ],
      ),
    );
  }
}
