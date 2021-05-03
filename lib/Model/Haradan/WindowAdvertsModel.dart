// To parse this JSON data, do
//
//     final windowAdverts = windowAdvertsFromJson(jsonString);

import 'dart:convert';

WindowAdverts windowAdvertsFromJson(String str) => WindowAdverts.fromJson(json.decode(str));

String windowAdvertsToJson(WindowAdverts data) => json.encode(data.toJson());

class WindowAdverts {
  WindowAdverts({
    this.page,
    this.data,
  });

  Page page;
  List<Advert> data;

  factory WindowAdverts.fromJson(Map<String, dynamic> json) => WindowAdverts(
    page: Page.fromJson(json["page"]),
    data: List<Advert>.from(json["data"].map((x) => Advert.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Advert {
  Advert({
    this.identifier,
    this.advertNo,
    this.status,
    this.title,
    this.price,
    this.city,
    this.district,
    this.url,
    this.imageUrl,
  });

  String identifier;
  int advertNo;
  String status;
  String title;
  double price;
  String city;
  String district;
  String url;
  String imageUrl;

  factory Advert.fromJson(Map<String, dynamic> json) => Advert(
    identifier: json["identifier"],
    advertNo: json["advertNo"],
    status: json["status"],
    title: json["title"],
    price: json["price"],
    city: json["city"],
    district: json["district"] == null ? null : json["district"],
    url: json["url"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "advertNo": advertNo,
    "status": status,
    "title": title,
    "price": price,
    "city": city,
    "district": district == null ? null : district,
    "url": url,
    "imageUrl": imageUrl,
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
