import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:open/core/utiles/Dio.dart';
import 'package:open/core/utiles/Failure.dart';
import 'package:open/fetures/calender/data/model/calender_model/calender_model.dart';
import 'package:open/fetures/calender/data/repo/repo.dart';

class CalenderREpImp extends calREpo {
  Dio dio = Dio();
  @override
  Future<Either<Failure, dynamic>> calenderebent(String endPoint, token) async {
    try {
      final Request api = Request(dio);

      List<dynamic> responseData =
          await api.getReqest("", endPoint: endPoint, token: token);
      List<CalenderModel> courses =
          responseData.map((json) => CalenderModel.fromJson(json)).toList();
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
}
