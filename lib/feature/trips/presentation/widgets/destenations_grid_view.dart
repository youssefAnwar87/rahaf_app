
import 'package:flutter/material.dart';
import 'package:rahaf/core/theme/custom_text_styles.dart';
import 'package:rahaf/feature/trips/presentation/views_model/destinations/destenations_cubit.dart';

class DestinationsGridView extends StatelessWidget {
  const DestinationsGridView({
    super.key, required this.titles, required this.images,
  });

  final List<String> titles;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: titles.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            DestenationsCubit.get(context).getAllBuilding(index);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    )),
                Text(
                  titles[index],
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.itimRegular32.copyWith(
                      color: Theme.of(context).textTheme.displayLarge?.color),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
