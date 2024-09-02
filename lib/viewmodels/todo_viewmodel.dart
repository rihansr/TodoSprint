import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../models/todo_model.dart';

class TodoViewModel extends ChangeNotifier {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final Todo todo;

  TodoViewModel(this.todo);

  Future<void> addTask(Task task) async {
    final tasks = todo.tasks;
    tasks.add(task);
    todo.copyWith(tasks: tasks);
    notifyListeners();
    listKey.currentState?.insertItem(tasks.length - 1);
  }

  Future<void> updateTask(Task task, int at) async {
    final tasks = todo.tasks;
    tasks[at] = task;
    todo.copyWith(tasks: tasks);
    notifyListeners();
  }

  Future<void> removeTask(int at) async {
    final tasks = todo.tasks;
    tasks.removeAt(at);
    todo.copyWith(tasks: tasks);
    notifyListeners();
    listKey.currentState?.removeItem(at, (_, __) => const SizedBox.shrink());
  }
}
