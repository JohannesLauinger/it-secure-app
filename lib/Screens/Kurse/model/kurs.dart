import 'package:hive/hive.dart';

part 'kurs.g.dart';

@HiveType(typeId: 0)
class Kurs extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int time;

  @HiveField(2)
  late String category;

  @HiveField(3)
  late String imagePath;

  @HiveField(4)
  late String videoPath;
}
