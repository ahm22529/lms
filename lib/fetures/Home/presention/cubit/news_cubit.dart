import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:open/fetures/Home/data/Model/news/news.dart';
import 'package:open/fetures/Home/data/Repo/Homerepo.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit({required this.homeRepo}) : super(NewsInitial());
  HomeRepo homeRepo;
  void getcourses(String endpoint) async {
    emit(NewsLoading());
    final result = await homeRepo.Getnews(endpoint);
    print(result);
    print(0);
    result.fold(
      (failure) => emit(Newsfailuer(errmass: failure.errmas)),
      (r) => emit(Newssucess(news: r)),
    );
  }
}
