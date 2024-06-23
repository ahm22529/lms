import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:open/core/utiles/Dio.dart';
import 'package:open/core/utiles/Failure.dart';
import 'package:open/fetures/account/data/Repo/AcccountRep.dart';
import 'package:open/fetures/account/data/model/info_model.dart';

class AccountRepoImp extends AccRepo {
  Dio dio = Dio();
  @override
  Future<Either<Failure, dynamic>> Getinfo(String endPoint, token) async {
    try {
      final Request api = Request(dio);

      dynamic responseData =
          await api.getReqest('', endPoint: endPoint, token: token);
      InfoModel Info = InfoModel.fromJson(responseData);

      return right(Info);
    } catch (e) {
      if (e is DioError) {
        return left(ServFailure.formdioerr(e));
      } else {
        return left(ServFailure(e.toString()));
      }
    }
  }
}
