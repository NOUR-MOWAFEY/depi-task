import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:depi_task/models/personal_data_model.dart';
import 'package:depi_task/services/firestore_service/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../helper/animation.dart';
import '../../helper/show_snack_bar.dart';
import '../../screens/auth_gate.dart';
import '../../screens/login_screen.dart';
import '../../services/firebase_service/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fistNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late PersonalDataModel personalDataModel;

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

  Future<void> signinWithEmailAndPassword() async {
    emit(AuthLoading());
    try {
      await _repo.signinWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      emit(AuthUnAuthenticated(msg: e.message));
    } catch (_) {
      emit(AuthUnAuthenticated(msg: 'Something went wrong'));
    }
    await getpersonalData();
  }

  Future<void> registerWithEmailAndPassword(
    String email,
    String password, [
    BuildContext? context,
  ]) async {
    emit(AuthLoading());
    try {
      await _repo.registerWithEmailAndPassword(email, password, context);
      FireStoreService().setDoc(
        email: email,
        password: password,
        firstName: fistNameController.text,
        lastName: lastNameController.text,
      );
      clearFields();
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

  getpersonalData() async {
    PersonalDataModel personalDataModel = await FireStoreService()
        .getPersonalData(email: _repo.currentUser!.email!);
    this.personalDataModel = personalDataModel;

    emailController.text = personalDataModel.email!;
    passwordController.text = personalDataModel.password!;
    fistNameController.text = personalDataModel.name!.firstName!;
    lastNameController.text = personalDataModel.name!.lastName!;
  }

  updateUserData(BuildContext context) async {
    try {
      await FireStoreService().updateData(
        email: _repo.currentUser!.email!,
        password: passwordController.text,
        firstName: fistNameController.text,
        lastName: lastNameController.text,
      );
      if (context.mounted) {
        showSuccessSnackBar(
          context: context,
          message: 'data updated successfully',
        );
      }
    } catch (e) {
      if (context.mounted) {
        showFailedSnackBar(context: context, message: e.toString());
      }
    }
  }

  deleteUser(BuildContext context) async {
    try {
      await _repo.deleteUser();
      await FireStoreService().deleteData(email: emailController.text);
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (contex) => LoginScreen()),
          (route) => false,
        );
      }
      clearFields();
    } catch (e) {
      if (context.mounted) {
        showFailedSnackBar(context: context, message: e.toString());
      }
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    await _repo.signOut();
    clearFields();
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

  destroyControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  void clearFields() {
    emailController.clear();
    passwordController.clear();
    fistNameController.clear();
    lastNameController.clear();
  }

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
