import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/api_service.dart';

class TaskProvider extends ChangeNotifier {
  final ApiService api = ApiService();
  List<Task> tasks = [];
  bool loading = false;

  // Constructor
  TaskProvider() {
    loadTasks();
  }

  // Load tasks from API
  Future<void> loadTasks() async {
    loading = true;
    notifyListeners();
    try {
      tasks = await api.fetchTasks();
    } catch (e) {
      // handle error if needed
    }
    loading = false;
    notifyListeners();
  }

  // Add new task
  Future<void> addTask(String title, String desc) async {
    final t = await api.createTask(title, desc);
    tasks.insert(0, t);
    notifyListeners();
  }

  // Toggle completed status
  Future<void> toggleComplete(Task t) async {
    t.completed = !t.completed;
    notifyListeners();
    await api.updateTask(t);
  }

  // Edit a task
  Future<void> editTask(Task t, String title, String desc) async {
    t.title = title;
    t.description = desc;
    notifyListeners();
    await api.updateTask(t);
  }

  // Remove a task
  Future<void> removeTask(Task t) async {
    tasks.remove(t);
    notifyListeners();
    await api.deleteTask(t.id);
  }
}
