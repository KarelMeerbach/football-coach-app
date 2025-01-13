import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@riverpod
FirebaseAuth firebaseAuth(ref) => FirebaseAuth.instance;

@riverpod
Stream<User?> authState(ref) {
  final auth =
  ref.watch(firebaseAuthProvider);
  return auth.authStateChanges();
}

@riverpod
AuthService authService(ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return AuthService(auth);
}

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> register(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}