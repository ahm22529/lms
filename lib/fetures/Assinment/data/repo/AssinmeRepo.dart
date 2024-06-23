import 'package:dartz/dartz.dart';
import 'package:open/core/utiles/Failure.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';

abstract class AssinmetRepo {
  Future<Either<Failure, dynamic>> gettask(
      String endPoint, EnroliCoursesRespno enroliCoursesRespno, token);

  Future<Either<Failure, dynamic>> upload(filepatch, String endpoint, token);
}
