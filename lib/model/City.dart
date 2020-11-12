import 'Parking.dart';

class City {
  List<Parking> parkings;
  String sId;
  String name;
  bool showInUI;

  City({this.parkings, this.sId, this.name, this.showInUI});

  City.fromJson(Map<String, dynamic> json) {
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
