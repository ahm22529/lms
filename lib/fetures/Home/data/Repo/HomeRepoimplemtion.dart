import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:open/core/utiles/Dio.dart';
import 'package:open/core/utiles/Failure.dart';
import 'package:open/fetures/Home/data/Model/news/news.dart';
import 'package:open/fetures/Home/data/Repo/Homerepo.dart';

class HopmeRepoImp extends HomeRepo {
  Dio dio = Dio();
  @override
  Future<Either<Failure, dynamic>> Getnews(String endpoint) async {
    try {
      final Request api = Request(dio);

      List<dynamic> responseData =
          await api.getReqest('', endPoint: endpoint, token: '');
      List<News> courses =
          responseData.map((json) => News.fromJson(json)).toList();
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
