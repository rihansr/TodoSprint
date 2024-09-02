import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/todo_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<Todo> todos = [];

  HomeViewModel() : todos = [];

  Future<void> addTodo() async {
    final documentReference = FirebaseFirestore.instance
        .collection('todos')
        .doc('mF8aUoNUanD5daHjE5KP')
        .collection('todo');

    final docId = documentReference.id;
    debugPrint('Document ID: $docId');

    return;
  }

  Future<void> fetchTodos() async {
    await FirebaseFirestore.instance
        .collection('todos')
        .doc('mF8aUoNUanD5daHjE5KP')
        .collection('todo')
        .get()
        .then(
          (snapshot) => this
            ..todos =
                snapshot.docs.map((doc) => Todo.fromMap(doc.data())).toList()
            ..notifyListeners(),
        );
  }
}
