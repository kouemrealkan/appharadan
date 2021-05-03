// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'dart:convert';

SliderModel sliderModelFromJson(String str) =>
    SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
  SliderModel({
    this.page,
    this.data,
  });

  Page page;
  List<SliderAdvert> data;

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        page: Page.fromJson(json["page"]),
        data: List<SliderAdvert>.from(
            json["data"].map((x) => SliderAdvert.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SliderAdvert {
  SliderAdvert({
    this.url,
    this.media,
  });

  String url;
  String media;

  factory SliderAdvert.fromJson(Map<String, dynamic> json) => SliderAdvert(
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
