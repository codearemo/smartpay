// To parse this JSON data, do
//
//     final requestVerificationEntity = requestVerificationEntityFromJson(jsonString);

import 'dart:convert';

RequestVerificationEntity requestVerificationEntityFromJson(String str) => RequestVerificationEntity.fromJson(json.decode(str));

String requestVerificationEntityToJson(RequestVerificationEntity data) => json.encode(data.toJson());

class RequestVerificationEntity {
    final String? email;

    RequestVerificationEntity({
        this.email,
    });

    RequestVerificationEntity copyWith({
        String? email,
    }) => 
        RequestVerificationEntity(
            email: email ?? this.email,
        );

    factory RequestVerificationEntity.fromJson(Map<String, dynamic> json) => RequestVerificationEntity(
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
    };
}
