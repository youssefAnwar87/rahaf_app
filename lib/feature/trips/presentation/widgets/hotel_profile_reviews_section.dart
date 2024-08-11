import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rahaf/core/theme/app_colors.dart';
import 'package:rahaf/core/theme/custom_text_styles.dart';
import 'package:rahaf/feature/trips/data/models/hotel_profile_model.dart';
import 'package:rahaf/feature/trips/presentation/widgets/rating_stars_widget.dart';
class HotelProfileReviewsSection extends StatelessWidget {
  const HotelProfileReviewsSection({
    Key? key,
    required this.profileModel,
  }) : super(key: key);

  final HotelProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.coolGreyColor,
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.peachColor,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: profileModel
                                  .data
                                  ?.reviews?[index]
                                  .user
                                  ?.profileImg ??
                              "",
                          fit: BoxFit.cover,
                          width: 40.0,
                          height: 40.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                profileModel
                                        .data
                                        ?.reviews?[index]
                                        .user
                                        ?.firstName ??
                                    "",
                                style: CustomTextStyles.itimRegular16.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color),
                              ),
                              Row(
                                children: [
                                  RatingStarsWidget(
                                    value: profileModel
                                            .data
                                            ?.reviews?[index]
                                            .ratings ??
                                        0.0,
                                    startSize: 15,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                      "${profileModel.data?.reviews?[index].ratings}",
                                      style: CustomTextStyles.itimRegular18
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.color)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            profileModel.data?.reviews?[index].title ?? "",
                            style: CustomTextStyles.itimRegular14.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          childCount: profileModel.data?.reviews?.length ?? 0,
        ),
      ),
    );
  }
}
