import 'package:dartz/dartz.dart';
import 'package:open/core/utiles/Failure.dart';

abstract class GradRepo {
  Future<Either<Failure, dynamic>> GetGrad(String endPoint, token, cid);
}
