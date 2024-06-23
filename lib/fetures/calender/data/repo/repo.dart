import 'package:dartz/dartz.dart';
import 'package:open/core/utiles/Failure.dart';

abstract class calREpo {
  Future<Either<Failure, dynamic>> calenderebent(String endPoint, token);
}
