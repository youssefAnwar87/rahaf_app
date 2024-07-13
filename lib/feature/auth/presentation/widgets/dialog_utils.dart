import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rahaf/core/routes/routes_names.dart';
import 'package:rahaf/core/theme/app_assets.dart';
import 'package:rahaf/core/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
                    style: TextStyle(color: Theme.of(context).textTheme.displayLarge?.color)),
              CircularProgressIndicator(color:Theme.of(context).colorScheme.surfaceContainer),
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
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: IntrinsicHeight(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 20.r,
                        child: ImageIcon(
                         const AssetImage(AppAssets.forgetPassword),
                          size: 45,
                          color: Theme.of(context).colorScheme.surfaceContainer ,
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
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    AppLocalizations.of(context)!.we_have_sent_password_recovery_instruction_to_your_phone_number,
                    style: TextStyle(
                        fontFamily: 'Itim',
                        color: Theme.of(context).textTheme.bodySmall?.color,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(RoutesNames.otp);
                  },
                  child: Text("Ok",
                      style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color)))
            ],
          );
        });
  }
}
