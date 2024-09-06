import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../models/todo_model.dart';
import '../services/analytics_service.dart';
import '../services/firestore_service.dart';
import '../services/notification_service.dart';
import '../shared/functions.dart';

class TodoViewModel extends ChangeNotifier {
  final BuildContext context;

  /// Key for managing the state of the animated list.
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  late Todo todo;

  /// Callback functions for update/remove/add a task.
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

  /// Adds a new task to the todo.
  ///
  /// This method updates the todo with the new task, saves the updated todo,
  /// inserts the new task into the list with an animation, and logs the event
  /// with the analytics service.
  Future<void> addTask(Task task) async {
    final tasks = todo.tasks;
    tasks.add(task);
    await editTodo(todo.copyWith(tasks: tasks));
    listKey.currentState?.insertItem(tasks.length - 1);
    analyticsService.logAddTask(todo, task);
  }

  /// Updates an existing task in the todo.
  ///
  /// This method updates the task at the specified index, saves the updated todo,
  /// and logs the completion event if the task is marked as completed.
  Future<void> updateTask(Task task, int at) async {
    final tasks = todo.tasks;
    tasks[at] = task;
    await editTodo(todo.copyWith(tasks: tasks));
    if (task.isCompleted) analyticsService.logCompleteTask(todo, task);
  }

  /// Removes a task from the todo.
  ///
  /// This method removes the task at the specified index, saves the updated todo,
  /// removes the task from the list with an animation, remove reminders if the
  /// task has a timestamp, and logs the deletion event.
  Future<void> removeTask(Task task, int at) async {
    final tasks = todo.tasks;
    tasks.removeAt(at);
    await editTodo(todo.copyWith(tasks: tasks));
    listKey.currentState?.removeItem(at, (_, __) => const SizedBox.shrink());
    if (task.timestamp != null) {
      await notificationService.cancelNotification([task.id]);
    }
    analyticsService.logDeleteTask(todo, task);
  }

  /// Edits the specified todo item.
  ///
  /// This method updates the todo with the current timestamp, saves the updated
  /// todo to Firestore.
  /// If the todo tasks are completed, it logs the completion event.
  editTodo(Todo item) async {
    todo = item.copyWith(timestamp: DateTime.now());
    firestoreService.todosCollection.update(
      id: todo.id,
      data: todo.toMap(),
      callback: () {
        notifyListeners();
        onUpdate.call(todo);
        if (todo.progress == 1) {
          analyticsService.logCompleteTodo(todo);
        }
      },
    );
  }

  /// Deletes the current todo item.
  ///
  /// This method deletes the todo from Firestore,
  /// logs the deletion event, and cancels notifications for all tasks within the
  /// todo that have a timestamp.
  Future<void> deleteTodo() async {
    firestoreService.todosCollection.delete(
      id: todo.id,
      callback: () {
        onRemove.call(todo);
        analyticsService.logDeleteTodo(todo);
      },
    );
    await notificationService.cancelNotification(
      todo.tasks
          .where((task) => task.timestamp != null)
          .map((task) => task.id)
          .toList(),
    );
  }
}
