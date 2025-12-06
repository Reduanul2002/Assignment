import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../models/task_model.dart';

void showCreateDialog(BuildContext context) {
  final titleC = TextEditingController();
  final descC = TextEditingController();

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Create Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: titleC, decoration: const InputDecoration(labelText: 'Title')),
          TextField(controller: descC, decoration: const InputDecoration(labelText: 'Description')),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            Provider.of<TaskProvider>(context, listen: false)
                .addTask(titleC.text, descC.text);
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    ),
  );
}

void showEditDialog(BuildContext context, Task t) {
  final titleC = TextEditingController(text: t.title);
  final descC = TextEditingController(text: t.description);

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Edit Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: titleC, decoration: const InputDecoration(labelText: 'Title')),
          TextField(controller: descC, decoration: const InputDecoration(labelText: 'Description')),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            Provider.of<TaskProvider>(context, listen: false)
                .editTask(t, titleC.text, descC.text);
            Navigator.pop(context);
          },
          child: const Text('Update'),
        ),
      ],
    ),
  );
}
