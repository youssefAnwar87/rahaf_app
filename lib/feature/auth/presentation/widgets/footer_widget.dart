import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rahaf/core/theme/app_colors.dart';

class FooterWidget extends StatelessWidget {
  final String footerLine;
  final String footerNavigationTextButton;
  final String nextScreen;
  const FooterWidget(
      {super.key,
      required this.footerLine,
      required this.footerNavigationTextButton,
      required this.nextScreen});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          footerLine,
          style: TextStyle(
              fontFamily: 'Itim',
              color: Theme.of(context).textTheme.bodySmall?.color,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal),
        ),
        SizedBox(
          width: 5.w,
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).pushReplacementNamed(nextScreen);
          },
          child: Text(
            footerNavigationTextButton,
            style: TextStyle(
                fontFamily: 'Itim',
                color: Theme.of(context).textTheme.displayMedium?.color,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal),
          ),
        )
      ],
    );
  }
}
