import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/feature/auth/presentation/views/forget_password_screen.dart';
import 'package:rahaf/feature/auth/presentation/views/register_screen.dart';
import 'package:rahaf/core/customs/text_field_item.dart';
import 'package:rahaf/core/customs/custom_button.dart';
import 'package:rahaf/feature/auth/presentation/widgets/footer_widget.dart';
import 'package:rahaf/feature/auth/presentation/widgets/header_widget.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login screen";

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
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeaderWidget(headerName: "Sign in now", headerLine:"Please sign in to continue our app",),
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
                    if (value.trim()!.length < 6 || value.trim()!.length > 30) {
                      return "password should be >6 & <30";
                    }
                    return null;
                  },
                  suffixIcon: InkWell(
                      child: isObsecure
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility, color: Color(0xff7D848D)),
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
                    Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Text(
                      "Forget password?",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontFamily: 'Itim',
                          color: Colors.blue,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                CustomButton(formKey: formKey,textInButton: "Sign in",),
                FooterWidget(footerLine:"Don't have an account?",
                    footerNavigationTextButton: "Sign up",
                    nextScreen: RegisterScreen.routeName),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
