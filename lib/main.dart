import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tradom_io/db/function/learn/learnfunctions.dart';
import 'package:tradom_io/db/function/market/marketfunctions.dart';
import 'package:tradom_io/db/function/signal/signalfunctions.dart';
import 'package:tradom_io/db/function/tradecategory/tradecategoryfunction.dart';
import 'package:tradom_io/db/function/tradeideas/tradeidea_functions.dart';
import 'package:tradom_io/db/model/learn/learndatamodel.dart';
import 'package:tradom_io/db/model/marketmodel/marketdatamodel.dart';
import 'package:tradom_io/db/model/signalmodel/signaldatamodel.dart';
import 'package:tradom_io/db/model/tradecategory/tradecategory.dart';
import 'package:tradom_io/db/model/tradeideamodel/tradeideadatamodel.dart';
import 'package:tradom_io/screens/userside/splashscreen/spashscreen.dart';
import 'package:flutter/services.dart';

// late Box<signalmodel> databasebox;
// late Box<learnmodel> learndatabasebox;
Future<void> main() async {
  // final obj1 = CategoryDB();
  // final obj2 = CategoryDB();
  // print('object');
  // print(obj1 == obj2);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();
  // FirebaseAnalytics.instance.logEvent()
  getlearn();
  getmarket();
  getsignal();
  gettradeidea();
  CategoryDB().refreshUI;

  // databasebox = await Hive.openBox<signalmodel>('singal_model');

  // learndatabasebox = await Hive.openBox<learnmodel>('learnmodel');
  Hive.registerAdapter(CategoryTypeAdapter());

  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(tradeideamodelAdapter());
  Hive.registerAdapter(signalmodelAdapter());
  Hive.registerAdapter(marketmodelAdapter());
  Hive.registerAdapter(learnmodelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
          backgroundColor: Colors.white,
          inputDecorationTheme:
              InputDecorationTheme(errorStyle: TextStyle(color: Colors.white))),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
