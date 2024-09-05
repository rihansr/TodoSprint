import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../models/todo_model.dart';
import '../routing/routes.dart';
import '../services/firestore_service.dart';
import '../services/navigation_service.dart';

class HomeViewModel extends ChangeNotifier {
  final BuildContext context;
  final ScrollController scrollController;
  List<Todo> todos = [];

  HomeViewModel(this.context)
      : scrollController = ScrollController(),
        todos = [];

  Future<void> fetchTodos() async {
    await firestoreService.todosReference.get().then(
          (snapshot) => this
            ..todos =
                snapshot.docs.map((doc) => Todo.fromMap(doc.data())).toList()
            ..notifyListeners(),
        );
  }

  get notify => notifyListeners();

  Future<void> addTodo(Todo todo) async {
    final reference = firestoreService.todosReference;
    todo = todo.copyWith(id: reference.doc().id);
    await firestoreService.call(
      reference.doc(todo.id).set(todo.toMap()),
      () => this
        ..todos.insert(0, todo)
        ..notifyListeners()
        ..scrollToStart,
    );
  }

  get scrollToStart => scrollController.animateTo(
        0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeIn,
      );

  navigateTo(Todo todo, int i) => navigator.context.pushNamed(
        Routes.todo,
        extra: {'todo': todo, 'index': i},
      );

  resetTodo(Todo todo) {
    final index = todos.indexWhere((item) => item == todo);
    todos[index] = todo;
    todos.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    notifyListeners();
    scrollToStart;
  }
}
