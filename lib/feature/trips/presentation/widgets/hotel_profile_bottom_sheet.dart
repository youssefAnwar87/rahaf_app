
import 'package:flutter/material.dart';

import 'package:rahaf/feature/trips/data/models/hotel_profile_model.dart';
import 'package:rahaf/feature/trips/presentation/widgets/hotel_profile_details_section.dart';
import 'package:rahaf/feature/trips/presentation/widgets/hotel_profile_reviews_section.dart';
class HotelProfileBottomSheet extends StatelessWidget {
  const HotelProfileBottomSheet({
    Key? key,
    required this.profileModel,
    required this.scrollController,
  }) : super(key: key);

  final HotelProfileModel profileModel;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.6,
      maxChildSize: 0.95,
      builder: (BuildContext context, ScrollController scrollController) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          child: Container(
            color: Colors.white,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                HotelProfileDetailsSection(profileModel: profileModel),
                HotelProfileReviewsSection(profileModel: profileModel),
              ],
            ),
          ),
        );
      },
    );
  }
}
