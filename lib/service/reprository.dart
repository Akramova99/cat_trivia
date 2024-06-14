
import 'package:cat_trivia/model/cat_facts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CatFactRepository {
  final String apiUrl = "https://cat-fact.herokuapp.com/facts";

  Future<List<Cat>> fetchCatFacts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((fact) => Cat.fromJson(fact)).toList();
    } else {
      throw Exception("Failed to load cat facts");
    }
  }
}