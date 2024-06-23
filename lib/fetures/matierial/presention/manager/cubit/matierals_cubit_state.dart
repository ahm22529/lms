part of 'matierals_cubit_cubit.dart';

@immutable
sealed class MatieralsCubitState {}

final class MatieralsCubitInitial extends MatieralsCubitState {}

final class MatieralsCubitload extends MatieralsCubitState {}

final class MatieralsCubitsucess extends MatieralsCubitState {
  final List<MatieralResponseModel> matieral;

  MatieralsCubitsucess({required this.matieral});
}

final class MatieralsCubitfauiler extends MatieralsCubitState {
  final String errmass;

  MatieralsCubitfauiler({required this.errmass});
}
