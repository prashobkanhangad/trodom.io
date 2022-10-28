import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tradom_io/db/model/tradeideamodel/tradeideadatamodel.dart';

ValueNotifier<List<tradeideamodel>> tradeidealistnotifier = ValueNotifier([]);

Future<void> addtradeidea(tradeideamodel value) async {
  final tradeideadb = await Hive.openBox<tradeideamodel>('tradeidea_db');
  tradeideadb.add(value);

  tradeidealistnotifier.value.add(value);
  tradeidealistnotifier.notifyListeners();
  gettradeidea();
}

Future<void> gettradeidea() async {
  final tradeideadb = await Hive.openBox<tradeideamodel>('tradeidea_db');
  tradeidealistnotifier.value.clear();
  tradeidealistnotifier.value.addAll(tradeideadb.values);
  tradeidealistnotifier.notifyListeners();
}

Future<void> deletetradeidea(int id) async {
  final tradeideadb = await Hive.openBox<tradeideamodel>('tradeidea_db');
  tradeideadb.deleteAt(id);
  gettradeidea();
}
