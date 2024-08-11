import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rahaf/core/theme/app_assets.dart';
import 'package:rahaf/core/theme/custom_text_styles.dart';
import 'package:rahaf/feature/trips/data/models/hotel_profile_model.dart';
import 'package:rahaf/feature/trips/presentation/widgets/rating_stars_widget.dart';
class HotelProfileDetailsSection extends StatelessWidget {
  const HotelProfileDetailsSection({
    Key? key,
    required this.profileModel,
  }) : super(key: key);

  final HotelProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Center(child: SvgPicture.asset(AppAssets.topDivider)),
            SizedBox(height: 12.h),
            Text(
              profileModel.data?.description ?? "",
              style: CustomTextStyles.itimRegular14.copyWith(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  "Reviews",
                  style: CustomTextStyles.itimRegular20.copyWith(
                      color: Theme.of(context).textTheme.bodyLarge?.color),
                ),
                const Spacer(),
                Row(
                  children: [
                    RatingStarsWidget(
                      value: profileModel.data?.ratingsAverage ?? 0,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                        "${profileModel.data?.ratingsAverage}(${profileModel.data?.ratingsQuantity})",
                        style: CustomTextStyles.itimRegular18.copyWith(
                            color: Theme.of(context).textTheme.bodyLarge?.color)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
