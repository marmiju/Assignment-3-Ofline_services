import 'package:hive_flutter/adapters.dart';

class Chachedservices {
  static final _box = Hive.box('chachedData'); // Acces the dataBox

  static Future saveData(List<dynamic> data) async {
    await _box.put('data', data); //Storage Data as Data in data key
  }

  static List<dynamic> getData() {
    return _box.get('data'); //retrive Data From Data Hive Box
  }
}
