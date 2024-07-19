import 'package:dartz/dartz.dart';
import 'package:rahaf/feature/auth/data/models/request_model.dart';
import 'package:rahaf/feature/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<String, UserModel>> login(String phone, String password);
  Future<Either<String, UserModel>> registration(RequestModel request);
}
