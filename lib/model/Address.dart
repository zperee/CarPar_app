class Address {
  String street;
  String city;
  String zip;

  Address({this.street, this.city, this.zip});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    zip = json['zip'];
  }
}
