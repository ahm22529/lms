part of 'calender_cubit.dart';

@immutable
sealed class CalenderState {}

final class CalenderInitial extends CalenderState {}

final class Calenderload extends CalenderState {}

final class Calendersucess extends CalenderState {
  final List<CalenderModel> event;

  Calendersucess({required this.event});
}

final class Calenderfauiler extends CalenderState {
  final String errmass;

  Calenderfauiler({required this.errmass});
}
