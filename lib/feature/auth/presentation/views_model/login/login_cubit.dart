import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rahaf/feature/auth/data/models/user_model.dart';
import 'package:rahaf/feature/auth/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(LoginInitial());
  final AuthRepository _authRepository;

  static LoginCubit get(context) => BlocProvider.of(context);

  var phoneNumController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObsecure = true;

  void togglePasswordVisibility() {
    isObsecure = !isObsecure;
    emit(LoginPasswordVisibilityToggled());
  }

  UserModel? model;
  void submitForm() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoadingLoginState());
      var res = await _authRepository.login(
        phoneNumController.text,
        passwordController.text
      );
      res.fold((l) {
        emit(ErrorLoginState());
      }, (r) {
        model = r;
        emit(SuccessLoginState());
      });
    }
  }
}
