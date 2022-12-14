import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:tradom_io/screens/adminside/adminhome/adminlasttrade.dart';
import 'package:tradom_io/screens/adminside/adminmarket/adminmarketscreeninside.dart';
import 'package:tradom_io/screens/userside/home/carouselslider.dart';
import 'package:tradom_io/screens/userside/home/carouselslidertwo.dart';

import '../../../db/function/market/marketfunctions.dart';
import '../../../db/model/marketmodel/marketdatamodel.dart';

class AdminhomeScreen extends StatelessWidget {
  const AdminhomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/background_graphics.jpg'),
            fit: BoxFit.cover),
      ),
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: GlassmorphicContainer(
            borderRadius: 20,
            linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFffffff).withOpacity(0.1),
                  const Color(0xFFFFFFFF).withOpacity(0.05),
                ],
                stops: const [
                  0.1,
                  1,
                ]),
            border: 4,
            blur: 5,
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(255, 34, 86, 133).withOpacity(0.5),
                Color.fromARGB(255, 134, 169, 199).withOpacity(0.5),
              ],
            ),
            width: double.maxFinite,
            height: 180,
            child: Image(image: AssetImage('asset/welcome_page.png')),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 50,
          color: Color.fromARGB(255, 34, 86, 133),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Trade With Our PRO TRADERS. . !',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('object');
                    },
                    child: Container(
                      width: 55,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: const Center(
                          child: Text(
                        'OPEN',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
// last trade starts here

        Container(
          width: double.maxFinite,
          height: 97,
          color: Colors.white,
          child: Column(
            children: const [
              SizedBox(
                height: 10,
              ),
              AdminLatestTrade(),
              Divider(
                height: 2,
                thickness: 2,
                color: Color.fromARGB(255, 31, 132, 122),
              )
            ],
          ),
        ),

        //
// slider stars here
        //

        CarouselsliderScreen(),

// slider stars here

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            ' Trending News',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ValueListenableBuilder(
            valueListenable: marketnotifier,
            builder: (BuildContext ctx, List<marketmodel> marketlist,
                Widget? child) {
              final marketdata = marketlist[marketlist.length - 1];
              // log(marketlist.length.toString());
              return GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AdminmarketinsideScreen(
                      id: marketlist.length - 1,
                      // index: marketdata.toString(),
                      title: marketdata.markettitle,
                      news: marketdata.marketnews,
                      imagenews: marketdata.marketimage),
                )),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 242, 241, 241),
                  ),
                  width: double.maxFinite,
                  height: 450,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Image(
                          width: double.maxFinite,
                          height: 200,
                          fit: BoxFit.cover,
                          image: marketlist.length < 2
                              ? const AssetImage(
                                      'asset/beautiful-shot-snowy-mountains-with-dark-blue-sky-scaled.jpg')
                                  as ImageProvider
                              : FileImage(
                                  File(marketdata.marketimage),
                                ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          marketdata.markettitle,
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          height: 180,
                          child: Text(
                            marketdata.marketnews,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        Container(
          width: double.maxFinite,
          height: 50,
          color: Color.fromARGB(255, 34, 86, 133),
          child: Center(
            child: GestureDetector(
              onTap: () {
                print('object');
              },
              child: const Center(
                child: Text(
                  'Open Demate Account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3),
                ),
              ),
            ),
          ),
        ),
        CarouselsliderScreen2()
      ]),
    );
  }
}
