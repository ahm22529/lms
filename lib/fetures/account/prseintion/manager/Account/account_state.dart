part of 'account_cubit.dart';

@immutable
sealed class AccountState {}

final class AccountInitial extends AccountState {}

final class Accountload extends AccountState {}

final class Accountsucess extends AccountState {
  final InfoModel Info;

  Accountsucess({required this.Info});
}

final class Accountfauiler extends AccountState {
  final String errmass;

  Accountfauiler({required this.errmass});
}
