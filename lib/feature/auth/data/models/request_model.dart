import 'package:dio/dio.dart';

class RequestModel {
  String? firstName;
  String? lastName;
  String? profileImg;
  String? phone;
  String? password;

  RequestModel({
    this.firstName,
    this.lastName,
    this.profileImg,
    this.phone,
    this.password,
  });

  Future<FormData> toFormData() async {
    final Map<String, dynamic> data = {};

    if (firstName != null) {
      data['firstName'] = firstName;
    }
    if (lastName != null) {
      data['lastName'] = lastName;
    }
    if (profileImg != null) {
      data['profileImg'] = await MultipartFile.fromFile(profileImg!, filename: 'profile.jpg');
    }
    if (phone != null) {
      data['phone'] = phone;
    }
    if (password != null) {
      data['password'] = password;
    }

    return FormData.fromMap(data);
  }

  // Create a UserModel from a Map. The keys must correspond to the names of the fields.
  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      profileImg: json['profileImg'],
      phone: json['phone'],
      password: json['password'],
    );
  }
}
