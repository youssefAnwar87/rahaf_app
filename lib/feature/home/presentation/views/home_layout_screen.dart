import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/core/theme/app_colors.dart';
import 'package:rahaf/feature/home/presentation/views_model/home_layout/home_layout_cubit.dart';
import 'package:rahaf/feature/home/presentation/views_model/home_layout/home_layout_state.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeLayoutCubit.get(context);

        return Scaffold(
          body: cubit.screens[cubit.index],
          bottomNavigationBar: SizedBox(
            height: 70.h,
            child: BottomNavigationBar(
              showUnselectedLabels: false,
              showSelectedLabels: false,
              unselectedFontSize: 0,
              selectedFontSize: 0,
              unselectedItemColor: AppColors.greyColor,
              type: BottomNavigationBarType.shifting,
              items: [
                BottomNavigationBarItem(
                  icon: cubit.index == 0
                      ? const CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.blueColor,
                          child: Icon(Icons.search,
                              size: 30, color: AppColors.whiteColor),
                        )
                      : const Icon(
                          Icons.search,
                          size: 25,
                          color: AppColors.greyColor,
                        ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: cubit.index == 1
                      ? const CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.blueColor,
                          child: Icon(Icons.home,
                              size: 30, color: AppColors.whiteColor),
                        )
                      : const Icon(
                          Icons.home,
                          size: 25,
                          color: AppColors.greyColor,
                        ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: cubit.index == 2
                      ? const CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.blueColor,
                          child: Icon(Icons.person,
                              size: 30, color: AppColors.whiteColor),
                        )
                      : const Icon(
                          Icons.person,
                          size: 25,
                          color: AppColors.greyColor,
                        ),
                  label: 'Profile',
                ),
              ],
              onTap: (value) {
                cubit.changeIndex(value, context);
              },
              currentIndex: cubit.index,
            ),
          ),
        );
      },
    );
  }
}
