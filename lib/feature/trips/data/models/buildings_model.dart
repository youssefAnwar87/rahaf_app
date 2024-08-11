import 'package:rahaf/core/shared/usecases/server_config.dart';

class BuildingsModel {
  int? results;
  PaginationResult? paginationResult;
  List<HotelsData>? data;

  BuildingsModel({this.results, this.paginationResult, this.data});

  BuildingsModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    paginationResult = json['paginationResult'] != null
        ? PaginationResult.fromJson(json['paginationResult'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(HotelsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results;
    if (paginationResult != null) {
      data['paginationResult'] = paginationResult!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaginationResult {
  int? currentPage;
  int? limit;
  int? numberOfPages;

  PaginationResult({this.currentPage, this.limit, this.numberOfPages});

  PaginationResult.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    numberOfPages = json['numberOfPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['limit'] = limit;
    data['numberOfPages'] = numberOfPages;
    return data;
  }
}

class HotelsData {
  String? sId;
  String? name;
  int? ratingsQuantity;
  String? imageCover;
  double? ratingsAverage;
  String? id;

  HotelsData(
      {this.sId,
      this.name,
      this.ratingsQuantity,
      this.imageCover,
      this.ratingsAverage,
      this.id});

  HotelsData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    ratingsQuantity = json['ratingsQuantity'];
    imageCover = json['imageCover'];
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
    if (imageCover != null) {
      imageCover =
          imageCover!.replaceAll(RegExp(r'localhost'), ServerConfig.localhost);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['ratingsQuantity'] = ratingsQuantity;
    data['imageCover'] = imageCover;
    data['ratingsAverage'] = ratingsAverage;
    data['id'] = id;
    return data;
  }
}
