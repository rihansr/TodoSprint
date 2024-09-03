import 'package:cloud_firestore/cloud_firestore.dart';

final firestoreService = FirestoreService.value;

class FirestoreService {
  static FirestoreService get value => FirestoreService._();
  FirestoreService._();

  final todosReference = FirebaseFirestore.instance.collection('todos')
      .doc('mF8aUoNUanD5daHjE5KP')
      .collection('todo');
}
