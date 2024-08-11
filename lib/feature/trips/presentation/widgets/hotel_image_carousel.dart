import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rahaf/feature/trips/data/models/hotel_profile_model.dart';
import 'package:rahaf/feature/trips/presentation/views_model/destinations/destenations_cubit.dart';
import 'package:rahaf/feature/trips/presentation/widgets/hotel_profile_app_bar.dart';

class HotelImageCarousel extends StatelessWidget {
  const HotelImageCarousel({
    Key? key,
    required this.cubit,
    required this.profileModel,
  }) : super(key: key);

  final DestenationsCubit cubit;
  final HotelProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(
        children: [
          PageView.builder(
            controller: cubit.pageController,
            itemCount: profileModel.data?.images?.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: profileModel.data?.images?[index] ?? "",
                fit: BoxFit.cover,
              );
            },
          ),
          Positioned(
            top: 32,
            right: 16,
            left: 16,
            child: HotelProfileAppBar(
              title: profileModel.data?.name ?? "",
              onBackButtonPressed: () {
                cubit.disposeAll();
                GoRouter.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}