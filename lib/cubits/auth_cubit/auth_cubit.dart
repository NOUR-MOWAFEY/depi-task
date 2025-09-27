import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../screens/auth_gate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../helper/animation.dart';
import '../../helper/show_snack_bar.dart';
import '../../screens/login_screen.dart';
import '../../screens/register_screen.dart';
import '../../services/firebase_service/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _repo;
  late final StreamSubscription<User?> _sub;
  AuthCubit(this._repo) : super(AuthInitial()) {
    _sub = _repo.authStateChange().listen((user) {
      if (user == null) {
        emit(AuthUnAuthenticated());
      } else {
        emit(AuthAuthenticated(user: user));
      }
    });
  }

  Future<void> signinWithEmailAndPassword(String email, String password) async {
    emit(AuthLoading());
    try {
      await _repo.signinWithEmailAndPassword(email, password);
    } on FirebaseAuthException catch (e) {
      emit(AuthUnAuthenticated(msg: e.message));
    } catch (_) {
      emit(AuthUnAuthenticated(msg: 'Something went wrong'));
    }
  }

  Future<void> registerWithEmailAndPassword(
    String email,
    String password, [
    BuildContext? context,
  ]) async {
    emit(AuthLoading());
    try {
      await _repo.registerWithEmailAndPassword(email, password, context);
      if (context != null && context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          CustomAnimation.createRouteForSlideFromLeft(LoginScreen()),
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(AuthUnAuthenticated(msg: 'This email is already registered.'));
        RegisterScreen.message = 'This email is already registered.';
      } else {
        emit(AuthUnAuthenticated(msg: e.message));
      }
    } catch (_) {
      emit(AuthUnAuthenticated(msg: 'Something went wrong'));
    }
  }

  // Future<void> resetPassword(String email, [BuildContext? context]) async {
  //   emit(AuthLoading());
  //   try {
  //     await _repo.resetPassword(email);
  //   } on FirebaseAuthException catch (e) {
  //     emit(AuthUnAuthenticated(msg: e.message.toString()));
  //   } catch (_) {
  //     emit(AuthUnAuthenticated(msg: 'something went wrong'));
  //   }
  // }

  Future<void> signOut() async {
    emit(AuthLoading());
    await _repo.signOut();
  }

  showSuccessSnackBar({
    required BuildContext context,
    required String message,
  }) {
    showSnackBar(context: context, color: Colors.green, exception: message);
  }

  showFailedSnackBar({required BuildContext context, required String message}) {
    showSnackBar(context: context, color: Colors.red, exception: message);
  }

  void onRegisterCompleted(AuthState state, BuildContext context) {
    if (state is AuthUnAuthenticated && state.msg != null) {
      showFailedSnackBar(context: context, message: state.msg ?? 'Error');
    } else if (state is AuthAuthenticated) {
      signOut();
      showSuccessSnackBar(
        context: context,
        message: 'registeration done successfully',
      );
      Navigator.pushAndRemoveUntil(
        context,
        CustomAnimation.createRouteForSlideFromLeft(AuthGate()),
        (route) => false,
      );
    }
  }

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
