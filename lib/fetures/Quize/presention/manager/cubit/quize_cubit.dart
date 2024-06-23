import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';
import 'package:open/fetures/Quize/data/Repo/QuizeRepo.dart';
import 'package:open/fetures/Quize/data/model/quize_model/quize_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'quize_state.dart';

class QuizeCubit extends Cubit<QuizeState> {
  QuizeCubit({required this.quizeRpo}) : super(QuizeInitial());
  QuizeRpo quizeRpo;
  void getQuize(
      String endpoint, EnroliCoursesRespno enroliCoursesRespno) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('o');
    emit(Quizeload());
    final result =
        await quizeRpo.getQuize(endpoint, enroliCoursesRespno, token);
    print("Quize $result");
    print(0);
    result.fold(
      (failure) => emit(Quizefailuer(errmas: failure.errmas)),
      (r) => emit(Quizesucess(quiz: r)),
    );
  }
}
