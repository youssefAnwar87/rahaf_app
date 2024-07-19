import 'package:dio/dio.dart';
import 'package:rahaf/core/error/execute_and_handle_error.dart';
import 'package:rahaf/core/shared/usecases/server_config.dart';
import 'package:rahaf/feature/auth/data/models/request_model.dart';
import 'package:rahaf/feature/auth/data/models/user_model.dart';

import '../../../../core/shared/datasources/remote/api_base.dart';

class ApiServiceAuth extends ApiBase {
  Future<UserModel> login(String phone, String password) async {
    return executeAndHandleErrorServer<UserModel>(() async {
      final response = await post(ServerConfig.login,
          body: {"phone": phone, "password": password},
          contentType: "application/json",
          );
      if (response.statusCode == 200  || response.statusCode == 201) {
        try {
          return UserModel.fromJson(response.json);
        } catch (e, s) {
          print(s);
          rethrow;
        }
      } else {
        throw Exception;
      }
    });
  }

  Future<UserModel> registration(RequestModel request) async {
    return executeAndHandleErrorServer<UserModel>(() async {
      FormData model = await request.toFormData();

      final response =
          await post(ServerConfig.register, body: model);
      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          return UserModel.fromJson(response.json);
        } catch (e) {
          rethrow;
        }
      } else {
        throw Exception;
      }
    });
  }
}
