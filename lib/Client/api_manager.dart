import 'dart:convert';
import 'dart:io';
import 'package:haradanapp/Client/services.dart';
import 'package:haradanapp/Model/Haradan/CorporateAdvertModel.dart';
import 'package:haradanapp/Model/Haradan/MainPageCategoryModel.dart';
import 'package:haradanapp/Model/Haradan/SliderWidgetModel.dart';
import 'package:http/http.dart' as http;
import 'package:haradanapp/Model/Haradan/WindowAdvertsModel.dart';
import 'dart:core';
class ApiManager{
  Future<WindowAdverts> getWindowAdverts() async {
    var client = http.Client();
    var windowAdverts;
    try {
      var response = await client.get(Uri.parse(Services.vitrin_ilan_url));
      String bodyResponse = utf8.decode(response.bodyBytes);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var jsonString = bodyResponse;
        var jsonMap = json.decode(jsonString);
        windowAdverts = WindowAdverts.fromJson(jsonMap);
      }
    } catch (Exception, e) {
      print(e);
    }
    return windowAdverts;
  }

  Future<WindowAdverts> getLastAdverts() async {
    var client = http.Client();
    var lastAdverts;
    try {
      var response = await client.get(Uri.parse(Services.last_advert_url));
      String bodyResponse = utf8.decode(response.bodyBytes);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var jsonString = bodyResponse;
        var jsonMap = json.decode(jsonString);
        lastAdverts = WindowAdverts.fromJson(jsonMap);
      }
    } catch (Exception, e) {
      print(e);
    }
    return lastAdverts;
  }



  Future<SliderModel> getSliders() async {
    var client = http.Client();
    var sliders;
    try {
      var response = await client.get(Uri.parse(Services.slider_url));
      String bodyResponse = utf8.decode(response.bodyBytes);
      print(response.statusCode);
      print("Slider body" +response.body);
      if (response.statusCode == 200) {
        var jsonString = bodyResponse;
        var jsonMap = json.decode(jsonString);
        sliders = SliderModel.fromJson(jsonMap);
        print("Slider data "+sliders);
      }
    } catch (Exception, e) {
      print(e);
    }
    return sliders;
  }

  Future<EkuriModel> getCorporateAdvertSliders() async {
    var client = http.Client();
    var corporateSliders;
    try {
      var response = await client.get(Uri.parse(Services.ekuri_slider_url));
      String bodyResponse = utf8.decode(response.bodyBytes);
      print(response.statusCode);
      print("Slider body" +response.body);
      if (response.statusCode == 200) {
        var jsonString = bodyResponse;
        var jsonMap = json.decode(jsonString);
        corporateSliders = EkuriModel.fromJson(jsonMap);
        print("Slider data "+corporateSliders);
      }
    } catch (Exception, e) {
      print(e);
    }
    return corporateSliders;
  }


  Future<MainPageCategory> getCategories() async {
    var client = http.Client();
    var categories;
    try {
      var response = await client.get(Uri.parse(Services.kategori_url));
      String bodyResponse = utf8.decode(response.bodyBytes);
      print(response.statusCode);
      print("kategori body" +response.body);
      if (response.statusCode == 200) {
        var jsonString = bodyResponse;
     //   var jsonMap = json.decode(jsonString);
       List<dynamic> list = json.decode(jsonString);
        print("jsonmap :"+list.toString());
        categories = MainPageCategory.fromJson(list[0]);
        print("kategori data "+categories.toString());
      }
    } catch (Exception, e) {
      print(e);
    }
    return categories;
  }


}