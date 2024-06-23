import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:open/fetures/account/data/Repo/AcccountRep.dart';
import 'package:open/fetures/account/data/model/info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit({required this.acc}) : super(AccountInitial());
  AccRepo acc;
  void getcourses(String endpoint) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('o');

    prefs.getString(
      'token',
    );

    emit(Accountload());
    final result = await acc.Getinfo(endpoint, token);
    print("accon $result");
    print(0);
    result.fold(
      (failure) => emit(Accountfauiler(errmass: failure.errmas)),
      (r) => emit(Accountsucess(Info: r)),
    );
  }
}
