class UserModel {
  Data? data;
  String? token;
  List<Errors>? errors;


  UserModel({this.data, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    token = json['token'];
     if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors!.add( Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = token;
     if (errors != null) {
      data['errors'] = errors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? firstName;
  String? lastName;
  String? phone;
  String? password;
  String? role;
  bool? active;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.firstName,
      this.lastName,
      this.phone,
      this.password,
      this.role,
      this.active,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    password = json['password'];
    role = json['role'];
    active = json['active'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['password'] = password;
    data['role'] = role;
    data['active'] = active;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}


class Errors {
  String? type;
  String? value;
  String? msg;
  String? path;
  String? location;

  Errors({this.type, this.value, this.msg, this.path, this.location});

  Errors.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    msg = json['msg'];
    path = json['path'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['value'] = value;
    data['msg'] = msg;
    data['path'] = path;
    data['location'] = location;
    return data;
  }
}