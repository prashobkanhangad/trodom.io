import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tradom_io/db/model/marketmodel/marketdatamodel.dart';

ValueNotifier<List<marketmodel>> marketnotifier = ValueNotifier([]);

Future<void> addmarket(marketmodel value) async {
  final marketdb = await Hive.openBox<marketmodel>('market_db');
  marketdb.add(value);

  marketnotifier.value.add(value);
  marketnotifier.notifyListeners();
  getmarket();
}

Future<void> getmarket() async {
  final marketdb = await Hive.openBox<marketmodel>('market_db');
  marketnotifier.value.clear();
  marketnotifier.value.addAll(marketdb.values);
  marketnotifier.notifyListeners();
}

Future<void> deletemarket(int id) async {
  final marketdb = await Hive.openBox<marketmodel>('market_db');
  marketdb.deleteAt(id);
  getmarket();
}
