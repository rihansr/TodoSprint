import 'package:flutter/foundation.dart';
import '../models/todo_model.dart';

class TodoViewModel extends ChangeNotifier {
  final Todo todo;
  TodoViewModel({
    required this.todo,
  });
}
