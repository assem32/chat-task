import 'package:chat_task/core/api_service.dart';
import 'package:chat_task/core/constants.dart';
import 'package:chat_task/core/error.dart';
import 'package:chat_task/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, String>> makeNotification(token,name,message) async {
    try {
      await apiService.post(endPoint: sendNotification, data: {
        "to":token,
        "notification": {"title": "Chat app", "body": "$name : $message", "sound": "default"},
        "android": {
          "Priority": "HIGH",
        },
        "data": {
          "type": "order",
          "id": "87",
          "click_action": "FLUTTER_NOTIFICATION_CLICK"
        }
      });
      return right('done');
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
