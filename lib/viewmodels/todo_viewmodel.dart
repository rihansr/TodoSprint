import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../models/todo_model.dart';
import '../services/firestore_service.dart';
import '../services/notification_service.dart';
import '../shared/functions.dart';

class TodoViewModel extends ChangeNotifier {
  final BuildContext context;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  late Todo todo;
  final Function(Todo task) onUpdate;
  final Function(Todo task) onRemove;
  final TaskListener listener;

  TodoViewModel({
    required this.context,
    required this.todo,
    required this.onUpdate,
    required this.onRemove,
    required this.listener,
  }) {
    listener.call((task) async => await addTask(task));
  }

  Future<void> addTask(Task task) async {
    final tasks = todo.tasks;
    tasks.add(task);
    await editTodo(todo.copyWith(tasks: tasks));
    listKey.currentState?.insertItem(tasks.length - 1);
  }

  Future<void> updateTask(Task task, int at) async {
    final tasks = todo.tasks;
    tasks[at] = task;
    await editTodo(todo.copyWith(tasks: tasks));
  }

  Future<void> removeTask(Task task, int at) async {
    final tasks = todo.tasks;
    tasks.removeAt(at);
    await editTodo(todo.copyWith(tasks: tasks));
    listKey.currentState?.removeItem(at, (_, __) => const SizedBox.shrink());
    if (task.timestamp != null) {
      await notificationService.cancelNotification([task.id]);
    }
  }

  editTodo(Todo todo) async {
    this.todo = todo.copyWith(timestamp: DateTime.now());
    await firestoreService.call(
      firestoreService.todosReference.doc(this.todo.id).update(this.todo.toMap()),
      () {
        notifyListeners();
        onUpdate.call(this.todo);
      },
    );
  }

  Future<void> deleteTodo() async {
    await firestoreService.call(
      firestoreService.todosReference.doc(todo.id).delete(),
      () => onRemove.call(todo),
    );
    await notificationService.cancelNotification(
      todo.tasks
          .where((task) => task.timestamp != null)
          .map((task) => task.id)
          .toList(),
    );
  }
}
