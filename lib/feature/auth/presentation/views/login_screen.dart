
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rahaf/core/routes/routes_names.dart';
import 'package:rahaf/core/customs/text_field_item.dart';
import 'package:rahaf/core/customs/custom_button.dart';
import 'package:rahaf/feature/auth/presentation/widgets/footer_widget.dart';
import 'package:rahaf/feature/auth/presentation/widgets/header_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var phoneNumController = TextEditingController();
  var passwordController = TextEditingController();
  bool isObsecure = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 HeaderWidget(
                  headerName: AppLocalizations.of(context)!.sign_in_now,
                  headerLine: AppLocalizations.of(context)!.please_sign_in_to_continue_our_app,
                ),
                TextFieldItem(
                  hintText: AppLocalizations.of(context)!.phone,
                  controller: phoneNumController,
                  keyboardType: TextInputType.phone, // Update this line
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_your_mobile_number;
                    }
                    if (value.length != 11) {
                      return AppLocalizations.of(context)!.the_phone_number_should_be_at_least_11_number;
                    }
                    return null;
                  },
                  suffixIcon: const Icon(Icons.phone_android),
                ),
                TextFieldItem(
                  hintText: AppLocalizations.of(context)!.password,
                  controller: passwordController,
                  isObsecure: isObsecure,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_your_password;
                    }
                    if (value.trim().length < 6 || value.trim().length > 30) {
                      return AppLocalizations.of(context)!.password_should_be_6_30;
                    }
                    return null;
                  },
                  suffixIcon: InkWell(
                      child: isObsecure
                          ? const Icon(Icons.visibility_off)
                          : Icon(Icons.visibility,
                              color : Theme.of(context).cardColor),
                      onTap: () {
                        if (isObsecure) {
                          isObsecure = false;
                        } else {
                          isObsecure = true;
                        }
                        setState(() {});
                      }),
                ),
                InkWell(
                  onTap: () {
                    GoRouter.of(context).pushNamed(RoutesNames.forgetPassword);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Text(
                        AppLocalizations.of(context)!.forget_password,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontFamily: 'Itim',
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                CustomButton(
                  onPressed: () {
    if (formKey.currentState?.validate() == true) {}
    },
                  textInButton: AppLocalizations.of(context)!.sign_in,
                ),
                 FooterWidget(
                    footerLine: AppLocalizations.of(context)!.dont_have_an_account,
                    footerNavigationTextButton: AppLocalizations.of(context)!.sign_up,
                    nextScreen: RoutesNames.register),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
