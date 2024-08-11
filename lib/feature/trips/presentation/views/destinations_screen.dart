import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rahaf/core/routes/routes_names.dart';
import 'package:rahaf/core/theme/app_colors.dart';
import 'package:rahaf/core/theme/custom_text_styles.dart';
import 'package:rahaf/feature/trips/presentation/views_model/destinations/destenations_cubit.dart';
import 'package:rahaf/feature/trips/presentation/widgets/destenations_grid_view.dart';

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
      body: BlocListener<DestenationsCubit, DestenationsState>(
        listener: (context, state) {
          if (state is HotelSuccessState) {
            GoRouter.of(context).pushNamed(RoutesNames.hotels);
          }
        },
        child: SafeArea(
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
                  DestinationsGridView(
                    images: cubit.images,
                    titles: cubit.titles,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
