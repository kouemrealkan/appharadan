// To parse this JSON data, do
//
//     final mainPageCategory = mainPageCategoryFromJson(jsonString);

import 'dart:convert';

List<MainPageCategory> mainPageCategoryFromJson(String str) => List<MainPageCategory>.from(json.decode(str).map((x) => MainPageCategory.fromJson(x)));

String mainPageCategoryToJson(List<MainPageCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MainPageCategory {
  MainPageCategory({
    this.id,
    this.value,
  });

  String id;
  String value;



  factory MainPageCategory.fromJson(Map<String, dynamic> json) => MainPageCategory(
    id: json["id"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
  };
}
