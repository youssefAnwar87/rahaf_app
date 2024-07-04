// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class TextFieldItem extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool isObsecure;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const TextFieldItem({
    Key? key,
    required this.hintText,
    this.suffixIcon,
    this.isObsecure = false,
    this.keyboardType,
    this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 20.h),
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 220, 220, 220),
              filled: true,
              errorStyle: TextStyle(fontSize: 15.sp),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(
                      width: 3,
                      color: Colors.red
                  )
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(
                      width: 3,
                      color: Colors.red
                  )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide.none),
              // errorBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(14.r),
              // ),
              labelText: hintText,
              labelStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: const Color.fromARGB(255, 100, 100, 100)),
              suffixIcon: suffixIcon,
            ),
            style: TextStyle(color: Colors.black, fontSize: 16.sp),
            validator: validator,
            controller: controller,
            obscureText: isObsecure,
            keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }
}
