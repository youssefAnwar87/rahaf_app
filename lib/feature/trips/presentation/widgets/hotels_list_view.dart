import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/core/theme/custom_text_styles.dart';
import 'package:rahaf/feature/trips/presentation/views_model/destinations/destenations_cubit.dart';
import 'package:rahaf/feature/trips/presentation/widgets/rating_stars_widget.dart';

class HotelsListView extends StatelessWidget {
  const HotelsListView({
    super.key,
    required this.cubit,
  });

  final DestenationsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              DestenationsCubit.get(context)
                  .getBuildingById(cubit.hotels?[index].id ?? "");
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    SizedBox(
                      width:
                          95.w, // Specify a width to give bounded constraints
                      height:
                          116.h, // Specify a height to give bounded constraints
                      child: AspectRatio(
                          aspectRatio: 95 / 116,
                          child: CachedNetworkImage(
                            imageUrl: cubit.hotels?[index].imageCover ?? "",
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cubit.hotels?[index].name ?? "",
                          style: CustomTextStyles.itimRegular16.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.calendar_month_outlined),
                            SizedBox(width: 5.w),
                            Text(
                              "16 July - 28 July",
                              style: CustomTextStyles.sFUIDisplayRegular13
                                  .copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.color),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            RatingStarsWidget(
                              value: cubit.hotels?[index].ratingsAverage ?? 0,
                            ),
                            SizedBox(width: 5.w),
                            Text("${cubit.hotels?[index].ratingsAverage ?? 0}",
                                style: CustomTextStyles.itimRegular18.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color)),
                          ],
                        ),
                        Text(
                          'Reviewed by ${cubit.hotels?[index].ratingsQuantity ?? 0} People',
                          style: CustomTextStyles.itimRegular14.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: cubit.hotels?.length ?? 0,
      ),
    );
  }
}
