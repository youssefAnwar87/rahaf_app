import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/core/theme/custom_text_styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {super.key, required this.headerName, required this.headerLine});
  final String headerName;
  final String headerLine;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 120.h, bottom: 12.h),
          child: Text(
            headerName,
            style: CustomTextStyles.itimRegular26.copyWith(
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 50.w,
            right: 50.w,
            bottom: 50.h,
          ),
          child: Center(
            child: Text(
              headerLine,
              textAlign: TextAlign.center,
              style: CustomTextStyles.itimRegular16.copyWith(                  color: Theme.of(context).textTheme.bodySmall?.color,
)
            ),
          ),
        ),
      ],
    );
  }
}
