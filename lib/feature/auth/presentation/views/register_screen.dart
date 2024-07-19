import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rahaf/core/routes/routes_names.dart';
import 'package:rahaf/core/customs/custom_button.dart';
import 'package:rahaf/feature/auth/presentation/views_model/register/register_cubit.dart';
import 'package:rahaf/feature/auth/presentation/widgets/dropdown_widget.dart';
import 'package:rahaf/feature/auth/presentation/widgets/footer_widget.dart';
import 'package:rahaf/feature/auth/presentation/widgets/header_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/customs/text_field_item.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is SuccessSignUpState) {
            GoRouter.of(context).pushReplacementNamed(RoutesNames.profile);
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);

          return Form(
            key: cubit.formKey,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HeaderWidget(
                      headerName: AppLocalizations.of(context)!.sign_up_now,
                      headerLine: AppLocalizations.of(context)!
                          .please_fill_the_details_and_create_account,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldItem(
                            hintText: AppLocalizations.of(context)!.first_name,
                            controller:
                                RegisterCubit.get(context).firstNameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return AppLocalizations.of(context)!
                                    .invalid_name;
                              }
                              bool namevalid =
                                  RegExp(r"^[a-zA-Z]+$").hasMatch(value);
                              if (!namevalid) {
                                return AppLocalizations.of(context)!
                                    .invalid_name;
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          child: TextFieldItem(
                            hintText: AppLocalizations.of(context)!.second_name,
                            controller:
                                RegisterCubit.get(context).lastNameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return AppLocalizations.of(context)!
                                    .invalid_name;
                              }
                              bool namevalid =
                                  RegExp(r"^[a-zA-Z]+$").hasMatch(value);
                              if (!namevalid) {
                                return AppLocalizations.of(context)!
                                    .invalid_name;
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    TextFieldItem(
                      hintText: AppLocalizations.of(context)!.phone,
                      controller: RegisterCubit.get(context).phoneNumController,
                      keyboardType: null,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppLocalizations.of(context)!
                              .please_enter_your_password;
                        }
                        if (value.length != 11) {
                          return AppLocalizations.of(context)!
                              .the_phone_number_should_be_at_least_11_number;
                        }
                        return null;
                      },
                      suffixIcon: const Icon(Icons.phone_android),
                    ),
                    TextFieldItem(
                      hintText: AppLocalizations.of(context)!.password,
                      controller: cubit.passwordController,
                      isObsecure: cubit.isObsecure,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppLocalizations.of(context)!
                              .please_enter_your_password;
                        }
                        if (value.trim().length < 6 ||
                            value.trim().length > 30) {
                          return AppLocalizations.of(context)!
                              .password_should_be_6_30;
                        }
                        return null;
                      },
                      suffixIcon: InkWell(
                        child: cubit.isObsecure
                            ? const Icon(Icons.visibility_off)
                            : Icon(Icons.visibility,
                                color: Theme.of(context).cardColor),
                        onTap: () {
                          cubit.togglePasswordVisibility();
                        },
                      ),
                    ),
                    CustomButton(
                      onPressed: () {
                        RegisterCubit.get(context).submitForm();
                      },
                      isLoading: state is LoadingSignUpState,
                      textInButton: AppLocalizations.of(context)!.sign_up_now,
                    ),
                    FooterWidget(
                      footerLine:
                          AppLocalizations.of(context)!.already_have_an_account,
                      footerNavigationTextButton:
                          AppLocalizations.of(context)!.sign_in,
                      nextScreen: RoutesNames.login,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
