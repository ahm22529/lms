import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:open/core/utiles/Dio.dart';
import 'package:open/core/utiles/Failure.dart';
import 'package:open/fetures/Assinment/data/model/task_model_response/task_model_response.dart';
import 'package:open/fetures/Assinment/data/repo/AssinmeRepo.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';

class AssinmentREpoImp extends AssinmetRepo {
  Dio dio = Dio();
  @override
  Future<Either<Failure, dynamic>> gettask(
      String endPoint, EnroliCoursesRespno enroliCoursesRespno, token) async {
    try {
      final Request api = Request(dio);

      List<dynamic> responseData = await api.getReqest(
          enroliCoursesRespno.cycleId,
          endPoint: endPoint,
          token: token);
      List<TaskModelResponse> courses =
          responseData.map((json) => TaskModelResponse.fromJson(json)).toList();
      print(courses);
      return right(courses);
    } catch (e) {
      if (e is DioError) {
        return left(ServFailure.formdioerr(e));
      } else {
        return left(ServFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, dynamic>> upload(
      filepatch, String endpoint, token) async {
    try {
      final Request api = Request(dio);
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filepatch, filename: 'file'),
      });
      ;
      var response = await api.post(formData, endpoint, token, 'form-data');

      return right(response);
    } catch (e) {
      if (e is DioError) {
        return left(ServFailure.formdioerr(e));
      } else {
        return left(ServFailure(e.toString()));
      }
    }
  }
}
