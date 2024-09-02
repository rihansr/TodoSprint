import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo_model.dart';
import 'home_viewmodel.dart';

class TodosViewModel extends ChangeNotifier {
  late PageController pageController;
  late List<Todo> todos;
  late Todo todo;
  
  ValueNotifier<int> index;

  TodosViewModel(
    BuildContext context, {
    required this.todo,
    required int index,
  })  : pageController = PageController(initialPage: index),
        todos = Provider.of<HomeViewModel>(context, listen: false).todos,
        index = ValueNotifier<int>(index);
}
