import 'package:hive_flutter/hive_flutter.dart';
part 'signaldatamodel.g.dart';

@HiveType(typeId: 2)
class signalmodel {
  @HiveField(0)
  final String signaltitle;

  @HiveField(1)
  final String signalimage;

  @HiveField(2)
  int id;

  signalmodel(
      {required this.signaltitle, required this.signalimage, required this.id});
}
