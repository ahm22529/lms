import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';
import 'package:open/fetures/Courses/data/repo/Repo.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'enroil_cubit_state.dart';

class EnroilCubitCubit extends Cubit<EnroilCubitState> {
  EnroilCubitCubit({required this.enroliRepo}) : super(EnroilCubitInitial());
  EnroliRepo enroliRepo;
  void getcourses(String endpoint) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('o');

    prefs.getString(
      'token',
    );

    emit(EnroilCubiload());
    final result = await enroliRepo.GetEnroli(endpoint, token);
    print(result);
    print(0);
    result.fold(
      (failure) => emit(EnroilCubitfailure(errmass: failure.errmas)),
      (r) => emit(EnroilCubsucess(Enroil: r)),
    );
  }
}
