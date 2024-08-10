import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rahaf/core/routes/routes_names.dart';
import 'package:rahaf/core/theme/app_assets.dart';
import 'package:rahaf/core/theme/custom_text_styles.dart';

class TripsTypeListView extends StatelessWidget {
  const TripsTypeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 286,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 2,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 20.w,
          );
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index == 0) {
                GoRouter.of(context).push(RoutesNames.destinations);
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                    aspectRatio: 240 / 286,
                    child: Image.asset(
                        index == 0 ? AppAssets.longTrips : AppAssets.dayYouth)),
                Text(
                  index == 0 ? 'Long Trips' : 'Day Youth',
                  style: CustomTextStyles.itimRegular32.copyWith(
                      color: Theme.of(context).textTheme.displayLarge?.color),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
