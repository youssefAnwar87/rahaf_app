import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:rahaf/core/theme/app_colors.dart';

class PinputWidget extends StatelessWidget {
  const PinputWidget({super.key, required this.controller, this.isError});

  final TextEditingController controller;
  final bool? isError;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      autofocus: false,
      onCompleted: (value) {},
      controller: controller,
      preFilledWidget: Text(
        '0',
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: AppColors.darkBlueColor),
      ),
      length: 4,
      defaultPinTheme: PinTheme(
        width: 70,
        height: 56,
        textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: isError != null && isError!
                ? AppColors.redColor
                : AppColors.darkBlueColor),
        decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 70,
        height: 56,
        textStyle: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: AppColors.darkBlueColor),
        decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
