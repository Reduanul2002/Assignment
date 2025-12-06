import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';


class ApiService {
  static const String baseUrl = 'http://35.73.30.144:2008/api/v1'; // replace


  Future<List<Task>> fetchTasks() async {
    final res = await http.get(Uri.parse("$baseUrl/tasks"));
    final List data = jsonDecode(res.body);
    return data.map((e) => Task.fromJson(e)).toList();
  }


  Future<Task> createTask(String title, String description) async {
    final res = await http.post(
      Uri.parse("$baseUrl/tasks"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': title, 'description': description}),
    );
    return Task.fromJson(jsonDecode(res.body));
  }


  Future<Task> updateTask(Task t) async {
    final res = await http.put(
      Uri.parse("$baseUrl/tasks/${t.id}"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(t.toJson()),
    );
    return Task.fromJson(jsonDecode(res.body));
  }


  Future<void> deleteTask(int id) async {
    await http.delete(Uri.parse("$baseUrl/tasks/$id"));
  }
}