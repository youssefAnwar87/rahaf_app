import 'package:flutter/material.dart';
import 'package:rahaf/core/theme/app_colors.dart';
import 'package:rahaf/core/theme/custom_text_styles.dart';

class HotelProfileAppBar extends StatelessWidget {
  const HotelProfileAppBar({
    Key? key,
    required this.title,
    required this.onBackButtonPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.darkBlueColor,
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
          ),
          onPressed: onBackButtonPressed,
        ),
        Text(
          title,
          style: CustomTextStyles.itimRegular18.copyWith(
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(
          width: 48,
        ),
      ],
    );
  }
}
