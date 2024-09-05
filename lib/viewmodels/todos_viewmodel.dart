import 'package:flutter/material.dart';
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
    todos = _homeProvider.todos;
  }

  set page(int i) => pageController.jumpToPage(i);

  removeTodo(Todo todo) {
    this
      ..todos.remove(todo)
      ..notifyListeners();
    _homeProvider
      ..todos.remove(todo)
      ..notify;
  }

  refreshTodo(Todo todo) => _homeProvider.resetTodo(todo);
}
