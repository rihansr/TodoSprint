class Todo {
  final String id;
  final String title;
  final String? description;
  final DateTime timestamp;

  const Todo({
    required this.id,
    required this.title,
    this.description,
    required this.timestamp,
  });

  Todo copyWith({
    String? title,
    String? description,
    DateTime? timestamp,
  }) {
    return Todo(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
