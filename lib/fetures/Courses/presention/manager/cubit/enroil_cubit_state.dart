part of 'enroil_cubit_cubit.dart';

@immutable
sealed class EnroilCubitState {}

final class EnroilCubitInitial extends EnroilCubitState {}

final class EnroilCubiload extends EnroilCubitState {}

final class EnroilCubsucess extends EnroilCubitState {
  final List<EnroliCoursesRespno> Enroil;

  EnroilCubsucess({required this.Enroil});
}

final class EnroilCubitfailure extends EnroilCubitState {
  final String errmass;

  EnroilCubitfailure({required this.errmass});
}
