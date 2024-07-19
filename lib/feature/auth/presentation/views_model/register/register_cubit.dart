import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rahaf/feature/auth/data/models/request_model.dart';
import 'package:rahaf/feature/auth/data/models/user_model.dart';
import 'package:rahaf/feature/auth/data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepository) : super(RegisterInitial());
  final AuthRepository _authRepository;

  static RegisterCubit get(context) => BlocProvider.of(context);

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneNumController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObsecure = true;

  void togglePasswordVisibility() {
    isObsecure = !isObsecure;
    emit(RegisterPasswordVisibilityToggled());
  }

  UserModel? model;
  void submitForm() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoadingSignUpState());
      var res = await _authRepository.registration(RequestModel(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          phone: phoneNumController.text,
          password: passwordController.text));
      res.fold((l) {
        emit(ErrorSignUpState());
      }, (r) {
        model = r;
        emit(SuccessSignUpState());
      });
    } else {
      emit(ErrorSignUpState());
    }
  }
}
