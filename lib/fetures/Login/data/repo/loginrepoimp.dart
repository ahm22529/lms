import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:open/core/utiles/Dio.dart';
import 'package:open/core/utiles/Failure.dart';
import 'package:open/fetures/Login/data/model/inputmodel.dart';
import 'package:open/fetures/Login/data/model/login_respone.dart';
import 'package:open/fetures/Login/data/repo/Loginrepo.dart';

class LoginRepoImp extends LoginRepo {
  Dio dio = Dio();
  @override
  Future<Either<Failure, dynamic>> login(
      Logininput loginModel, String endpoint) async {
    try {
      final Request api = Request(dio);
      Map data = {"email": loginModel.email, "password": loginModel.password};
      var response = await api.post(data, endpoint, "", 'application/json');

      return right(LoginRespone.fromJson(response));
    } catch (e) {
      if (e is DioError) {
        return left(ServFailure.formdioerr(e));
      } else {
        return left(ServFailure(e.toString()));
      }
    }
  }
}
