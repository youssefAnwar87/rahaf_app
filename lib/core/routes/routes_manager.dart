import 'package:go_router/go_router.dart';
import 'package:rahaf/core/routes/routes_names.dart';
import 'package:rahaf/feature/auth/presentation/views/forget_password_screen.dart';
import 'package:rahaf/feature/auth/presentation/views/login_screen.dart';
import 'package:rahaf/feature/auth/presentation/views/otp_verification_screen.dart';
import 'package:rahaf/feature/auth/presentation/views/register_screen.dart';
import 'package:rahaf/feature/home/presentation/views/home_layout_screen.dart';
import 'package:rahaf/feature/profile/profile_screen.dart';
import 'package:rahaf/feature/splash/presentation/views/splash_screen.dart';
import 'package:rahaf/feature/trips/presentation/views/destinations_screen.dart';

abstract class RoutesManager {
  static final routes = GoRouter(routes: [
    GoRoute(
        path: RoutesNames.splash,
        name: RoutesNames.splash,
        builder: (context, state) => const SplashScreen()),
    GoRoute(
        path: RoutesNames.login,
        name: RoutesNames.login,
        builder: (context, state) => const LoginScreen()),
    GoRoute(
        path: RoutesNames.register,
        name: RoutesNames.register,
        builder: (context, state) => const RegisterScreen()),
    GoRoute(
        path: RoutesNames.forgetPassword,
        name: RoutesNames.forgetPassword,
        builder: (context, state) => const ForgetPasswordScreen()),
    GoRoute(
        path: RoutesNames.otp,
        name: RoutesNames.otp,
        builder: (context, state) => OTPVerificationScreen()),
    GoRoute(
        path: RoutesNames.profile,
        name: RoutesNames.profile,
        builder: (context, state) => const ProfileScreen()),
    GoRoute(
      path: RoutesNames.homeLayout,
      name: RoutesNames.homeLayout,
      builder: (context, state) => const HomeLayout(),
    ),
    GoRoute(
      path: RoutesNames.destinations,
      name: RoutesNames.destinations,
      builder: (context, state) => const DestinationsScreen(),
    ),
  ]);
}
