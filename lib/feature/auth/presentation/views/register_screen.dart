import 'package:flutter/material.dart';
import 'package:rahaf/feature/auth/presentation/views/login_screen.dart';
import 'package:rahaf/core/customs/custom_button.dart';
import 'package:rahaf/feature/auth/presentation/widgets/dropdown_widget.dart';
import 'package:rahaf/feature/auth/presentation/widgets/footer_widget.dart';
import 'package:rahaf/feature/auth/presentation/widgets/header_widget.dart';

import '../../../../core/customs/text_field_item.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register screen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var firstNameController = TextEditingController();
  var secondNameController = TextEditingController();
  var phoneNumController = TextEditingController();
  var passwordController = TextEditingController();
  bool isObsecure = true;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                const HeaderWidget(headerName: "Sign up now", headerLine:"Please fill the details and create account " ),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldItem(hintText: "First name",
                          controller: firstNameController,
                        validator: (value){
                          if(value == null || value.trim().isEmpty){
                            return "invalid name";
                          }
                          bool namevalid = RegExp(r"^[a-zA-Z]+$").hasMatch(value);
                          if(!namevalid){
                            return "invalid name";
                          }
                          return null;
                        },

                      ),
                    ),
                    Expanded(
                      child: TextFieldItem(hintText: "Second name",
                          validator: (value){
                            if(value == null || value.trim().isEmpty){
                              return "invalid name";
                            }
                            bool namevalid = RegExp(r"^[a-zA-Z]+$").hasMatch(value);
                            if(!namevalid){
                              return "invalid name";
                            }
                            return null;
                          },

                          controller: secondNameController),
                    ),
                  ],
                ),
                TextFieldItem(
                  hintText: "phone",
                  controller: phoneNumController,
                  keyboardType: null,
                  validator: (value){
                    if(value == null || value.trim().isEmpty){
                      return "please enter your mobile number";
                    }
                    if(value.length!=11){
                      return "The phone number should be at least 11 number";
                    }
                    return null;
                  },
                  suffixIcon: const Icon(Icons.phone_android),
                ),
                TextFieldItem(
                  hintText: "password",
                  controller: passwordController,
                  isObsecure: isObsecure,
                  validator: (value){
                    if(value == null || value.trim().isEmpty){
                      return "please enter your password";
                    }
                    if(value.trim().length < 6 || value.trim().length > 30){
                      return "password should be >6 & <30";
                    }
                    return null;
                  },
                  suffixIcon: InkWell(
                      child: isObsecure
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility, color: Color(0xff7D848D)),
                      onTap: () {
                        if (isObsecure) {
                          isObsecure = false;
                        } else {
                          isObsecure = true;
                        }
                        setState(() {});
                      }),
                ),
                const DropdownWidget(),
                CustomButton(onPressed: () {
                  
                },textInButton: "Sign up",),
                const FooterWidget(footerLine:"Already have an account?",
                    footerNavigationTextButton: "Sign in",
                    nextScreen: LoginScreen.routeName,)
              ],
            ),
          ),
        ),
      ),
    );

  }
}
