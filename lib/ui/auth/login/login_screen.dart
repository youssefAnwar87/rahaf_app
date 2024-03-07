import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/ui/auth/register/register.dart';
import 'package:rahaf/utils/app_colors.dart';
import 'package:rahaf/utils/text_field_item.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login screen";

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
                Padding(
                  padding: EdgeInsets.only(
                      top: 120.h, right: 120.w, left: 120.w, bottom: 12.h),
                  child: Text(
                    "Sign in now",
                    style: TextStyle(
                        fontFamily: 'Itim',
                        color: Colors.black,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 50.w,
                    right: 50.w,
                    bottom: 50.h,
                  ),
                  child: Container(
                    child: Center(
                      child: Text(
                        "Please sign in to continue our app",
                        style: TextStyle(
                            fontFamily: 'Itim',
                            color: AppColors.greyColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                TextFieldItem(
                  hintText: "phone",
                  controller: phoneNumController,
                  keyboardType: null,
                  validator: (value){
                    if(value == null || value.trim().isEmpty){
                      return "please enter your mobile number";
                    }
                    if(value.length!=11){
                      return "invalid number";
                    }
                    return null;
                  },
                  suffixIcon: const Icon(Icons.phone_android),
                ),
                TextFieldItem(
                  hintText: "password",
                  controller: passwordController,
                  isObsecure: isObsecure,
                  validator: (value){
                    if(value == null || value.trim().isEmpty){
                      return "please enter your password";
                    }
                    if(value.trim()!.length < 6 || value.trim()!.length > 30){
                      return "password should be >6 & <30";
                    }
                    return null;
                  },
                  suffixIcon: InkWell(
                      child: isObsecure
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility, color: Color(0xff7D848D)),
                      onTap: () {
                        if (isObsecure) {
                          isObsecure = false;
                        } else {
                          isObsecure = true;
                        }
                        setState(() {});
                      }),
                ),
                Padding(
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                  child: ElevatedButton(
                    onPressed: () {
                    if(formKey.currentState?.validate() == true) {
                    }
                      },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.r)))),
                    child: Container(
                      height: 56.h,
                      width: 335.w,
                      child: Center(
                        child: Text(
                          "sign in",
                          style: TextStyle(
                              fontFamily: 'Itim',
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontFamily: 'Itim',
                          color: AppColors.greyColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RegisterScreen.routeName);
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            fontFamily: 'Itim',
                            color: AppColors.blueColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
