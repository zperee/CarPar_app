class OpenHours {
  String day;
  String dayTo;
  String open;

  OpenHours({this.day, this.dayTo, this.open});

  OpenHours.fromJson(Map<String, dynamic> json) {
    day = json['day'] ?? "";
    dayTo = json['dayTo'] ?? "";
    open = json['open'] ?? "";
  }
}
