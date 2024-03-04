// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
    final Flags? flags;
    final Name? name;
    final String? flag;

    CountryModel({
        this.flags,
        this.name,
        this.flag,
    });

    CountryModel copyWith({
        Flags? flags,
        Name? name,
        String? flag,
    }) => 
        CountryModel(
            flags: flags ?? this.flags,
            name: name ?? this.name,
            flag: flag ?? this.flag,
        );

    factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        flag: json["flag"],
    );

    Map<String, dynamic> toJson() => {
        "flags": flags?.toJson(),
        "name": name?.toJson(),
        "flag": flag,
    };
}

class Flags {
    final String? png;
    final String? svg;
    final String? alt;

    Flags({
        this.png,
        this.svg,
        this.alt,
    });

    Flags copyWith({
        String? png,
        String? svg,
        String? alt,
    }) => 
        Flags(
            png: png ?? this.png,
            svg: svg ?? this.svg,
            alt: alt ?? this.alt,
        );

    factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
        alt: json["alt"],
    );

    Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        "alt": alt,
    };
}

class Name {
    final String? common;
    final String? official;
    final NativeName? nativeName;

    Name({
        this.common,
        this.official,
        this.nativeName,
    });

    Name copyWith({
        String? common,
        String? official,
        NativeName? nativeName,
    }) => 
        Name(
            common: common ?? this.common,
            official: official ?? this.official,
            nativeName: nativeName ?? this.nativeName,
        );

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: json["nativeName"] == null ? null : NativeName.fromJson(json["nativeName"]),
    );

    Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": nativeName?.toJson(),
    };
}

class NativeName {
    final Ara? ara;
    final Ara? eng;
    final Ara? tir;

    NativeName({
        this.ara,
        this.eng,
        this.tir,
    });

    NativeName copyWith({
        Ara? ara,
        Ara? eng,
        Ara? tir,
    }) => 
        NativeName(
            ara: ara ?? this.ara,
            eng: eng ?? this.eng,
            tir: tir ?? this.tir,
        );

    factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
        ara: json["ara"] == null ? null : Ara.fromJson(json["ara"]),
        eng: json["eng"] == null ? null : Ara.fromJson(json["eng"]),
        tir: json["tir"] == null ? null : Ara.fromJson(json["tir"]),
    );

    Map<String, dynamic> toJson() => {
        "ara": ara?.toJson(),
        "eng": eng?.toJson(),
        "tir": tir?.toJson(),
    };
}

class Ara {
    final String? official;
    final String? common;

    Ara({
        this.official,
        this.common,
    });

    Ara copyWith({
        String? official,
        String? common,
    }) => 
        Ara(
            official: official ?? this.official,
            common: common ?? this.common,
        );

    factory Ara.fromJson(Map<String, dynamic> json) => Ara(
        official: json["official"],
        common: json["common"],
    );

    Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
    };
}
