import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:open/fetures/Quetion/data/Repo/question.dart';
import 'package:open/fetures/Quetion/data/model/quetionmodel/quetionmodel.dart';
import 'package:open/fetures/Quize/data/model/quize_model/quize_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'que_state.dart';

class QueCubit extends Cubit<QueState> {
  QueCubit({required this.questionRepo}) : super(QueInitial());
  QuestionRepo questionRepo;
  void getQues(String endpoint, QuizeModel quizeModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('o');
    emit(Queload());
    print('que$token');
    final result = await questionRepo.getQues(endpoint, quizeModel, token);
    print("que $result");
    print(0);
    result.fold(
      (failure) => emit(Quefailuer(errmass: failure.errmas)),
      (r) => emit(Quesucesss(que: r)),
    );
  }
}
