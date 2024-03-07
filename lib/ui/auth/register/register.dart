import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/ui/auth/login/login_screen.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/text_field_item.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register screen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var firstNameController = TextEditingController();
  var secondNameController = TextEditingController();
  var phoneNumController = TextEditingController();
  var passwordController = TextEditingController();
  bool isObsecure = true;
  var formKey = GlobalKey<FormState>();
  var selectedcity ="gz";
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
                    "Sign up now",
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
                        textAlign: TextAlign.center,
                        "Please fill the details and create account",
                        style: TextStyle(
                            fontFamily: 'Itim',
                            color: AppColors.greyColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldItem(hintText: "First name",
                          controller: firstNameController,
                        validator: (value){
                          if(value == null || value.trim().isEmpty){
                            return "invalid name";
                          }
                          bool namevalid = RegExp(r"^[a-zA-Z]+$").hasMatch(value);
                          if(!namevalid){
                            return "invalid name";
                          }
                          return null;
                        },

                      ),
                    ),
                    Expanded(
                      child: TextFieldItem(hintText: "Second name",
                          validator: (value){
                            if(value == null || value.trim().isEmpty){
                              return "invalid name";
                            }
                            bool namevalid = RegExp(r"^[a-zA-Z]+$").hasMatch(value);
                            if(!namevalid){
                              return "invalid name";
                            }
                            return null;
                          },

                          controller: secondNameController),
                    ),
                  ],
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
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: const Color.fromARGB(255, 220, 220, 220),

                      border: Border.all(
                          width: 2,
                          color: AppColors.whiteColor
                      ),
                    ),
                    child: DropdownButton<String>(
                      icon: Icon(Icons.keyboard_arrow_down), // Customize the icon here

                      padding: EdgeInsets.all(5),
                      isExpanded: true,
                      value: selectedcity,
                      items: [
                        DropdownMenuItem<String>(
                          value: "gz",
                          child: Text("Giza",
                            style: TextStyle(
                                color:  AppColors.blackColor
                            ),),
                        ),
                        DropdownMenuItem<String>(
                          value: "cr",
                          child: Text("Cairo",
                              style: TextStyle(
                                  color:   AppColors.blackColor
                              )
                          ),
                        ), DropdownMenuItem<String>(
                          value: "ax",
                          child: Text("Alex",
                              style: TextStyle(
                                  color:   AppColors.blackColor
                              )
                          ),
                        ),
                      ],
                      onChanged: (selectedValue) {
                        setState(() {
                          selectedcity = selectedValue!;
                        });
                      },
                    ),
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
                          "sign up",
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
                      "Already have an account",
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
                            .pushReplacementNamed(LoginScreen.routeName);
                      },
                      child: Text(
                        "Sign in",
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
