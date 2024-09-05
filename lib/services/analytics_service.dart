import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:todo_sprint/services/auth_service.dart';
import '../models/task_model.dart';
import '../models/todo_model.dart';

final AnalyticsService analyticsService = AnalyticsService.value;

class AnalyticsService {
  static AnalyticsService get value => AnalyticsService._();
  AnalyticsService._();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> init() => _analytics.logAppOpen();

  Future<void> setUser(String? userId) async =>
      await _analytics.setUserId(id: userId);

  Future<void> logAddTodo(Todo todo) async => await _analytics.logEvent(
        name: 'add_todo',
        parameters: {
          'user_id': _userId,
          'todo_id': todo.id,
          'title': todo.title,
        },
      );

  Future<void> logCompleteTodo(Todo todo) async => await _analytics.logEvent(
        name: 'complete_todo',
        parameters: {
          'user_id': _userId,
          'todo_id': todo.id,
          'title': todo.title,
        },
      );

  Future<void> logDeleteTodo(Todo todo) async => await _analytics.logEvent(
        name: 'delete_todo',
        parameters: {
          'user_id': _userId,
          'todo_id': todo.id,
          'title': todo.title,
        },
      );

  // Analytics functions for tasks
  Future<void> logAddTask(Todo todo, Task task) async =>
      await _analytics.logEvent(
        name: 'add_task',
        parameters: {
          'user_id': _userId,
          'task_id': task.id,
          'todo_id': todo.id,
          'title': task.name,
        },
      );

  Future<void> logCompleteTask(Todo todo, Task task) async =>
      await _analytics.logEvent(
        name: 'complete_task',
        parameters: {
          'user_id': _userId,
          'task_id': task.id,
          'todo_id': todo.id,
          'title': task.name,
        },
      );

  Future<void> logDeleteTask(Todo todo, Task task) async =>
      await _analytics.logEvent(
        name: 'delete_task',
        parameters: {
          'user_id': _userId,
          'task_id': task.id,
          'todo_id': todo.id,
          'title': task.name,
        },
      );

  String get _userId => authService.user?.uid ?? 'anonymous';
}
