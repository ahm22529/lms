import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:open/fetures/grad/data/Model/gard_model/gard_model.dart';
import 'package:open/fetures/grad/data/Repo/Repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'grad_state.dart';

class GradCubit extends Cubit<GradState> {
  GradCubit({required this.gradRepo}) : super(GradInitial());
  GradRepo gradRepo;
  void getcourses(String endpoint, cid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('o');

    prefs.getString(
      'token',
    );

    emit(Gradload());
    final result = await gradRepo.GetGrad(endpoint, token, cid);
    print(result);
    print(0);
    result.fold(
      (failure) => emit(Gradfauiler(errmas: failure.errmas)),
      (r) => emit(Gradsucess(grad: r)),
    );
  }
}
