class Geo {
  double lat;
  double lon;

  Geo({this.lat, this.lon});

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }
}
