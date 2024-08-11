import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rahaf/core/error/exception.dart';
import 'package:rahaf/core/shared/usecases/network_info.dart';
import 'package:rahaf/locator.dart';

Future<Either<String, T>> executeAndHandleError<T>(
  Future<T> Function() function,
) async {
  try {
    final result = await function();
    return Right(result);
  } catch (e) {
    final failure = ErrorHandler.handle(e);
    return Left(failure.errorMessage ?? "");
  }
}

Future<T> executeAndHandleErrorServer<T>(
  Future<T> Function() function,
) async {
  try {
    final internet = await locator<NetworkChecker>().isConnected;
    if (!internet) throw NoInternetException();
    final result = await function();
    return result;
  } on DioException catch (error) {
    throw DioException(
        message: error.response?.data?["error_status"].toString(),
        requestOptions: error.requestOptions);
  } on NoInternetException {
    throw NoInternetException();
  } on Exception catch (error) {
    throw Exception(error.toString());
  }
}
