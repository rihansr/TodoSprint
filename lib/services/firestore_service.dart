import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared/debug.dart';

final firestoreService = FirestoreService.value;

class FirestoreService {
  static FirestoreService get value => FirestoreService._();
  FirestoreService._();

  final todosReference = FirebaseFirestore.instance
      .collection('todos')
      .doc('mF8aUoNUanD5daHjE5KP')
      .collection('todo');

  call(Future action, Function() callback) async {
    try {
      await action;
    } catch (error) {
      debug.print(error);
    } finally {
      callback.call();
    }
  }
}
