part of 'upload_cubit.dart';

@immutable
sealed class UploadState {}

final class UploadInitial extends UploadState {}

final class Uploadload extends UploadState {}

final class Uploadsucess extends UploadState {
  final String mass;

  Uploadsucess({required this.mass});
}

final class Uploadfailuer extends UploadState {
  final String errmas;

  Uploadfailuer({required this.errmas});
}
