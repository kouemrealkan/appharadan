// To parse this JSON data, do
//
//     final ekuriModel = ekuriModelFromJson(jsonString);

import 'dart:convert';

EkuriModel ekuriModelFromJson(String str) =>
    EkuriModel.fromJson(json.decode(str));

String ekuriModelToJson(EkuriModel data) => json.encode(data.toJson());

class EkuriModel {
  EkuriModel({
    this.page,
    this.data,
  });

  Page page;
  List<CorporateAdvert> data;

  factory EkuriModel.fromJson(Map<String, dynamic> json) => EkuriModel(
        page: Page.fromJson(json["page"]),
        data: List<CorporateAdvert>.from(
            json["data"].map((x) => CorporateAdvert.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CorporateAdvert {
  CorporateAdvert({
    this.url,
    this.media,
  });
  String url;
  String media;

  factory CorporateAdvert.fromJson(Map<String, dynamic> json) =>
      CorporateAdvert(
        url: json["url"],
        media: json["media"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "media": media,
      };
}

class Page {
  Page({
    this.totalElements,
    this.totalPages,
    this.page,
    this.size,
    this.sort,
    this.direction,
  });

  int totalElements;
  int totalPages;
  int page;
  int size;
  String sort;
  String direction;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
        page: json["page"],
        size: json["size"],
        sort: json["sort"],
        direction: json["direction"],
      );

  Map<String, dynamic> toJson() => {
        "totalElements": totalElements,
        "totalPages": totalPages,
        "page": page,
        "size": size,
        "sort": sort,
        "direction": direction,
      };
}
