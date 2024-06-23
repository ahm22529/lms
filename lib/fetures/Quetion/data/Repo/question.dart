import 'package:dartz/dartz.dart';
import 'package:open/core/utiles/Failure.dart';
import 'package:open/fetures/Quize/data/model/quize_model/quize_model.dart';

abstract class QuestionRepo {
  Future<Either<Failure, dynamic>> getQues(
      String endPoint, QuizeModel quizeModel, token);
  Future<Either<Failure, dynamic>> subme(
      List body, String endpoint,oken);

}
