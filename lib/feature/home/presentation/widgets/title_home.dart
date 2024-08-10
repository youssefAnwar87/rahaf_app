
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rahaf/core/theme/app_assets.dart';
import 'package:rahaf/core/theme/custom_text_styles.dart';

class TitleHome extends StatelessWidget {
  const TitleHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Explore the",
          style: CustomTextStyles.itimRegular38.copyWith(
              color:
                  Theme.of(context).textTheme.bodyLarge?.color),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Beautiful",
              style: CustomTextStyles.itimRegular38.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.color),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              children: [
                Text(
                  "world!",
                  style: CustomTextStyles.itimRegular38.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.color),
                ),
                SvgPicture.asset(AppAssets.underline)
              ],
            ),
          ],
        ),
        SizedBox(
          height: 28.h,
        ),
      ],
    );
  }
}