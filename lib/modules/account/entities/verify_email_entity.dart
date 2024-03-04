// To parse this JSON data, do
//
//     final verifyEmailEntity = verifyEmailEntityFromJson(jsonString);

import 'dart:convert';

VerifyEmailEntity verifyEmailEntityFromJson(String str) => VerifyEmailEntity.fromJson(json.decode(str));

String verifyEmailEntityToJson(VerifyEmailEntity data) => json.encode(data.toJson());

class VerifyEmailEntity {
    final String? email;
    final String? token;

    VerifyEmailEntity({
        this.email,
        this.token,
    });

    VerifyEmailEntity copyWith({
        String? email,
        String? token,
    }) => 
        VerifyEmailEntity(
            email: email ?? this.email,
            token: token ?? this.token,
        );

    factory VerifyEmailEntity.fromJson(Map<String, dynamic> json) => VerifyEmailEntity(
        email: json["email"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "token": token,
    };
}
