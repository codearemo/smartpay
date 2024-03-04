// To parse this JSON data, do
//
//     final signinEntity = signinEntityFromJson(jsonString);

import 'dart:convert';

SigninEntity signinEntityFromJson(String str) => SigninEntity.fromJson(json.decode(str));

String signinEntityToJson(SigninEntity data) => json.encode(data.toJson());

class SigninEntity {
    final String? email;
    final String? password;
    final String? deviceName;

    SigninEntity({
        this.email,
        this.password,
        this.deviceName,
    });

    SigninEntity copyWith({
        String? email,
        String? password,
        String? deviceName,
    }) => 
        SigninEntity(
            email: email ?? this.email,
            password: password ?? this.password,
            deviceName: deviceName ?? this.deviceName,
        );

    factory SigninEntity.fromJson(Map<String, dynamic> json) => SigninEntity(
        email: json["email"],
        password: json["password"],
        deviceName: json["device_name"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "device_name": deviceName,
    };
}
