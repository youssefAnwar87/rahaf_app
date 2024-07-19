part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterPasswordVisibilityToggled extends RegisterState {}


class LoadingSignUpState extends RegisterState{}

class SuccessSignUpState extends RegisterState{}

class ErrorSignUpState extends RegisterState{}