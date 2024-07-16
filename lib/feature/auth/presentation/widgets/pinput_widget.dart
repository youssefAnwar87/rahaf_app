import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinputWidget extends StatelessWidget {
  const PinputWidget({super.key, required this.controller, this.isError});

  final TextEditingController controller;
  final bool? isError;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      autofocus: false,
      onCompleted: (value) {},
      controller: controller,
      preFilledWidget: Text(
        '0',
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).textTheme.displayMedium?.color),
      ),
      length: 4,
      defaultPinTheme: PinTheme(
        width: 70,
        height: 56,
        textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: isError != null && isError!
                ? Theme.of(context).textTheme.displaySmall?.color
                : Theme.of(context).textTheme.displayMedium?.color),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 70,
        height: 56,
        textStyle: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).textTheme.displayMedium?.color),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
