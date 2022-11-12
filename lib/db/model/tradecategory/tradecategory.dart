import 'package:hive_flutter/adapters.dart';
part 'tradecategory.g.dart';

@HiveType(typeId: 6)
enum CategoryType {
  @HiveField(0)
  intraday,

  @HiveField(1)
  positional,
}

@HiveType(typeId: 5)
class CategoryModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String stockname;

  @HiveField(2)
  final String stoploss;

  @HiveField(3)
  final String entryprice;

  @HiveField(4)
  final String targetprice;

  @HiveField(5)
  final bool isDeleted;

  @HiveField(6)
  final CategoryType type;

  CategoryModel(
      {required this.type,
      required this.id,
      required this.entryprice,
      required this.stockname,
      required this.stoploss,
      required this.targetprice,
      this.isDeleted = false});
}
