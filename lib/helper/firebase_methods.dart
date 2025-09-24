import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseMethods {
  static createAccount({
    required String emailAddress,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> loginWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
  }
}
