// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.token,
        this.message,
        this.userId,
    });

    String? token;
    String? message;
    int? userId;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        message: json["message"]??"No data",
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "message": message,
        "user_id": userId,
    };
}



// To parse this JSON data, do
//
//     final loginErrorModel = loginErrorModelFromJson(jsonString);


LoginErrorModel loginErrorModelFromJson(String str) => LoginErrorModel.fromJson(json.decode(str));

String loginErrorModelToJson(LoginErrorModel data) => json.encode(data.toJson());

class LoginErrorModel {
    LoginErrorModel({
        this.message,
    });

    String? message;

    factory LoginErrorModel.fromJson(Map<String, dynamic> json) => LoginErrorModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
