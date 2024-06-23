part of 'que_cubit.dart';

@immutable
sealed class QueState {}

final class QueInitial extends QueState {}

final class Queload extends QueState {}

final class Quesucesss extends QueState {
  final Quetionmodel que;

  Quesucesss({required this.que});
}

final class Quefailuer extends QueState {
  final String errmass;

  Quefailuer({required this.errmass});
}
