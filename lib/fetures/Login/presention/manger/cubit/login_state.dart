part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class Loginloading extends LoginState {}

final class Loginscess extends LoginState {
  final LoginRespone loginRespone;

  Loginscess({required this.loginRespone});
}

final class Loginfauiler extends LoginState {
  final String errmas;

  Loginfauiler({required this.errmas});
}
