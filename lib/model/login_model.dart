// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

// LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

// String loginModelToJson(LoginModel data) => json.encode(data.toJson());

// class LoginModel {
//     LoginModel({
//         this.token,
//         this.message,
//         this.userId,
//     });

//     String? token;
//     String? message;
//     int? userId;

//     factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//         token: json["token"],
//         message: json["message"]??"No data",
//         userId: json["user_id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "token": token,
//         "message": message,
//         "user_id": userId,
//     };
// }




LoginModel? loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel? data) => json.encode(data!.toJson());

class LoginModel {
    LoginModel({
        this.token,
        this.message,
        this.userId,
        this.userName,
    });

    String? token;
    String? message;
    int? userId;
    String? userName;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        message: json["message"],
        userId: json["user_id"],
        userName: json["user_name"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "message": message,
        "user_id": userId,
        "user_name": userName,
    };
}