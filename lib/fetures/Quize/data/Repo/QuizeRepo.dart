import 'package:dartz/dartz.dart';
import 'package:open/core/utiles/Failure.dart';
import 'package:open/fetures/Courses/data/model/enroli_courses_respno/enroli_courses_respno.dart';

abstract class QuizeRpo {
  Future<Either<Failure, dynamic>> getQuize(
      String endPoint, EnroliCoursesRespno enroliCoursesRespno, token);
}
