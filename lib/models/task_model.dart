import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String name;
  final DateTime timestamp;
  final bool isCompleted;

  const Task({
    required this.name,
    required this.timestamp,
    this.isCompleted = false,
  });

  Task copyWith({
    String? name,
    DateTime? timestamp,
    bool? isCompleted,
  }) {
    return Task(
      name: name ?? this.name,
      timestamp: timestamp ?? this.timestamp,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      name: map['name'],
      timestamp: map['timestamp'] != null
          ? (map['timestamp'] as Timestamp).toDate()
          : DateTime.now(),
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'timestamp': Timestamp.fromDate(timestamp),
      'isCompleted': isCompleted,
    };
  }

  @override
  String toString() {
    return 'Task{name: $name, timestamp: $timestamp, isCompleted: $isCompleted}';
  }
}
