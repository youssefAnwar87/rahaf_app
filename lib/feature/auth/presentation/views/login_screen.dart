import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rahaf/core/routes/routes_names.dart';
import 'package:rahaf/core/customs/text_field_item.dart';
import 'package:rahaf/core/customs/custom_button.dart';
import 'package:rahaf/feature/auth/presentation/widgets/footer_widget.dart';
import 'package:rahaf/feature/auth/presentation/widgets/header_widget.dart';

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
                const HeaderWidget(
                  headerName: "Sign in now",
                  headerLine: "Please sign in to continue our app",
                ),
                TextFieldItem(
                  hintText: "phone",
                  controller: phoneNumController,
                  keyboardType: TextInputType.phone, // Update this line
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "please enter your mobile number";
                    }
                    if (value.length != 11) {
                      return "The phone number should be at least 11 number";
                    }
                    return null;
                  },
                  suffixIcon: const Icon(Icons.phone_android),
                ),
                TextFieldItem(
                  hintText: "password",
                  controller: passwordController,
                  isObsecure: isObsecure,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "please enter your password";
                    }
                    if (value.trim().length < 6 || value.trim().length > 30) {
                      return "password should be >6 & <30";
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
                      "Forget password?",
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
                  onPressed: () {},
                  textInButton: "Sign in",
                ),
                const FooterWidget(
                    footerLine: "Don't have an account?",
                    footerNavigationTextButton: "Sign up",
                    nextScreen: RoutesNames.register),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
