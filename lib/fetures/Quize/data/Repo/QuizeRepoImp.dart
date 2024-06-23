import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:open/core/utiles/Dio.dart';
import 'package:open/core/utiles/Failure.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';
import 'package:open/fetures/Quize/data/Repo/QuizeRepo.dart';
import 'package:open/fetures/Quize/data/model/quize_model/quize_model.dart';

class QuizeRepoImp extends QuizeRpo {
  Dio dio = Dio();
  @override
  Future<Either<Failure, dynamic>> getQuize(
      String endPoint, EnroliCoursesRespno enroliCoursesRespno, token) async {
    try {
      final Request api = Request(dio);

      List<dynamic> responseData = await api.getReqest(
          enroliCoursesRespno.cycleId,
          endPoint: endPoint,
          token: token);
      List<QuizeModel> courses =
          responseData.map((json) => QuizeModel.fromJson(json)).toList();
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
