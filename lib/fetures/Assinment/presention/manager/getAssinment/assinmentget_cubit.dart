import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:open/fetures/Assinment/data/model/task_model_response/task_model_response.dart';
import 'package:open/fetures/Assinment/data/repo/AssinmeRepo.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'assinmentget_state.dart';

class AssinmentgetCubit extends Cubit<AssinmentgetState> {
  AssinmentgetCubit({required this.assinmentREpo})
      : super(AssinmentgetInitial());
  AssinmetRepo assinmentREpo;
  void getcourses(
      String endpoint, EnroliCoursesRespno enroliCoursesRespno) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('o');
    emit(Assinmentgetload());
    final result =
        await assinmentREpo.gettask(endpoint, enroliCoursesRespno, token);
    print("le ${result}");
    print(0);
    result.fold(
      (failure) => emit(Assinmentgetfailuer(errmass: failure.errmas)),
      (r) => emit(Assinmentgetsucess(task: r)),
    );
  }
}
