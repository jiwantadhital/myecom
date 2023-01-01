class UserModel {
  bool? status;
  String? message;
  Data? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  int? isAdmin;
  String? password;
  String? phone;
  String? image;
  String? bio;
  String? dob;
  String? createdAt;

  Data(
      {this.id,
      this.name,
      this.email,
      this.isAdmin,
      this.password,
      this.phone,
      this.image,
      this.bio,
      this.dob,
      this.createdAt,
    });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    isAdmin = json['is_admin'];
    password = json['password'];
    phone = json['phone'];
    image = json['image'];
    bio = json['bio'];
    dob = json['dob'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['is_admin'] = this.isAdmin;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['bio'] = this.bio;
    data['dob'] = this.dob;
    data['created_at'] = this.createdAt;
    return data;
  }
}