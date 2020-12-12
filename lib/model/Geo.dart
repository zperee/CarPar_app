class Geo {
  String type;
  List<double> coordinates;

  Geo({this.type, this.coordinates});

  Geo.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }
}
