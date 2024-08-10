import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rahaf/feature/auth/presentation/views_model/login/login_cubit.dart';
import 'package:rahaf/feature/auth/presentation/views_model/otp/otp_cubit.dart';
import 'package:rahaf/feature/auth/presentation/views_model/register/register_cubit.dart';
import 'package:rahaf/feature/home/presentation/views_model/home_layout/home_layout_cubit.dart';
import 'package:rahaf/feature/trips/presentation/views_model/destinations/destenations_cubit.dart';
import 'package:rahaf/locator.dart';

List<SingleChildWidget> providers = [
  BlocProvider(create: (_) => locator<OTPCubit>()),
  BlocProvider(create: (_) => locator<RegisterCubit>()),
  BlocProvider(create: (_) => locator<LoginCubit>()),
  BlocProvider(create: (_) => locator<HomeLayoutCubit>()),
  BlocProvider(create: (_) => locator<DestenationsCubit>()),
];
