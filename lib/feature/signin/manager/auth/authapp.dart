// ignore_for_file: prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _authService = FirebaseAuth.instance;
  Future<User?> signin(String email, String password) async {
    try {
      UserCredential credential = await _authService.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print('error ${e.toString()}');
    }
    return null;
  }

  Future<User?> signup(String email, String password, String name, String phone,
      String lastname) async {
    try {
      UserCredential credential =
          await _authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      print('error ${e.toString()}');
    }
    return null;
  }
}
