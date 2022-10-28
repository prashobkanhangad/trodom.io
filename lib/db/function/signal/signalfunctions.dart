import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tradom_io/db/model/signalmodel/signaldatamodel.dart';

ValueNotifier<List<signalmodel>> signalsnotifier = ValueNotifier([]);

Future<void> addsignal(signalmodel value) async {
  final signaldb = await Hive.openBox<signalmodel>('signal_db');
  signaldb.add(value);
  signalsnotifier.value.clear();
  signalsnotifier.notifyListeners();
  getsignal();
}

Future<void> getsignal() async {
  final signaldb = await Hive.openBox<signalmodel>('signal_db');
  signalsnotifier.value.clear();
  signalsnotifier.value.addAll(signaldb.values);
  signalsnotifier.notifyListeners();
}

Future<void> deletesignal(int id) async {
  final signaldb = await Hive.openBox<signalmodel>('signal_db');
  signaldb.deleteAt(id);
  getsignal();
}

Future<void> editsignal(id, value) async {
  final signaldb = await Hive.openBox<signalmodel>('signal_db');
  signaldb.putAt(id, value);
  getsignal();
}
