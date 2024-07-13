import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rahaf/core/customs/custom_button.dart';
import 'package:rahaf/feature/auth/presentation/cubit/otp_cubit.dart';
import 'package:rahaf/feature/auth/presentation/widgets/header_widget.dart';
import 'package:rahaf/feature/auth/presentation/widgets/pinput_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title:  Text(AppLocalizations.of(context)!.forget_password,),
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Theme.of(context).dividerColor,
            ),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
        ),
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 HeaderWidget(
                  headerName: AppLocalizations.of(context)!.otp_verification,
                  headerLine:
                  AppLocalizations.of(context)!.please_check_your_email_wwwuihutgmailcom_to_see_the_verification_code,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    AppLocalizations.of(context)!.otp_code,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Itim',
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 40.w, top: 16.w),
                  child: PinputWidget(controller: _controller),
                ),
                CustomButton(onPressed: () {

                }, textInButton: AppLocalizations.of(context)!.verify),
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
                              AppLocalizations.of(context)!.resend_code_to,
                              style: TextStyle(
                                fontFamily: 'Itim',
                                color: state == 0
                                    ? Theme.of(context).textTheme.bodyMedium?.color
                                    : Theme.of(context).textTheme.bodySmall?.color,
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
                              color: Theme.of(context).textTheme.bodySmall?.color,
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
