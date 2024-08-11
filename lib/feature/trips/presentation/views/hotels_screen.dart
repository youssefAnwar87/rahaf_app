import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rahaf/core/theme/app_colors.dart';
import 'package:rahaf/core/theme/custom_text_styles.dart';
import 'package:rahaf/feature/trips/presentation/views_model/destinations/destenations_cubit.dart';
import 'package:rahaf/feature/trips/presentation/widgets/hotels_list_view.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "Hotels",
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
      body: BlocBuilder<DestenationsCubit, DestenationsState>(
        builder: (context, state) {
          var cubit = DestenationsCubit.get(context);

          return SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          "All Hotels in this Package",
                          style: CustomTextStyles.itimRegular20.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: HotelsListView(cubit: cubit),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
