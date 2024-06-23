part of 'quize_cubit.dart';

@immutable
sealed class QuizeState {}

final class QuizeInitial extends QuizeState {}

final class Quizeload extends QuizeState {}

final class Quizesucess extends QuizeState {
  final List<QuizeModel> quiz;

  Quizesucess({required this.quiz});
}

final class Quizefailuer extends QuizeState {
  final String errmas;

  Quizefailuer({required this.errmas});
}
