// To parse this JSON data, do
//
//     final signupEntity = signupEntityFromJson(jsonString);

import 'dart:convert';

SignupEntity signupEntityFromJson(String str) => SignupEntity.fromJson(json.decode(str));

String signupEntityToJson(SignupEntity data) => json.encode(data.toJson());

class SignupEntity {
    final String? fullName;
    final String? username;
    final String? email;
    final String? password;
    final String? deviceName;
    final String? country;

    SignupEntity({
        this.fullName,
        this.username,
        this.email,
        this.password,
        this.deviceName,
        this.country,
    });

    SignupEntity copyWith({
        String? fullName,
        String? username,
        String? email,
        String? password,
        String? deviceName,
        String? country,
    }) => 
        SignupEntity(
            fullName: fullName ?? this.fullName,
            username: username ?? this.username,
            email: email ?? this.email,
            password: password ?? this.password,
            deviceName: deviceName ?? this.deviceName,
            country: country ?? this.country,
        );

    factory SignupEntity.fromJson(Map<String, dynamic> json) => SignupEntity(
        fullName: json["full_name"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        deviceName: json["device_name"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "username": username,
        "email": email,
        "password": password,
        "device_name": deviceName,
        "country": country,
    };
}
