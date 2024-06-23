import 'package:dartz/dartz.dart';
import 'package:open/core/utiles/Failure.dart';

abstract class AccRepo {
  Future<Either<Failure, dynamic>> Getinfo(String endPoint, token);
}
