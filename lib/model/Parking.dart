import 'Address.dart';
import 'Geo.dart';
import 'OpenHours.dart';

class Parking {
  String sId;
  String name;
  String city;
  String website;
  Parking parking;
  Geo geo;
  Address address;
  List<OpenHours> openHours;
  List<int> payment;
  String apiId;

  Parking(
      {this.sId,
      this.name,
      this.city,
      this.website,
      this.parking,
      this.geo,
      this.address,
      this.openHours,
      this.payment,
      this.apiId});

  Parking.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    city = json['city'];
    website = json['website'];
    parking =
        json['parking'] != null ? new Parking.fromJson(json['parking']) : null;
    geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['openHours'] != null) {
      openHours = new List<OpenHours>();
      json['openHours'].forEach((v) {
        openHours.add(new OpenHours.fromJson(v));
      });
    }
    payment = json['payment'].cast<int>();
    apiId = json['apiId'];
  }
}
