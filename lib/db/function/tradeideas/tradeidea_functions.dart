import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tradom_io/db/model/tradeideamodel/tradeideadatamodel.dart';

ValueNotifier<List<tradeideamodel>> tradeidealistnotifier = ValueNotifier([]);

Future<void> addtradeidea(tradeideamodel value) async {
  final tradeideadb = await Hive.openBox<tradeideamodel>('tradeidea_db_1');
  tradeideadb.add(value);

  tradeidealistnotifier.value.add(value);
  tradeidealistnotifier.notifyListeners();
  gettradeidea();
}

Future<void> addpredifinedtradeidea(tradeideamodel value, index) async {
  final tradeideadb = await Hive.openBox<tradeideamodel>('tradeidea_db_1');
  tradeideadb.put(index, value);

  // tradeidealistnotifier.value.add(value);
  // tradeidealistnotifier.notifyListeners();
  gettradeidea();
}

Future<void> gettradeidea() async {
  final tradeideadb = await Hive.openBox<tradeideamodel>('tradeidea_db_1');
  tradeidealistnotifier.value.clear();
  tradeidealistnotifier.value.addAll(tradeideadb.values);
  tradeidealistnotifier.notifyListeners();
}

Future<void> deletetradeidea(int id) async {
  final tradeideadb = await Hive.openBox<tradeideamodel>('tradeidea_db_1');
  tradeideadb.deleteAt(id);
  gettradeidea();
}
