import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rahaf/core/routes/routes_names.dart';
import 'package:rahaf/core/theme/app_assets.dart';
import 'package:rahaf/core/theme/app_colors.dart';

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
                Text(message,
                    style: const TextStyle(color: AppColors.whiteColor)),
                const CircularProgressIndicator(color: AppColors.whiteColor),
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    GoRouter.of(context).pop();
  }

  static void kShowDialog(BuildContext context, String title) {
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
            content: IntrinsicHeight(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 20.r,
                        child: const ImageIcon(
                          AssetImage(AppAssets.forgetPassword),
                          size: 45,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
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
                    GoRouter.of(context).push(RoutesNames.otp);
                  },
                  child: const Text("Ok",
                      style: TextStyle(color: AppColors.blackColor)))
            ],
          );
        });
  }
}
