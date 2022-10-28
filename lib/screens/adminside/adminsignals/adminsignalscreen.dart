import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tradom_io/db/function/signal/signalfunctions.dart';
import 'package:tradom_io/db/model/signalmodel/signaldatamodel.dart';
import 'package:tradom_io/screens/adminside/adminsignals/addingsignalscreen.dart';
import 'package:tradom_io/screens/adminside/adminsignals/adminsignalscreeninside.dart';

class AdminsignalScreen extends StatelessWidget {
  AdminsignalScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            // color: Color.fromARGB(255, 243, 248, 254),
          ),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Addingsignal(),
                ));
              },
              icon: const Icon(Icons.add)),
        ),
        Expanded(
          child: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 243, 248, 254)),

            //
            //listview starts here
            //
            child: ValueListenableBuilder(
              valueListenable: signalsnotifier,
              builder: (BuildContext ctx, List<signalmodel> signallist,
                  Widget? child) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final signaldata = signallist[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AdminsignalinsideScreen(
                              id: index,
                              title: signaldata.signaltitle,
                              signalimage: signaldata.signalimage,
                            ),
                          ));
                        },
                        child: Container(
                          width: double.maxFinite,
                          // height: 240,
                          color: const Color.fromARGB(255, 247, 247, 247),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12, top: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: double.maxFinite,
                                    height: 200,
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: FileImage(File(
                                          signaldata.signalimage.toString())),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  signaldata.signaltitle,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: signallist.length);
              },
            ),
          ),
        ),
      ],
    );
  }
}

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// import '../../../db/model/signalmodel/signaldatamodel.dart';
// import '../../../main.dart';
// import 'adminsignalscreeninside.dart';

// class AdminsignalScreen extends StatelessWidget {
//   const AdminsignalScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double _w = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Scaffold(
//         body: ValueListenableBuilder(
//           valueListenable: databasebox.listenable(),
//           builder:
//               (BuildContext context, Box<signalmodel> data, Widget? child) {
//             return databasebox.isEmpty
//                 ? Text("Videos")
//                 : ListView.builder(
//                     padding: EdgeInsets.all(_w / 30),
//                     physics: const BouncingScrollPhysics(
//                         parent: AlwaysScrollableScrollPhysics()),
//                     itemCount: databasebox.values.length, ///////
//                     //video Length.................
//                     ///
//                     itemBuilder: (BuildContext context, int index) {
//                       signalmodel? data = databasebox.getAt(index);

//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => AdminsignalinsideScreen(
//                               index: index,
//                               title: data.signaltitle,
//                               signalimage: data.signalimage,
//                             ),
//                           ));
//                         },
//                         child: Container(
//                           width: double.maxFinite,
//                           height: 240,
//                           color: const Color.fromARGB(255, 247, 247, 247),
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 12.0, right: 12, top: 4),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                     width: double.maxFinite,
//                                     height: 200,
//                                     child: Image(
//                                       fit: BoxFit.cover,
//                                       image: FileImage(
//                                           File(data!.signalimage.toString())),
//                                     )),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   data.signaltitle,
//                                   style: const TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//           },
//         ),
//       ),
//     );
//   }
// }
