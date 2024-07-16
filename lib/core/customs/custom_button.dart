import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/core/theme/custom_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.textInButton, required this.onPressed});

  final String textInButton;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.r)))),
        child: SizedBox(
          height: 56.h,
          width: 335.w,
          child: Center(
            child: Text(
              textInButton,
              style: CustomTextStyles.itimRegular16.copyWith(
                color: Theme.of(context).textTheme.displayLarge?.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
