import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/core/theme/app_assets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            icon:  Image.asset(
      AppAssets.edit,
        width: 24.w,  // Adjust the size as needed
        height: 24.h, // Adjust the size as needed
        color: Colors.blue, // Apply color if you need to tint the icon
      ),
            onPressed: () {
              // Edit action
            },
          ),
        ],
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 30.h , bottom: 35.h),
            child: Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      AppAssets.profile,
                    )
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Leonardo",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "+20 10 12345678",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ProfileMenuItem(
                  iconAssetPath: AppAssets.person,
                  text: "Edit Profile",
                  onTap: () {
                    // Edit Profile action
                  },
                ),
                ProfileMenuItem(
                  iconAssetPath: AppAssets.bookmark,
                  text: "Bookmarked",
                  onTap: () {
                    // Bookmarked action
                  },
                ),
                ProfileMenuItem(
                  iconAssetPath: AppAssets.plane_Trip_International,
                  text: "Booked Trips",
                  onTap: () {
                    // Booked Trips action
                  },
                ),
                ProfileMenuItem(
                  iconAssetPath: AppAssets.settings,
                  text: "Settings",
                  onTap: () {
                    // Settings action
                  },
                ),
                ProfileMenuItem(
                  iconAssetPath: AppAssets.headphones_fill_duotone_line,
                  text: "Help center",
                  onTap: () {
                    // Help center action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final String iconAssetPath;
  final String text;
  final VoidCallback onTap;

  const ProfileMenuItem({
    required this.iconAssetPath,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13.75.h), // Adding vertical padding
      child: ListTile(
        leading: Image.asset(
          iconAssetPath,
          width: 24,  // Adjust the size as needed
          height: 24, // Adjust the size as needed
        ),
        title: Text(text, style: TextStyle(fontSize: 16)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
