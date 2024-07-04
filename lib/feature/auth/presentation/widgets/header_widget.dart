import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/core/utils/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  String headerName;
  String headerLine;
   HeaderWidget({required this.headerName , required this.headerLine});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 120.h, right: 120.w, left: 120.w, bottom: 12.h),
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
      ),
    );
  }
}
