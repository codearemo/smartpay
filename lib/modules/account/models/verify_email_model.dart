// To parse this JSON data, do
//
//     final verifyEmailModel = verifyEmailModelFromJson(jsonString);

import 'dart:convert';

VerifyEmailModel verifyEmailModelFromJson(String str) => VerifyEmailModel.fromJson(json.decode(str));

String verifyEmailModelToJson(VerifyEmailModel data) => json.encode(data.toJson());

class VerifyEmailModel {
    final bool? status;
    final String? message;
    final Data? data;
    final List<dynamic>? meta;
    final List<dynamic>? pagination;

    VerifyEmailModel({
        this.status,
        this.message,
        this.data,
        this.meta,
        this.pagination,
    });

    VerifyEmailModel copyWith({
        bool? status,
        String? message,
        Data? data,
        List<dynamic>? meta,
        List<dynamic>? pagination,
    }) => 
        VerifyEmailModel(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
            meta: meta ?? this.meta,
            pagination: pagination ?? this.pagination,
        );

    factory VerifyEmailModel.fromJson(Map<String, dynamic> json) => VerifyEmailModel(
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
    final String? email;

    Data({
        this.email,
    });

    Data copyWith({
        String? email,
    }) => 
        Data(
            email: email ?? this.email,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
    };
}
