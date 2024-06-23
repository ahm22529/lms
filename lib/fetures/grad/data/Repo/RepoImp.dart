import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:open/core/utiles/Dio.dart';
import 'package:open/core/utiles/Failure.dart';
import 'package:open/fetures/grad/data/Model/gard_model/gard_model.dart';
import 'package:open/fetures/grad/data/Repo/Repo.dart';

class GredREpoImp extends GradRepo {
  Dio dio = Dio();
  @override
  Future<Either<Failure, dynamic>> GetGrad(String endPoint, token, cid) async {
    // TODO: implement GetGrad
    try {
      final Request api = Request(dio);

      List<dynamic> responseData =
          await api.getReqest(cid, endPoint: endPoint, token: token);
      List<GardModel> courses =
          responseData.map((json) => GardModel.fromJson(json)).toList();
      return right(courses);
    } catch (e) {
      if (e is DioError) {
        return left(ServFailure.formdioerr(e));
      } else {
        return left(ServFailure(e.toString()));
      }
    }
  }
}
