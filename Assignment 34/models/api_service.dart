import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey = "470f9a0cbd314160b836697135aa1f96";

  static Future<List> fetchRecipes() async {
    final response = await http.get(Uri.parse(
        "https://api.spoonacular.com/recipes/random?number=10&apiKey=$apiKey"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['recipes'];
    } else {
      throw Exception("Failed to load recipes");
    }
  }
}