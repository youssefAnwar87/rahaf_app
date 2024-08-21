import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rahaf/core/customs/text_field_item.dart';
import 'package:rahaf/core/theme/app_assets.dart';
import 'package:rahaf/core/theme/custom_text_styles.dart';

class EditProfileScreen extends StatelessWidget {
  static String routeName = "EditProfileScreen";

  final TextEditingController firstNameController = TextEditingController(text: 'Leonardo');
  final TextEditingController lastNameController = TextEditingController(text: 'Ahmed');
  final TextEditingController locationController = TextEditingController(text: 'Sylhet Bangladesh');
  final TextEditingController mobileNumberController = TextEditingController(text: '+88 01758-000666');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print("Back button pressed");
              context.pop();
            },
          ),
        ],
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  AppAssets.profile,
                )
            ),

            SizedBox(height: 8),
            Text(
              'Leonardo',
            style: CustomTextStyles.itimRegular16.copyWith(color: Colors.black,fontSize: 22,
            )

      ),
            TextButton(
              onPressed: () {
                // Add the change profile picture functionality here
              },
              child: Text(
                'Change Profile Picture',
                style: CustomTextStyles.itimRegular16.copyWith(color: Colors.blue,fontSize: 18),
              ),
            ),
            SizedBox(height: 16),
            TextFieldItem(
              hintText: 'First Name',
              suffixIcon: Icon(Icons.check, color: Colors.blue),
              controller: firstNameController,
            ),
            TextFieldItem(
              hintText: 'Last Name',
              suffixIcon: Icon(Icons.check, color: Colors.blue),
              controller: lastNameController,
            ),
            TextFieldItem(
              hintText: 'Location',
              suffixIcon: Icon(Icons.check, color: Colors.blue),
              controller: locationController,
            ),
            TextFieldItem(
              hintText: 'Mobile Number',
              suffixIcon: Icon(Icons.check, color: Colors.blue),
              controller: mobileNumberController,
            ),
          ],
        ),
      ),
    );
  }
}
