import 'dart:developer';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tradom_io/db/function/signal/signalfunctions.dart';
import 'package:tradom_io/db/model/signalmodel/signaldatamodel.dart';
import 'package:tradom_io/screens/userside/signal/signalscreeninside.dart';

class CarouselsliderScreen2 extends StatelessWidget {
  const CarouselsliderScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    ;

    return ValueListenableBuilder(
        valueListenable: signalsnotifier,
        builder:
            (BuildContext ctx, List<signalmodel> signallist, Widget? child) {
          final signaldata = signallist[signallist.length - 1];

          // log(signallist[signallist.length - 5].signaltitle);

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CarouselSlider(
              items: [
                //1st Image of Slider
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: signallist.length < 6
                              ? const AssetImage('asset/chart.jpg')
                                  as ImageProvider
                              : FileImage(File(signaldata.signalimage)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 141.0),
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                        ),
                        width: double.maxFinite,
                        height: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, top: 2),
                          child: Text(
                            signallist[signallist.length - 1].signaltitle,
                            style: const TextStyle(
                                fontSize: 13,
                                letterSpacing: 0.7,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                //2nd Image of Slider
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: signallist.length < 7
                              ? const AssetImage('asset/chart.jpg')
                                  as ImageProvider
                              : FileImage(File(signallist[signallist.length - 2]
                                  .signalimage)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 141.0),
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                        ),
                        width: double.maxFinite,
                        height: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, top: 2),
                          child: Text(
                            signallist[signallist.length - 2].signaltitle,
                            style: const TextStyle(
                                fontSize: 13,
                                letterSpacing: 0.7,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                //3rd Image of Slider
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: signallist.length < 8
                              ? const AssetImage('asset/chart.jpg')
                                  as ImageProvider
                              : FileImage(File(signallist[signallist.length - 3]
                                  .signalimage)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 141.0),
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                        ),
                        width: double.maxFinite,
                        height: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, top: 2),
                          child: Text(
                            signallist[signallist.length - 3].signaltitle,
                            style: const TextStyle(
                                fontSize: 13,
                                letterSpacing: 0.7,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                //4th Image of Slider
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: signallist.length < 9
                              ? const AssetImage('asset/chart.jpg')
                                  as ImageProvider
                              : FileImage(File(signallist[signallist.length - 4]
                                  .signalimage)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 141.0),
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                        ),
                        width: double.maxFinite,
                        height: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, top: 2),
                          child: Text(
                            signallist[signallist.length - 4].signaltitle,
                            style: const TextStyle(
                                fontSize: 13,
                                letterSpacing: 0.7,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                //5th Image of Slider
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: signallist.length < 10
                              ? const AssetImage('asset/chart.jpg')
                                  as ImageProvider
                              : FileImage(File(signallist[signallist.length - 5]
                                  .signalimage)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 141.0),
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                        ),
                        width: double.maxFinite,
                        height: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, top: 2),
                          child: Text(
                            signallist[signallist.length - 5].signaltitle,
                            style: const TextStyle(
                                fontSize: 13,
                                letterSpacing: 0.7,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: false,
                autoPlay: false,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          );
        });
  }
}
