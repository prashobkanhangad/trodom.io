import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tradom_io/db/model/learn/learndatamodel.dart';

ValueNotifier<List<learnmodel>> learnnotifier = ValueNotifier([]);

Future<void> addlearn(learnmodel value) async {
  final learndb = await Hive.openBox<learnmodel>('learn_db');
  learndb.add(value);
  learnnotifier.value.clear();
  learnnotifier.notifyListeners();
  getlearn();
}

Future<void> getlearn() async {
  final learndb = await Hive.openBox<learnmodel>('learn_db');
  learnnotifier.value.clear();
  learnnotifier.value.addAll(learndb.values);
  learnnotifier.notifyListeners();
}

Future<void> deletelearnl(int id) async {
  final learndb = await Hive.openBox<learnmodel>('learn_db');
  learndb.deleteAt(id);
  getlearn();
}
