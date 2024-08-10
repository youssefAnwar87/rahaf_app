import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/core/theme/custom_text_styles.dart';
import 'package:rahaf/feature/home/presentation/widgets/app_bar_home.dart';
import 'package:rahaf/feature/home/presentation/widgets/title_home.dart';
import 'package:rahaf/feature/home/presentation/widgets/trips_type_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  const AppBarHome(),
                  const SizedBox(
                    height: 24,
                  ),
                  const TitleHome(),
                  Text(
                    'Trips Types',
                    style: CustomTextStyles.itimRegular20.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge?.color),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: TripsTypeListView(),
            )
          ],
        ),
      ),
    );
  }
}

