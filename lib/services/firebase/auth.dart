import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;
  bool get isUserConnected {
    if (user == null) {
      return false;
    }
    return true;
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential> signInAnon() async {
    return await _auth.signInAnonymously();
  }

  Future<void> emailPasswordRegister(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password is too weak');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('This account already exists');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> emailPasswordLogin(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> signOut() async => await _auth.signOut();
}
