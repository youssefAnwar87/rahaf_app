import 'package:rahaf/core/shared/usecases/server_config.dart';

class HotelProfileModel {
  Data? data;

  HotelProfileModel({this.data});

  HotelProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? type;
  String? description;
  int? ratingsQuantity;
  String? location;
  String? imageCover;
  List<String>? images;
  String? createdAt;
  String? updatedAt;
  int? iV;
  double? ratingsAverage;
  List<Reviews>? reviews;
  String? id;

  Data(
      {this.sId,
      this.name,
      this.type,
      this.description,
      this.ratingsQuantity,
      this.location,
      this.imageCover,
      this.images,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.ratingsAverage,
      this.reviews,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    description = json['description'];
    ratingsQuantity = json['ratingsQuantity'];
    location = json['location'];
    imageCover = json['imageCover'];
    if (imageCover != null) {
      imageCover =
          imageCover!.replaceAll(RegExp(r'localhost'), ServerConfig.localhost);
    }
   images = (json['images'] as List<dynamic>?)?.map((image) {
  return (image as String).replaceAll(RegExp(r'localhost'), ServerConfig.localhost);
}).toList();

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    ratingsAverage = json['ratingsAverage'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['type'] = type;
    data['description'] = description;
    data['ratingsQuantity'] = ratingsQuantity;
    data['location'] = location;
    data['imageCover'] = imageCover;
    data['images'] = images;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['ratingsAverage'] = ratingsAverage;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    return data;
  }
}

class Reviews {
  String? sId;
  String? title;
  num? ratings;
  User? user;
  String? building;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Reviews(
      {this.sId,
      this.title,
      this.ratings,
      this.user,
      this.building,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Reviews.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    ratings = json['ratings'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    building = json['building'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['ratings'] = ratings;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['building'] = building;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? profileImg;

  User({this.sId, this.firstName, this.profileImg});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    profileImg = json['profileImg'];
    if (profileImg != null) {
      profileImg =
          profileImg!.replaceAll(RegExp(r'localhost'), ServerConfig.localhost);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['profileImg'] = profileImg;
    
    return data;
  }
}
