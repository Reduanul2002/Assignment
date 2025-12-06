class Task {
  final int id;
  String title;
  String description;
  bool completed;


  Task({required this.id, required this.title, required this.description, required this.completed});


  factory Task.fromJson(Map<String, dynamic> j) => Task(
    id: j['id'],
    title: j['title'],
    description: j['description'],
    completed: j['completed'],
  );


  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'completed': completed,
  };
}