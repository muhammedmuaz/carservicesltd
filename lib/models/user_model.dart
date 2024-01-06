// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    final String status;
    final int id;
    final String nicename;
    final String url;
    final String displayname;
    final String firstname;
    final String lastname;
    final String nickname;
    final dynamic avatar;

    User({
        required this.status,
        required this.id,
        required this.nicename,
        required this.url,
        required this.displayname,
        required this.firstname,
        required this.lastname,
        required this.nickname,
        required this.avatar,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"],
        id: json["id"],
        nicename: json["nicename"],
        url: json["url"],
        displayname: json["displayname"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        nickname: json["nickname"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "id": id,
        "nicename": nicename,
        "url": url,
        "displayname": displayname,
        "firstname": firstname,
        "lastname": lastname,
        "nickname": nickname,
        "avatar": avatar,
    };
}
