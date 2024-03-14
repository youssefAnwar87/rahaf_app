import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/utils/app_colors.dart';
import 'package:rahaf/utils/dialog_utils.dart';
import 'package:rahaf/utils/text_field_item.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeName = "forgetPassword screen";


  @override
  Widget build(BuildContext context) {
    var forgetPasswordController = TextEditingController();
    var formKey = GlobalKey<FormState>();


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
      body: Form(
        key: formKey,
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 62.h, right: 96.w, left: 96.w, bottom: 12.h),
                  child: Text(
                    "Forget Password",
                    style: TextStyle(
                        fontFamily: 'Itim',
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 59.w, left: 59.w, bottom: 40.h),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Enter your phone number to reset  your password",
                    style: TextStyle(
                        fontFamily: 'Itim',
                        color: AppColors.greyColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                TextFieldItem(hintText: "Phone or E-mail",
                  controller: forgetPasswordController,
                  keyboardType: TextInputType.phone,
                  validator: (value){
                    if(value == null || value.trim().isEmpty){
                      return "please enter your mobile number";
                    }
                    if(value.length!=11){
                      return "The phone number should be at least 11 number";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: ElevatedButton(
                    onPressed: () {
                      // if(formKey.currentState?.validate() == true) {
                        DialogUtils.ShowDialog(context, "Check your messages");
                      // }
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
                          "Reset Password",
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


              ],
            ),
          ),
        ),
      ),
    );
  }
}
