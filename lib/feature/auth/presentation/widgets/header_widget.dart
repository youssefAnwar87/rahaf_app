import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/core/utils/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  
  const HeaderWidget({super.key, required this.headerName , required this.headerLine});
 final String headerName;
  final String headerLine;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: 120.h , bottom: 12.h),
          child: Text(
            headerName,
            style: TextStyle(
                fontFamily: 'Itim',
                color: Colors.black,
                fontSize: 23.sp,
                fontWeight: FontWeight.normal),
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
              style: TextStyle(
                  fontFamily: 'Itim',
                  color: AppColors.greyColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal
              ),
            ),
          ),
        ),
      ],
    );
  }
}
