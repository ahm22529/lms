import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:open/core/utiles/Dio.dart';
import 'package:open/core/utiles/Failure.dart';
import 'package:open/fetures/Quetion/data/Repo/question.dart';
import 'package:open/fetures/Quetion/data/model/quetionmodel/quetionmodel.dart';
import 'package:open/fetures/Quetion/data/model/submi_model/submi_model.dart';
import 'package:open/fetures/Quize/data/model/quize_model/quize_model.dart';

class QuestionRepoImp extends QuestionRepo {
  Dio dio = Dio();
  @override
  Future<Either<Failure, dynamic>> getQues(
      String endPoint, QuizeModel quizeModel, token) async {
    try {
      final Request api = Request(dio);
      print(quizeModel.id);

      // Fetch data from the API
      dynamic responseData =
          await api.getReqest(quizeModel.id, endPoint: endPoint, token: token);

      // Check if the responseData is a Map (single object) or List (multiple objects)
      if (responseData is Map<String, dynamic>) {
        // If responseData is a Map, convert it to a single Quetionmodel object
        Quetionmodel question = Quetionmodel.fromJson(responseData);
        return right(question);
      } else if (responseData is List<dynamic>) {
        // If responseData is a List, convert it to a list of Quetionmodel objects
        List<Quetionmodel> questions =
            responseData.map((json) => Quetionmodel.fromJson(json)).toList();
        return right(questions);
      } else {
        // Handle unexpected response format
        return left(ServFailure("Unexpected response format"));
      }
    } catch (e) {
      if (e is DioError) {
        return left(ServFailure.formdioerr(e));
      } else {
        return left(ServFailure(e.toString()));
      }
    }
  }
  
  @override
  Future<Either<Failure, dynamic>> subme(List body, String endpoint, oken) async{
try {
      final Request api = Request(dio);
      Map data = {
  "quizId": "Q001",
  "answers": body
};
           var response = await api.post(data, endpoint, oken, 'application/json');
               
      return right(response);
    } catch (e) {
      if (e is DioError) {
        return left(ServFailure.formdioerr(e));
      } else {
        return left(ServFailure(e.toString()));
      }
    }
  }
}
