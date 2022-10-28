import 'package:hive_flutter/adapters.dart';
part 'tradeideadatamodel.g.dart';

@HiveType(typeId: 1)
class tradeideamodel {
  @HiveField(0)
  final String stockname;

  @HiveField(1)
  final String stoploss;

  @HiveField(2)
  final String entryprice;

  @HiveField(3)
  final String targetprice;

  @HiveField(4)
  final String id;

  tradeideamodel(
      {required this.stockname,
      required this.stoploss,
      required this.entryprice,
      required this.targetprice,
      required this.id});
}
