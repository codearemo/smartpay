// To parse this JSON data, do
//
//     final signinModel = signinModelFromJson(jsonString);

import 'dart:convert';

SigninModel signinModelFromJson(String str) => SigninModel.fromJson(json.decode(str));

String signinModelToJson(SigninModel data) => json.encode(data.toJson());

class SigninModel {
    final bool? status;
    final String? message;
    final Data? data;
    final List<dynamic>? meta;
    final List<dynamic>? pagination;

    SigninModel({
        this.status,
        this.message,
        this.data,
        this.meta,
        this.pagination,
    });

    SigninModel copyWith({
        bool? status,
        String? message,
        Data? data,
        List<dynamic>? meta,
        List<dynamic>? pagination,
    }) => 
        SigninModel(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
            meta: meta ?? this.meta,
            pagination: pagination ?? this.pagination,
        );

    factory SigninModel.fromJson(Map<String, dynamic> json) => SigninModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        meta: json["meta"] == null ? [] : List<dynamic>.from(json["meta"]!.map((x) => x)),
        pagination: json["pagination"] == null ? [] : List<dynamic>.from(json["pagination"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
        "pagination": pagination == null ? [] : List<dynamic>.from(pagination!.map((x) => x)),
    };
}

class Data {
    final User? user;
    final String? token;

    Data({
        this.user,
        this.token,
    });

    Data copyWith({
        User? user,
        String? token,
    }) => 
        Data(
            user: user ?? this.user,
            token: token ?? this.token,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
    };
}

class User {
    final String? id;
    final String? fullName;
    final String? username;
    final String? email;
    final dynamic phone;
    final dynamic phoneCountry;
    final String? country;
    final dynamic avatar;
    final String? pin;

    User({
        this.id,
        this.fullName,
        this.username,
        this.email,
        this.phone,
        this.phoneCountry,
        this.country,
        this.avatar,
        this.pin,
    });

    User copyWith({
        String? id,
        String? fullName,
        String? username,
        String? email,
        dynamic phone,
        dynamic phoneCountry,
        String? country,
        dynamic avatar,
        String? pin,
    }) => 
        User(
            id: id ?? this.id,
            fullName: fullName ?? this.fullName,
            username: username ?? this.username,
            email: email ?? this.email,
            phone: phone ?? this.phone,
            phoneCountry: phoneCountry ?? this.phoneCountry,
            country: country ?? this.country,
            avatar: avatar ?? this.avatar,
            pin: pin ?? this.pin,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        phoneCountry: json["phone_country"],
        country: json["country"],
        avatar: json["avatar"],
        pin: json["pin"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "username": username,
        "email": email,
        "phone": phone,
        "phone_country": phoneCountry,
        "country": country,
        "avatar": avatar,
        "pin": pin,
    };
}
