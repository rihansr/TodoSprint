import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../models/todo_model.dart';
import '../routing/routes.dart';
import '../services/analytics_service.dart';
import '../services/firestore_service.dart';
import '../services/navigation_service.dart';

class HomeViewModel extends ChangeNotifier {
  final BuildContext context;
  final ScrollController scrollController;
  List<Todo> todos = [];

  HomeViewModel(this.context)
      : scrollController = ScrollController(),
        todos = [];

  /// Fetches the list of todos from Firestore.
  ///
  /// This method retrieves the todos from the Firestore collection,
  /// ordered by the 'timestamp' field in descending order.
  /// Then converts the documents to Todo objects, assigns them to the
  /// todos list.
  Future<void> fetchTodos() async {
    await firestoreService.todosCollection
        .orderBy('timestamp', descending: true)
        .get()
        .then(
          (snapshot) => this
            ..todos = snapshot.docs
                .map(
                  (doc) => Todo.fromMap(doc.data()),
                )
                .toList()
            ..notifyListeners(),
        );
  }

  get notify => notifyListeners();

  /// Adds a new todo to the Firestore collection.
  ///
  /// This method generates a new ID for the todo, saves it to the
  /// Firestore collection, inserts the new todo at the start of the
  /// todos list.
  Future<void> addTodo(Todo todo) async {
    final reference = firestoreService.todosCollection;
    todo = todo.copyWith(id: reference.doc().id);
    await firestoreService.todosCollection.set(
      id: todo.id,
      data: todo.toMap(),
      callback: () {
        this
          ..todos.insert(0, todo)
          ..notifyListeners()
          ..scrollToStart;
        analyticsService.logAddTodo(todo);
      },
    );
  }

  /// After adding the todo, it animates the scroll position to the start.
  get scrollToStart => scrollController.animateTo(
        0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeIn,
      );

  /// Navigates to the Todos screen.
  navigateTo(Todo todo, int i) => navigator.context.pushNamed(
        Routes.todo,
        extra: {'todo': todo, 'index': i},
      );

  /// Sorts the todos list by timestamp in descending order after updating
  /// a todo item.
  resetTodo(Todo todo) {
    final index = todos.indexWhere((item) => item == todo);
    todos[index] = todo;
    todos.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    notifyListeners();
    scrollToStart;
  }
}
