import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../db/function/tradeideas/tradeidea_functions.dart';
import '../../../db/model/tradeideamodel/tradeideadatamodel.dart';

class TrackRecord extends StatefulWidget {
  const TrackRecord({super.key});

  @override
  State<TrackRecord> createState() => _TrackRecordState();
}

class _TrackRecordState extends State<TrackRecord> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: tradeidealistnotifier,
        builder: (BuildContext ctx, List<tradeideamodel> tradeidealist,
            Widget? child) {
          return Container(
            // height: 200,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 239, 247, 246)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Card(
                    child: Container(
                      height: 170,
                      width: double.maxFinite,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 7,
                            ),
                            const Text(
                              'Track Record',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Total Trades',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Container(
                                  width: 190,
                                  child: LinearPercentIndicator(
                                    width: 170.0,
                                    animation: true,
                                    animationDuration: 1000,
                                    lineHeight: 7.0,
                                    percent: 1,
                                    // center: Text("20.0%"),
                                    progressColor:
                                        const Color.fromARGB(255, 255, 225, 0),
                                    trailing:
                                        Text(tradeidealist.length.toString()),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                const Text('Winning Trades',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                const Spacer(),
                                Container(
                                  width: 190,
                                  child: LinearPercentIndicator(
                                    width: 170.0,
                                    animation: true,
                                    animationDuration: 1000,
                                    lineHeight: 7.0,
                                    percent: 0.55,
                                    // center: Text("20.0%"),
                                    progressColor:
                                        const Color.fromARGB(255, 0, 255, 8),
                                    trailing: const Text('11'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                const Text('Losing Trades',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                const Spacer(),
                                Container(
                                  width: 190,
                                  child: LinearPercentIndicator(
                                    width: 170.0,
                                    animation: true,
                                    animationDuration: 1000,
                                    lineHeight: 7.0,
                                    percent: 0.3,
                                    // center: Text("20.0%"),
                                    progressColor: Colors.red,
                                    trailing: const Text('6'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                const Text('Running Trades',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                const Spacer(),
                                Container(
                                  width: 190,
                                  child: LinearPercentIndicator(
                                    width: 170.0,
                                    animation: true,
                                    animationDuration: 1000,
                                    lineHeight: 7.0,
                                    percent: 0.15,
                                    // center: Text("20.0%"),
                                    progressColor:
                                        const Color.fromARGB(255, 0, 110, 255),
                                    trailing: const Text('3'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                      child: Container(
                    height: 380,
                    child: LineChart(
                      LineChartData(
                          maxX: 30,
                          maxY: 4,
                          minX: 0,
                          minY: -4,
                          lineBarsData: [
                            LineChartBarData(spots: [
                              const FlSpot(0, 0),
                              const FlSpot(2, 4),
                              const FlSpot(3, -3),
                              const FlSpot(4, 3)
                            ], isCurved: true),
                          ]),
                    ),
                  ))
                ],
              ),
            ),
          );
        });
  }
}
