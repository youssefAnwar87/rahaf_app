import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:rahaf/core/theme/app_colors.dart';

class RatingStarsWidget extends StatelessWidget {
  const RatingStarsWidget({
    super.key,
    required this.value, this.startSize,
  });

  final num value;
  final double? startSize;

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      axis: Axis.horizontal,
      maxValueVisibility: false,
      valueLabelVisibility: false,
      value: value.toDouble(),
      starCount: 5,
      starSize: startSize ?? 20,
      starSpacing: 2,
      animationDuration: const Duration(milliseconds: 1000),
      valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
      starOffColor: AppColors.greyColor,
      starColor: AppColors.yellowColor,
    );
  }
}
