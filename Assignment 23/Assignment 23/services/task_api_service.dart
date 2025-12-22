import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';

class TaskApiService {
  static const String baseUrl = "http://35.73.30.144:2005/api/v1/";

  Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Task.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load tasks");
    }
  }

  Future<void> addTask(String title) async {
    await http.post(
      Uri.parse(baseUrl),
      body: jsonEncode({"title": title, "completed": false}),
      headers: {"Content-Type": "application/json"},
    );
  }

  Future<void> deleteTask(int id) async {
    await http.delete(Uri.parse("$baseUrl/$id"));
  }
}
