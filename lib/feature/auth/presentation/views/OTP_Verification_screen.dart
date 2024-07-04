import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rahaf/core/customs/custom_button.dart';
import 'package:rahaf/feature/auth/presentation/cubit/otp_cubit.dart';
import 'package:rahaf/feature/auth/presentation/widgets/header_widget.dart';
import 'package:rahaf/feature/auth/presentation/widgets/pinput_widget.dart';

import '../../../../core/theme/app_colors.dart';

class OTPVerificationScreen extends StatelessWidget {

  OTPVerificationScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OTPCubit()..startTimer(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          title: const Text("Forget Password"),
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: AppColors.blackColor,
            ),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeaderWidget(
                  headerName: "OTP Verification",
                  headerLine:
                      "Please check your email www.uihut@gmail.com to see the verification code",
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    "OTP Code",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Itim',
                      color: AppColors.blackColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 40.w, top: 16.w),
                  child: PinputWidget(controller: _controller),
                ),
                CustomButton(onPressed: () {}, textInButton: "Verify"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: BlocBuilder<OTPCubit, int>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: state == 0
                                ? () {
                                    context.read<OTPCubit>().resetTimer();
                                    // Add your resend logic here
                                  }
                                : null,
                            child: Text(
                              textAlign: TextAlign.center,
                              "Resend code to",
                              style: TextStyle(
                                fontFamily: 'Itim',
                                color: state == 0
                                    ? AppColors.blueColor
                                    : AppColors.greyColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            formatTime(state),
                            style: TextStyle(
                              fontFamily: 'Itim',
                              color: AppColors.greyColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
