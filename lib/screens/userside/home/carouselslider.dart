import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tradom_io/screens/userside/learn/learninsidescreen.dart';

import '../../../db/function/learn/learnfunctions.dart';
import '../../../db/model/learn/learndatamodel.dart';

class CarouselsliderScreen extends StatelessWidget {
  const CarouselsliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ValueListenableBuilder(
          valueListenable: learnnotifier,
          builder:
              (BuildContext ctx, List<learnmodel> learnlist, Widget? child) {
            // final leardata = learnlist[learnlist.length - 1];

            return CarouselSlider(
              items: [
                learnlist == null
                    ? SizedBox()
                    :
                    //1st Image of Slider
                    GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LearninsideScreen(
                              key,
                              learnlist[learnlist.length - 1].learntitle,
                              learnlist[learnlist.length - 1].learncontent,
                              learnlist[learnlist.length - 1].learnimage),
                        )),
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: FileImage(File(
                                      learnlist[learnlist.length - 1]
                                          .learnimage)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 141.0),
                              child: Container(
                                margin: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                width: double.maxFinite,
                                height: 20,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 2),
                                  child: Text(
                                    learnlist[learnlist.length - 1].learntitle,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                //2nd Image of Slider
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LearninsideScreen(
                        key,
                        learnlist[learnlist.length - 2].learntitle,
                        learnlist[learnlist.length - 2].learncontent,
                        learnlist[learnlist.length - 2].learnimage),
                  )),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: FileImage(File(
                                learnlist[learnlist.length - 2].learnimage)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 141.0),
                        child: Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                          ),
                          width: double.maxFinite,
                          height: 20,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, top: 2),
                            child: Text(
                              learnlist[learnlist.length - 2].learntitle,
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                //3rd Image of Slider
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LearninsideScreen(
                        key,
                        learnlist[learnlist.length - 3].learntitle,
                        learnlist[learnlist.length - 3].learncontent,
                        learnlist[learnlist.length - 3].learnimage),
                  )),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: FileImage(File(
                                learnlist[learnlist.length - 3].learnimage)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 141.0),
                        child: Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                          ),
                          width: double.maxFinite,
                          height: 20,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, top: 2),
                            child: Text(
                              learnlist[learnlist.length - 3].learntitle,
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                //4th Image of Slider
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LearninsideScreen(
                        key,
                        learnlist[learnlist.length - 4].learntitle,
                        learnlist[learnlist.length - 4].learncontent,
                        learnlist[learnlist.length - 4].learnimage),
                  )),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: FileImage(File(
                                learnlist[learnlist.length - 4].learnimage)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 141.0),
                        child: Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                          ),
                          width: double.maxFinite,
                          height: 20,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, top: 2),
                            child: Text(
                              learnlist[learnlist.length - 4].learntitle,
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                //5th Image of Slider
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LearninsideScreen(
                        key,
                        learnlist[learnlist.length - 5].learntitle,
                        learnlist[learnlist.length - 5].learncontent,
                        learnlist[learnlist.length - 5].learnimage),
                  )),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: FileImage(File(
                                learnlist[learnlist.length - 5].learnimage)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 141.0),
                        child: Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0)),
                          ),
                          width: double.maxFinite,
                          height: 20,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, top: 2),
                            child: Text(
                              learnlist[learnlist.length - 5].learntitle,
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
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
            );
          }),
    );
  }
}
