import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final int id;
  final String name;
  final DateTime? timestamp;
  final bool isCompleted;

  const Task({
    required this.id,
    required this.name,
    this.timestamp,
    this.isCompleted = false,
  });

  Task copyWith({
    String? name,
    DateTime? timestamp,
    bool? isCompleted,
  }) {
    return Task(
      id: id,
      name: name ?? this.name,
      timestamp: timestamp ?? this.timestamp,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      name: map['name'],
      timestamp: map['timestamp'] != null
          ? (map['timestamp'] as Timestamp).toDate()
          : null,
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'timestamp': timestamp == null ? null : Timestamp.fromDate(timestamp!),
      'isCompleted': isCompleted,
    };
  }

  @override
  String toString() {
    return 'Task(id: $id, name: $name, timestamp: $timestamp, isCompleted: $isCompleted)';
  }
}
