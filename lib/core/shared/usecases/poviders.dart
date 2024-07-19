import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rahaf/feature/auth/presentation/views_model/login/login_cubit.dart';
import 'package:rahaf/feature/auth/presentation/views_model/otp/otp_cubit.dart';
import 'package:rahaf/feature/auth/presentation/views_model/register/register_cubit.dart';
import 'package:rahaf/locator.dart';

List<SingleChildWidget> providers = [
  BlocProvider(create: (_) => locator<OTPCubit>()),
  BlocProvider(create: (_) => locator<RegisterCubit>()),
  BlocProvider(create: (_) => locator<LoginCubit>()),

];