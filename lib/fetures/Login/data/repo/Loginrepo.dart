import 'package:dartz/dartz.dart';
import 'package:open/core/utiles/Failure.dart';
import 'package:open/fetures/Login/data/model/inputmodel.dart';

abstract class LoginRepo {
  Future<Either<Failure, dynamic>> login(
      Logininput loginModel, String endpoint);
}
