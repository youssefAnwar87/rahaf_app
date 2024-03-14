import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class OTPver extends StatelessWidget {
  static const String routeName = "otp screen";

  const OTPver({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> myList = List.generate(4, (index) => '');
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: Text("Forget Password"),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left, // Change this to the desired icon
            color: AppColors.blackColor, // Change this to the desired color
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 62.h, right: 96.w, left: 96.w, bottom: 12.h),
                child: Text(
                  "OTP Verification",
                  style: TextStyle(
                      fontFamily: 'Itim',
                      color: Colors.black,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w,right: 15.w,bottom: 35.h),
                child: Text(
                  textAlign: TextAlign.center,
                  "Please check your email www.uihut@gmail.com to see the verification code",
                  style: TextStyle(
                      fontFamily: 'Itim',
                      color: AppColors.greyColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal),
                ),
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
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 16.h,bottom : 40.h, left: 10.w,right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.greyColor

                      ),
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        onChanged: (value){
                          if(value.length ==1){
                            myList[0] = value;
                            print(myList);
                            FocusScope.of(context).nextFocus();
                          }
                          },
                        decoration: InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(
                            color: Colors.white
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.r),
                              borderSide: BorderSide.none),
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(
                            fontFamily: 'Itim',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.greyColor

                      ),
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        onChanged: (value){
                          if(value.length ==1){
                            myList[1] = value;
                            print(myList);
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(
                              color: Colors.white
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.r),
                              borderSide: BorderSide.none),
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(
                            fontFamily: 'Itim',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.greyColor

                      ),
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        onChanged: (value){
                          if(value.length ==1){
                            myList[2] = value;
                            print(myList);
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(
                              color: Colors.white
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.r),
                              borderSide: BorderSide.none),
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(
                            fontFamily: 'Itim',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.greyColor

                      ),
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        onChanged: (value){
                          if(value.length ==1){
                            myList[3] = value;
                            print(myList);
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(
                              color: Colors.white
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.r),
                              borderSide: BorderSide.none),
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(
                            fontFamily: 'Itim',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    ),



                  ],
                ),
              ),
              Padding(
                 padding: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 16.h),
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blueColor,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(16.r)))),
                  child: Container(
                    height: 56.h,
                    width: 335.w,
                    child: Center(
                      child: Text(
                        "Verfiy",
                        style: TextStyle(
                            fontFamily: 'Itim',
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "Resend code to",
                      style: TextStyle(
                          fontFamily: 'Itim',
                          color: AppColors.greyColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "01:26",
                      style: TextStyle(
                          fontFamily: 'Itim',
                          color: AppColors.greyColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
