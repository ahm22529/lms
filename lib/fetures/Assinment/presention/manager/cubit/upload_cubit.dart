import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:open/fetures/Assinment/data/repo/AssinmeRepo.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit({required this.assinmentREpo}) : super(UploadInitial());

  AssinmetRepo assinmentREpo;
  void uploadAssin(filepatch, String endpoint) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('o');
    print("object$token");
    emit(Uploadload());
    final result = await assinmentREpo.upload(filepatch, endpoint, token);
    print(result);
    result.fold(
      (failure) => emit(Uploadfailuer(errmas: failure.errmas)),
      (r) => emit(Uploadsucess(mass: r)),
    );
  }
}
