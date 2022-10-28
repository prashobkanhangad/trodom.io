import 'package:hive_flutter/adapters.dart';
 part 'marketdatamodel.g.dart';

@HiveType(typeId: 3)
class marketmodel {
  @HiveField(0)
  final String markettitle;

  @HiveField(1)
  final String marketnews;

  @HiveField(2)
  final String marketimage;

  @HiveField(3)
  final String marketdate;

  marketmodel(
      {required this.markettitle,
      required this.marketnews,
      required this.marketimage,
      required this.marketdate});
}
