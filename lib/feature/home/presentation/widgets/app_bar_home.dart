import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rahaf/core/theme/app_assets.dart';
import 'package:rahaf/core/theme/app_colors.dart';
import 'package:rahaf/core/theme/custom_text_styles.dart';



class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            shape: BoxShape.rectangle,
            color: AppColors.lightGreyColor,
          ),
          padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 10),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.peachColor,
                backgroundImage: AssetImage(
                  AppAssets.profile,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'Leonardo',
                style: CustomTextStyles.sFUIDisplayMedium18.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).textTheme.bodyLarge?.color),
              )
            ],
          ),
        ),
        CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.lightGreyColor,
            child: SvgPicture.asset(AppAssets.notification))
      ],
    );
  }
}