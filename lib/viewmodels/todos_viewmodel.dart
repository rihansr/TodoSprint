import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../models/todo_model.dart';
import 'home_viewmodel.dart';

class TodosViewModel extends ChangeNotifier {
  final BuildContext context;
  final HomeViewModel _homeProvider;
  void Function(Task task)? addTaskListener;
  late PageController pageController;
  List<Todo> todos = const [];
  late Todo todo;

  ValueNotifier<int> index;

  TodosViewModel(
    this.context, {
    required this.todo,
    required int index,
  })  : pageController = PageController(initialPage: index),
        _homeProvider = Provider.of<HomeViewModel>(context, listen: false),
        index = ValueNotifier<int>(index) {
    todos = List.from(_homeProvider.todos);
  }

  /// Sets the current page of the PageController.
  set page(int i) => pageController.jumpToPage(i);

  /// Removes a todo item from the list.
  ///
  /// If the list becomes empty after removal, it navigates back to landing page.
  /// Otherwise, it notifies listeners about the change.
  /// Also removes the todo from the HomeViewModel and notifies it.
  removeTodo(Todo todo) {
    todos.remove(todo);
    todos.isEmpty ? context.pop() : notifyListeners();
    _homeProvider
      ..todos.remove(todo)
      ..notify;
  }

  /// Refreshes a todo item in the list.
  ///
  /// Finds the index of the todo item in the list and updates it.
  /// Notifies listeners about the change and resets the todo in the HomeViewModel.
  refreshTodo(Todo todo) {
    final index = todos.indexWhere((item) => item == todo);
    todos[index] = todo;
    notifyListeners();
    _homeProvider.resetTodo(todo);
  }
}
