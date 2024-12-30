import 'dart:convert';

import 'package:http/http.dart' as http;

class Apiservices {
  static Future fetch_data() async {
    final baseUrl = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    try {
      final response = await http.get(baseUrl);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('${response.statusCode}, Failed To fetchData');
      }
    } catch (err) {
      throw Exception('Error : $err');
    }
  }
}
