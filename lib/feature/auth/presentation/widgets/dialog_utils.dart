import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/feature/auth/presentation/views/OTP_Verification_screen.dart';
import 'package:rahaf/core/utils/app_assets.dart';
import 'package:rahaf/core/utils/app_colors.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String message) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Theme.of(context).primaryColor,
            content: Row(
              children: [
                Text(message, style: TextStyle(color: AppColors.whiteColor)),
                Spacer(),
                CircularProgressIndicator(color: AppColors.whiteColor),
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void ShowDialog(BuildContext context, String title) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(24.r), // Adjust the border radius here
            ),
            backgroundColor: AppColors.whiteColor,
            content: Container(
              height: 110.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 20.r,
                        child: ImageIcon(
                          AssetImage(AppAssets.forgetPassword),
                          size: 45,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    title,
                    style: TextStyle(
                        fontFamily: 'Itim',
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.normal),
                  ),
                  Spacer(),
                  Text(
                    textAlign: TextAlign.center,
                    "We have send password recovery instruction to your phone number",
                    style: TextStyle(
                        fontFamily: 'Itim',
                        color: AppColors.greyColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, OTPVerificationScreen.routeName);
                  },
                  child:
                      Text("Ok", style: TextStyle(color: AppColors.blackColor)))
            ],
          );
        });
  }
}
