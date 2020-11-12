import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Parking.dart';
import 'dart:convert' as convert;

class City extends ChangeNotifier {
  List<Parking> parkings;
  String sId;
  String name;
  bool showInUI;

  City(String cityId) {
    http
        .get("https://carpar-api.herokuapp.com/api/city/$cityId")
        .then((res) => fromJson(convert.jsonDecode(res.body)))
        .then((value) => notifyListeners());
  }

  fromJson(Map<String, dynamic> json) {
    print(json);
    if (json['parkings'] != null) {
      parkings = new List<Parking>();
      json['parkings'].forEach((v) {
        parkings.add(new Parking.fromJson(v));
      });
    }
    sId = json['_id'];
    name = json['name'];
    showInUI = json['showInUI'];
  }
}
