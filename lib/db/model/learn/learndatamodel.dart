import 'package:hive_flutter/adapters.dart';
part 'learndatamodel.g.dart';

@HiveType(typeId: 4)
class learnmodel {
  @HiveField(0)
  final String learntitle;

  @HiveField(1)
  final String learncontent;

  @HiveField(2)
  final String learnimage;

  learnmodel(
      {required this.learntitle,
      required this.learncontent,
      required this.learnimage});
}
