import 'package:dartz/dartz.dart';
import 'package:open/core/utiles/Failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, dynamic>> Getnews(String endPoint);
}
