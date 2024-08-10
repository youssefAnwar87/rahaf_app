import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rahaf/core/theme/app_colors.dart';
import 'package:rahaf/core/theme/custom_text_styles.dart';
import 'package:rahaf/feature/trips/presentation/views_model/destinations/destenations_cubit.dart';

class DestinationsScreen extends StatelessWidget {
  const DestinationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = DestenationsCubit.get(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "Destinations",
          style: CustomTextStyles.itimRegular18
              .copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),
        ),
        leading: IconButton(
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.lightGreyColor,
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Theme.of(context).dividerColor,
            ),
          ),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Destinations",
                  style: CustomTextStyles.itimRegular20.copyWith(
                      color: Theme.of(context).textTheme.bodyLarge?.color),
                ),
                SizedBox(
                  height: 30.h,
                ),
                GridView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(cubit.images[index])),
                        Text(
                          cubit.titles[index],
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.itimRegular32.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.color),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
