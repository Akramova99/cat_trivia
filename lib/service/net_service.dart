import 'dart:convert';

import 'package:cat_trivia/model/cat_facts.dart';
import 'package:http/http.dart';

class NetworkService {
  static String BASE = 'cat-fact.herokuapp.com';

  static String GET_FACT = '/facts';

  static Future<String?> GET_LESSON_METHOD(Map<String, String> params) async {
    Uri uri = Uri.https(BASE, GET_FACT, params);
    var response = await get(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static List<Cat> parsingResponse(String response) {
    final json = jsonDecode(response);
    final data = List<Cat>.from(json.map((mp)=>Cat.fromJson(mp)));

    return data;

    /// returned  object is News
  }
}
