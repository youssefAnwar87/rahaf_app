import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/core/utils/app_colors.dart';
import 'package:rahaf/core/customs/custom_button.dart';
import 'package:rahaf/core/customs/text_field_item.dart';
import 'package:rahaf/feature/auth/presentation/widgets/header_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = "forgetPassword screen";

  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var forgetPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: const Text("Forget Password"),
        leading: IconButton(
          icon: const Icon(
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
                const HeaderWidget(headerName: "Forget Password", headerLine: "Enter your phone number to reset  your password"),
                
                TextFieldItem(
                  hintText: "Phone or E-mail",
                  controller: forgetPasswordController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "please enter your mobile number";
                    }
                    if (value.length != 11) {
                      return "The phone number should be at least 11 number";
                    }
                    return null;
                  },
                ),
                CustomButton(formKey: formKey, textInButton:  "Reset Password"),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
