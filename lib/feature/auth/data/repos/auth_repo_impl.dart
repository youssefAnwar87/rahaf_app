import 'package:dartz/dartz.dart';
import 'package:rahaf/core/error/execute_and_handle_error.dart';
import 'package:rahaf/core/shared/usecases/app_local.dart';
import 'package:rahaf/feature/auth/data/datasources/api_service_auth.dart';
import 'package:rahaf/feature/auth/data/models/request_model.dart';
import 'package:rahaf/feature/auth/data/models/user_model.dart';
import 'package:rahaf/feature/auth/data/repos/auth_repo.dart';


class AuthImplRepository implements AuthRepository {
  final ApiServiceAuth _apiServiceAuth;
  final AppLocal _appLocal;


  AuthImplRepository(
    this._apiServiceAuth, this._appLocal,
  );

  @override
  Future<Either<String, UserModel>> login(String phone, String password) async {
    return executeAndHandleError<UserModel>(() async {
      final res = await _apiServiceAuth.login(phone, password);
      _appLocal.saveToken(res.token ?? "");
      return res;
    });
  }


  @override
  Future<Either<String, UserModel>> registration(RequestModel request) async {
    return executeAndHandleError<UserModel>(() async {
      final res = await _apiServiceAuth.registration(request);
            _appLocal.saveToken(res.token ?? "");

      return res;
    });
  }
}
