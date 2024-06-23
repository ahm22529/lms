import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:open/fetures/Login/data/model/inputmodel.dart';
import 'package:open/fetures/Login/data/model/login_respone.dart';
import 'package:open/fetures/Login/data/repo/Loginrepo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());
  LoginRepo loginRepo;
  void login(Logininput loginModel, String endpoint) async {
    emit(Loginloading());
    final result = await loginRepo.login(loginModel, endpoint);
    result.fold(
      (failure) => emit(Loginfauiler(errmas: failure.errmas)),
      (r) => emit(Loginscess(loginRespone: r)),
    );
  }
}
