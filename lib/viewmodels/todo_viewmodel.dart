import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../models/todo_model.dart';
import '../services/firestore_service.dart';
import '../services/notification_service.dart';
import '../shared/functions.dart';

class TodoViewModel extends ChangeNotifier {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  late Todo todo;
  final Function(Todo task) onUpdate;
  final TaskListener listener;

  TodoViewModel({
    required this.todo,
    required this.onUpdate,
    required this.listener,
  }) {
    listener.call((task) async => await addTask(task));
  }

  Future<void> addTask(Task task) async {
    final tasks = todo.tasks;
    tasks.add(task);
    await _save(tasks);
    listKey.currentState?.insertItem(tasks.length - 1);
  }

  Future<void> updateTask(Task task, int at) async {
    final tasks = todo.tasks;
    tasks[at] = task;
    await _save(tasks);
  }

  Future<void> removeTask(Task task, int at) async {
    final tasks = todo.tasks;
    tasks.removeAt(at);
    await _save(tasks);
    listKey.currentState?.removeItem(at, (_, __) => const SizedBox.shrink());
    if (task.timestamp != null) {
      await notificationService.cancelNotification([task.id]);
    }
  }

  _save(List<Task> tasks) async {
    todo = todo.copyWith(tasks: tasks, timestamp: DateTime.now());
    await firestoreService.todosReference.doc(todo.id).update(todo.toMap());
    notifyListeners();
    onUpdate.call(todo);
  }
}
