import 'package:hive/hive.dart';
import 'package:it_security_app/Screens/Kurse/model/kurs.dart';

class Boxes {
  static Box<Kurs> getKurse() => Hive.box<Kurs>('kurse');
}
