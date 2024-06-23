import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:open/fetures/Quetion/data/Repo/question.dart';
import 'package:open/fetures/Quetion/data/model/submi_model/submi_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'subme_state.dart';

class SubmeCubit extends Cubit<SubmeState> {
  SubmeCubit({required this.questionRepo}) : super(SubmeInitial());
  QuestionRepo questionRepo;
  void login(List body, String endpoint) async {
    emit(Submeload());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('o');
    print('QQQQQQQQQQQQQQQQQ $token');
    final result = await questionRepo.subme(body, endpoint, token);
    print(result);
    result.fold(
      (failure) => emit(Submefauiler(errmas: failure.errmas)),
      (r) => emit(Submesucess(sub: r)),
    );
  }
}

