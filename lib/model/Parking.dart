import 'Address.dart';
import 'Geo.dart';
import 'OpenHours.dart';
import 'ParkingInfo.dart';

class Parking {
  String sId;
  String name;
  String city;
  String website;
  ParkingInfo parking;
  Geo geo;
  Address address;
  List<OpenHours> openHours;
  List<int> payment;
  String apiId;
  int free;
  DateTime updatedAt;

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
      this.apiId,
      this.free,
      this.updatedAt});

  Parking.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? "";
    name = json['name'] ?? "";
    city = json['city'] ?? "";
    free = json['free'] ?? 0;
    updatedAt = DateTime.parse(json['updatedAt'].toString()) ?? "";
    website = json['website'] ?? "";
    parking = json['parking'] != null
        ? new ParkingInfo.fromJson(json['parking'])
        : null;
    geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['openHours'] != null) {
      openHours = new List<OpenHours>();
      json['openHours'].forEach((v) {
        openHours.add(new OpenHours.fromJson(v));
      });
    }
    if (json['payment'] != null) {
      payment = json['payment'].cast<int>();
    }
    apiId = json['apiId'];
  }
}
