import '../models/todo_model.dart';

final local = Local.value;

class Local {
  static Local get value => Local._();
  Local._();

  List<Todo> todos = [];
}
