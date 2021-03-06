class ParkingInfo {
  int totalParking;
  int electroParking;
  int disabledParking;
  int familyParking;
  int womenParking;
  int xlParking;

  ParkingInfo(
      {this.totalParking,
      this.electroParking,
      this.disabledParking,
      this.familyParking,
      this.womenParking,
      this.xlParking});

  ParkingInfo.fromJson(Map<String, dynamic> json) {
    totalParking = json['totalParking'] ?? 0;
    electroParking = json['electroParking'] ?? 0;
    disabledParking = json['disabledParking'] ?? 0;
    familyParking = json['familyParking'] ?? 0;
    womenParking = json['womenParking'] ?? 0;
    xlParking = json['xlParking'] ?? 0;
  }
}
