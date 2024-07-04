import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/core/theme/app_colors.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({super.key});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {

    var selectedcity ="gz";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: const Color.fromARGB(255, 220, 220, 220),
          border: Border.all(width: 2, color: AppColors.whiteColor),
        ),
        child: DropdownButton<String>(
          icon: const Icon(Icons.keyboard_arrow_down), // Customize the icon here

          padding: const EdgeInsets.all(5),
          isExpanded: true,
          value: selectedcity,
          items: const [
            DropdownMenuItem<String>(
              value: "gz",
              child: Text(
                "Giza",
                style: TextStyle(color: AppColors.blackColor),
              ),
            ),
            DropdownMenuItem<String>(
              value: "cr",
              child:
                  Text("Cairo", style: TextStyle(color: AppColors.blackColor)),
            ),
            DropdownMenuItem<String>(
              value: "ax",
              child:
                  Text("Alex", style: TextStyle(color: AppColors.blackColor)),
            ),
          ],
          onChanged: (selectedValue) {
            setState(() {
              selectedcity = selectedValue!;
            });
          },
        ),
      ),
    );
  }
}
