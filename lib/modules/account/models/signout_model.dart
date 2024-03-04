// To parse this JSON data, do
//
//     final signoutModel = signoutModelFromJson(jsonString);

import 'dart:convert';

SignoutModel signoutModelFromJson(String str) => SignoutModel.fromJson(json.decode(str));

String signoutModelToJson(SignoutModel data) => json.encode(data.toJson());

class SignoutModel {
    final bool? status;
    final String? message;
    final List<dynamic>? data;
    final List<dynamic>? meta;
    final List<dynamic>? pagination;

    SignoutModel({
        this.status,
        this.message,
        this.data,
        this.meta,
        this.pagination,
    });

    SignoutModel copyWith({
        bool? status,
        String? message,
        List<dynamic>? data,
        List<dynamic>? meta,
        List<dynamic>? pagination,
    }) => 
        SignoutModel(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
            meta: meta ?? this.meta,
            pagination: pagination ?? this.pagination,
        );

    factory SignoutModel.fromJson(Map<String, dynamic> json) => SignoutModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
        meta: json["meta"] == null ? [] : List<dynamic>.from(json["meta"]!.map((x) => x)),
        pagination: json["pagination"] == null ? [] : List<dynamic>.from(json["pagination"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
        "pagination": pagination == null ? [] : List<dynamic>.from(pagination!.map((x) => x)),
    };
}
