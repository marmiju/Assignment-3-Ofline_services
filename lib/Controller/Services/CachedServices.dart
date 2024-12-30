import 'package:hive_flutter/adapters.dart';

class Cachedservices {
  static final _box = Hive.box('cachedData'); // Acces the dataBox

  static Future saveData(List<dynamic> data) async {
    await _box.put('data', data); //Storage Data as Data in data key
  }

  static Future<List<dynamic>> getData() async {
    final data = _box.get('data');
    if (data == null) {
      return [];
    }
    return List<dynamic>.from(data);
  }
}
