import 'package:firebase_auth/firebase_auth.dart';
import 'analytics_service.dart';

final authService = AuthService.value;

class AuthService {
  static AuthService get value => AuthService._();
  AuthService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  Future<void> init() async {
    final user = this.user ??
        await (() async {
          final credentials = await _auth.signInAnonymously();
          return credentials.user;
        }());
    analyticsService.setUser(user?.uid);
  }
}
