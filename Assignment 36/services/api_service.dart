import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://api.durjoyai.com";
  static const String apiKey = "YOUR_API_KEY";

  static Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/v1/chat/completions"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKey",
        },
        body: jsonEncode({
          "model": "durjoy-kotha-1",
          "messages": [
            {"role": "user", "content": message}
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        return " API Error";
      }
    } catch (e) {
      return " Network Error";
    }
  }
}