part of 'grad_cubit.dart';

@immutable
sealed class GradState {}

final class GradInitial extends GradState {}

final class Gradload extends GradState {}

final class Gradsucess extends GradState {
  final List<GardModel> grad;

  Gradsucess({required this.grad});
}

final class Gradfauiler extends GradState {
  final String errmas;

  Gradfauiler({required this.errmas});
}
