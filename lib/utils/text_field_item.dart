import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldItem extends StatelessWidget {
  String hintText;
  Widget? suffixIcon;
  bool isObsecure;
  var keyboardType;
  String? Function(String?)? validator;
  TextEditingController controller;
  TextFieldItem({
    required this.hintText,
    this.suffixIcon,
    this.isObsecure = false,
    this.keyboardType,
    this.validator,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Padding(padding: EdgeInsets.only(
          left: 24.w,right: 24.w,bottom: 20.h),
          child: TextFormField(
            decoration:InputDecoration(
              fillColor:  Color(0xfff6f6f8),
              filled: true,
              focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
              suffixIcon: suffixIcon,
    ),
    style: TextStyle(color: Colors.black,fontSize: 16.sp),
    validator: validator,
    controller: controller,
    obscureText: isObsecure,
    keyboardType: keyboardType,
            ),
          ),

      ],
    );
  }
}
