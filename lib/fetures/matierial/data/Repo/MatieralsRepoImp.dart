import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:open/core/utiles/Dio.dart';
import 'package:open/core/utiles/Failure.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';
import 'package:open/fetures/matierial/data/Repo/MatieralsRepo.dart';
import 'package:open/fetures/matierial/matieral_response_model/matieral_response_model.dart';

class matRepimp extends matRep {
  Dio dio = Dio();
  @override
  Future<Either<Failure, dynamic>> getmatierls(
      String endPoint, EnroliCoursesRespno enroliCoursesRespno, token) async {
    try {
      final Request api = Request(dio);

      List<dynamic> responseData = await api.getReqest(
          enroliCoursesRespno.cycleId,
          endPoint: endPoint,
          token: token);
      List<MatieralResponseModel> courses = responseData
          .map((json) => MatieralResponseModel.fromJson(json))
          .toList();
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
