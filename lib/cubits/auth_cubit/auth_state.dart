part of 'auth_cubit.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthAuthenticated extends AuthState {
  final User user;

  const AuthAuthenticated({required this.user});
}

final class AuthUnAuthenticated extends AuthState {
  final String? msg;

  const AuthUnAuthenticated({this.msg});
}
