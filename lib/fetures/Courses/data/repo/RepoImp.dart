import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:open/core/utiles/Dio.dart';
import 'package:open/core/utiles/Failure.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';
import 'package:open/fetures/Courses/data/repo/Repo.dart';

class EnroliRepoImp extends EnroliRepo {
  Dio dio = Dio();
  @override
  Future<Either<Failure, dynamic>> GetEnroli(String endPoint, token) async {
    try {
      final Request api = Request(dio);

      List<dynamic> responseData =
          await api.getReqest('', endPoint: endPoint, token: token);
      List<EnroliCoursesRespno> courses = responseData
          .map((json) => EnroliCoursesRespno.fromJson(json))
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
