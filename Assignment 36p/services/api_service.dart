import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static const String apiKey = "YOUR_NEW_API_KEY";

  // CHAT API
  static Future<String> sendMessage(String message) async {

    try {

      final response = await http.post(
        Uri.parse(
          "https://api.openai.com/v1/chat/completions",
        ),

        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKey",
        },

        body: jsonEncode({
          "model": "gpt-4.1-mini",

          "messages": [
            {
              "role": "user",
              "content": message,
            }
          ]
        }),
      );

      if (response.statusCode == 200) {

        final data = jsonDecode(response.body);

        return data["choices"][0]["message"]["content"];
      } else {
        return "Failed to get response";
      }
    } catch (e) {
      return e.toString();
    }
  }

  // IMAGE GENERATOR API
  static Future<String> generateImage(
      String prompt) async {

    try {

      final response = await http.post(
        Uri.parse(
          "https://api.openai.com/v1/images/generations",
        ),

        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKey",
        },

        body: jsonEncode({
          "model": "gpt-image-1",
          "prompt": prompt,
          "size": "1024x1024"
        }),
      );

      if (response.statusCode == 200) {

        final data = jsonDecode(response.body);

        return data["data"][0]["url"];
      } else {
        return "";
      }
    } catch (e) {
      return "";
    }
  }
}