// To parse this JSON data, do
//
//     final randomMessageModel = randomMessageModelFromJson(jsonString);

import 'dart:convert';

RandomMessageModel randomMessageModelFromJson(String str) => RandomMessageModel.fromJson(json.decode(str));

String randomMessageModelToJson(RandomMessageModel data) => json.encode(data.toJson());

class RandomMessageModel {
    final bool? status;
    final String? message;
    final Data? data;
    final List<dynamic>? meta;
    final List<dynamic>? pagination;

    RandomMessageModel({
        this.status,
        this.message,
        this.data,
        this.meta,
        this.pagination,
    });

    RandomMessageModel copyWith({
        bool? status,
        String? message,
        Data? data,
        List<dynamic>? meta,
        List<dynamic>? pagination,
    }) => 
        RandomMessageModel(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
            meta: meta ?? this.meta,
            pagination: pagination ?? this.pagination,
        );

    factory RandomMessageModel.fromJson(Map<String, dynamic> json) => RandomMessageModel(
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
    final String? secret;

    Data({
        this.secret,
    });

    Data copyWith({
        String? secret,
    }) => 
        Data(
            secret: secret ?? this.secret,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        secret: json["secret"],
    );

    Map<String, dynamic> toJson() => {
        "secret": secret,
    };
}
