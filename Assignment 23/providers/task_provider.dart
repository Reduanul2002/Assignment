import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/task_api_service.dart';

class TaskProvider extends ChangeNotifier {
  final TaskApiService _apiService = TaskApiService();

  List<Task> taskList = [];
  bool isLoading = false;
  String? error;

  Future<void> loadTasks() async {
    isLoading = true;
    notifyListeners();

    try {
      taskList = await _apiService.fetchTasks();
      error = null;
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> addTask(String title) async {
    await _apiService.addTask(title);
    await loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await _apiService.deleteTask(id);
    await loadTasks();
  }
}
