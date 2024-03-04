// To parse this JSON data, do
//
//     final requestVerificationModel = requestVerificationModelFromJson(jsonString);

import 'dart:convert';

RequestVerificationModel requestVerificationModelFromJson(String str) => RequestVerificationModel.fromJson(json.decode(str));

String requestVerificationModelToJson(RequestVerificationModel data) => json.encode(data.toJson());

class RequestVerificationModel {
    final bool? status;
    final String? message;
    final Data? data;
    final List<dynamic>? meta;
    final List<dynamic>? pagination;

    RequestVerificationModel({
        this.status,
        this.message,
        this.data,
        this.meta,
        this.pagination,
    });

    RequestVerificationModel copyWith({
        bool? status,
        String? message,
        Data? data,
        List<dynamic>? meta,
        List<dynamic>? pagination,
    }) => 
        RequestVerificationModel(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
            meta: meta ?? this.meta,
            pagination: pagination ?? this.pagination,
        );

    factory RequestVerificationModel.fromJson(Map<String, dynamic> json) => RequestVerificationModel(
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
    final String? token;

    Data({
        this.token,
    });

    Data copyWith({
        String? token,
    }) => 
        Data(
            token: token ?? this.token,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
    };
}
