import 'package:flutter/material.dart';
import 'package:rahaf/feature/trips/data/models/hotel_profile_model.dart';
import 'package:rahaf/feature/trips/presentation/views_model/destinations/destenations_cubit.dart';
import 'package:rahaf/feature/trips/presentation/widgets/hotel_image_carousel.dart';
import 'package:rahaf/feature/trips/presentation/widgets/hotel_profile_bottom_sheet.dart';

class HotelProfileScreen extends StatelessWidget {
  const HotelProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = DestenationsCubit.get(context);
    HotelProfileModel profileModel = cubit.hotelProfileModel!;
    cubit.startAutoPlay(profileModel.data?.images?.length ?? 0);

    return Scaffold(
      body: Stack(
        children: [
          HotelImageCarousel(
            cubit: cubit,
            profileModel: profileModel,
          ),
          HotelProfileBottomSheet(
            profileModel: profileModel,
            scrollController: cubit.pageController,
          ),
        ],
      ),
    );
  }
}
