import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  String textInButton;

    CustomButton({required this.formKey,required this.textInButton });

  @override
  Widget build(BuildContext context) {
    return               Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
    child: ElevatedButton(
    onPressed: () {
    if (formKey.currentState?.validate() == true) {}
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
      textInButton,
  style: TextStyle(
  fontFamily: 'Itim',
  color: Colors.white,
  fontSize: 16.sp,
  fontWeight: FontWeight.normal),
  ),
  ),
  ),
  ),
  );
  }
}