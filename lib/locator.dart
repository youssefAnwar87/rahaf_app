import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rahaf/core/shared/datasources/local/cache_helper.dart';
import 'package:rahaf/core/shared/usecases/app_local.dart';
import 'package:rahaf/core/shared/usecases/network_info.dart';
import 'package:rahaf/feature/auth/data/datasources/api_service_auth.dart';
import 'package:rahaf/feature/auth/data/repos/auth_repo.dart';
import 'package:rahaf/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:rahaf/feature/auth/presentation/views_model/login/login_cubit.dart';
import 'package:rahaf/feature/auth/presentation/views_model/otp/otp_cubit.dart';
import 'package:rahaf/feature/auth/presentation/views_model/register/register_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  //BLOC
  locator.registerFactory(() => OTPCubit()..startTimer());
  locator.registerFactory(() => RegisterCubit(locator()));
  locator.registerFactory(() => LoginCubit(locator()));
  // //CORE

  // //REPOSITORISE
  locator.registerLazySingleton<AuthRepository>(
      () => AuthImplRepository(locator() , locator()));

  // //DATASOURSE
  locator.registerLazySingleton(() => ApiServiceAuth());

  // //EXTRNAL
  locator.registerLazySingleton(() => SharedPreferences.getInstance());
  locator.registerLazySingleton(() => InternetConnectionChecker());

  locator.registerLazySingleton(() => NetworkChecker(locator()));
  locator.registerLazySingleton(() => AppLocal());
  locator.registerLazySingleton(() => CacheHelper());
}
