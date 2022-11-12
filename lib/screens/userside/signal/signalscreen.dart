import 'dart:io';

import 'package:flutter/material.dart';

import '../../../db/function/signal/signalfunctions.dart';
import '../../../db/model/signalmodel/signaldatamodel.dart';

class SignalScreen extends StatelessWidget {
  const SignalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 239, 247, 246)),
      child: ValueListenableBuilder(
          valueListenable: signalsnotifier,
          builder:
              (BuildContext ctx, List<signalmodel> signallist, Widget? child) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final signaldata = signallist[index];

                  return Container(
                    width: double.maxFinite,
                    // height: 240,
                    color: Color.fromARGB(255, 247, 247, 247),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 12.0, right: 12, top: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            width: double.maxFinite,
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image(
                                fit: BoxFit.cover,
                                // height: 170,
                                image: index < 5
                                    ? const AssetImage('asset/chart.jpg')
                                        as ImageProvider
                                    : FileImage(
                                        File(signaldata.signalimage),
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            // height: 20,
                            child: Text(
                              signaldata.signaltitle,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: signallist.length);
          }),
    );
  }
}
