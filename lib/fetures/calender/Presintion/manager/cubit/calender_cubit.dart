import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:open/fetures/calender/data/model/calender_model/calender_model.dart';
import 'package:open/fetures/calender/data/repo/repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'calender_state.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit({required this.cal}) : super(CalenderInitial());
  calREpo cal;
  void getevent(String endpoint) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('o');
    emit(Calenderload());
    final result = await cal.calenderebent(endpoint, token);
    print("le ${result}");
    print(0);
    result.fold(
      (failure) => emit(Calenderfauiler(errmass: failure.errmas)),
      (r) => emit(Calendersucess(event: r)),
    );
  }
}
