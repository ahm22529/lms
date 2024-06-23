part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class Newssucess extends NewsState {
  final List<News> news;

  Newssucess({required this.news});
}

final class Newsfailuer extends NewsState {
  final String errmass;

  Newsfailuer({required this.errmass});
}
