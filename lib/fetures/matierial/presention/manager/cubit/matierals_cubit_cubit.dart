import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';
import 'package:open/fetures/matierial/data/Repo/MatieralsRepo.dart';
import 'package:open/fetures/matierial/matieral_response_model/matieral_response_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'matierals_cubit_state.dart';

class MatieralsCubitCubit extends Cubit<MatieralsCubitState> {
  MatieralsCubitCubit({required this.rep}) : super(MatieralsCubitInitial());
  matRep rep;
  void getcourses(
      String endpoint, EnroliCoursesRespno enroliCoursesRespno) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('o');
    emit(MatieralsCubitload());
    final result = await rep.getmatierls(endpoint, enroliCoursesRespno, token);
    print("ccccc $result");
    print(0);
    result.fold(
      (failure) => emit(MatieralsCubitfauiler(errmass: failure.errmas)),
      (r) => emit(MatieralsCubitsucess(matieral: r)),
    );
  }
}
