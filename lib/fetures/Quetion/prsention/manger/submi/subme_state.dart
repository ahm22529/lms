part of 'subme_cubit.dart';

@immutable
sealed class SubmeState {}

final class SubmeInitial extends SubmeState {}
final class Submeload extends SubmeState {}
final class Submesucess extends SubmeState {
  final List<dynamic>sub;

  Submesucess({required this.sub});
}
final class Submefauiler extends SubmeState {
  final String errmas;

  Submefauiler({required this.errmas});
}
