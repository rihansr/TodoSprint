class Task {
  final String id;
  final String name;
  final bool isCompleted;

  const Task({
    required this.id,
    required this.name,
    this.isCompleted = false,
  });

  Task copyWith({
    String? name,
    bool? isCompleted,
  }) {
    return Task(
      id: id,
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
