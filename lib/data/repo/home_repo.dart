import 'package:chat_task/core/error.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, String>> makeNotification(String token, String name,String message);
  
  }