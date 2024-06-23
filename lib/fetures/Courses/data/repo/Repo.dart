import 'package:dartz/dartz.dart';
import 'package:open/core/utiles/Failure.dart';

abstract class EnroliRepo {
  Future<Either<Failure, dynamic>> GetEnroli(String endPoint, token);
}
