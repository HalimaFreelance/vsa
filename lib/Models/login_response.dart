// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.status,
    this.errNum,
    this.msg,
    this.user,
  });

  bool status;
  String errNum;
  String msg;
  User user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
        "user": user.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.emailVerified,
    this.block,
    this.createdAt,
    this.updatedAt,
    this.accessToken,
  });

  int id;
  String name;
  String email;
  String mobile;
  String emailVerified;
  String block;
  dynamic createdAt;
  DateTime updatedAt;
  String accessToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        emailVerified: json["email_verified"],
        block: json["block"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "email_verified": emailVerified,
        "block": block,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
        "access_token": accessToken,
      };
}
