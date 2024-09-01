import 'package:cloud_firestore/cloud_firestore.dart';
import 'task_model.dart';
import 'theme_model.dart';

class Todo {
  final String id;
  final TodoTheme? theme;
  final String title;
  final String? description;
  final List<Task> tasks;
  final DateTime timestamp;

  const Todo({
    required this.id,
    this.theme,
    required this.title,
    this.description,
    this.tasks = const [],
    required this.timestamp,
  });

  Todo copyWith({
    String? title,
    TodoTheme? theme,
    String? description,
    List<Task>? tasks,
    DateTime? timestamp,
  }) {
    return Todo(
      id: id,
      theme: theme ?? this.theme,
      title: title ?? this.title,
      description: description ?? this.description,
      tasks: tasks ?? this.tasks,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      theme: map['theme'] != null ? TodoTheme.fromMap(map['theme']) : null,
      title: map['title'],
      description: map['description'],
      tasks: map['tasks'] != null
          ? List<Task>.from(map['tasks'].map((x) => Task.fromMap(x)))
          : [],
      timestamp: map['timestamp'] != null
          ? (map['timestamp'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'theme': theme?.toMap(),
      'title': title,
      'description': description,
      'tasks': tasks.map((x) => x.toMap()).toList(),
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, description: $description, tasks: $tasks, timestamp: $timestamp}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
