part of 'assinmentget_cubit.dart';

@immutable
sealed class AssinmentgetState {}

final class AssinmentgetInitial extends AssinmentgetState {}

final class Assinmentgetload extends AssinmentgetState {}

final class Assinmentgetsucess extends AssinmentgetState {
  final List<TaskModelResponse> task;

  Assinmentgetsucess({required this.task});
}

final class Assinmentgetfailuer extends AssinmentgetState {
  final String errmass;

  Assinmentgetfailuer({required this.errmass});
}
