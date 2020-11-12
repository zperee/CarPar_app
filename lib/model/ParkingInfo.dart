class ParkingInfo {
  int freeParking;
  int totalParking;
  int electroParking;
  int disabledParking;
  int familyParking;
  int womenParking;
  int xlParking;

  ParkingInfo(
      {this.freeParking,
      this.totalParking,
      this.electroParking,
      this.disabledParking,
      this.familyParking,
      this.womenParking,
      this.xlParking});

  ParkingInfo.fromJson(Map<String, dynamic> json) {
    freeParking = json['freeParking'];
    totalParking = json['totalParking'];
    electroParking = json['electroParking'];
    disabledParking = json['disabledParking'];
    familyParking = json['familyParking'];
    womenParking = json['womenParking'];
    xlParking = json['xlParking'];
  }
}
