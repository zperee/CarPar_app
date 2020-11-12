import 'package:carpar_app/main.dart';
import 'package:carpar_app/model/City.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ParkingDetailView extends StatelessWidget {
  String parkingId;

  ParkingDetailView(this.parkingId);

  @override
  Widget build(BuildContext context) {
    return Consumer<City>(builder: (context, city, child) {
      var selectedParking = city.parkings
          .firstWhere((element) => element.sId == (this.parkingId));
      return Scaffold(
        appBar: AppBar(
          title: Text("${selectedParking.name}"),
          actions: [
            FlatButton(
              textColor: Colors.white,
              onPressed: () {},
              child: Icon(Icons.star_border),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 30,
              child: Container(
                color: Colors.green,
                child: Center(
                    child: Text("Offen",
                        style: (TextStyle(fontSize: 18, color: Colors.white)))),
              ),
            ),
            SizedBox(
              height: 160,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        Text("${selectedParking.free}",
                            style:
                                (TextStyle(fontSize: 56, color: Colors.green))),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0, top: 30.0),
                          child: Text(
                              "/${selectedParking.parking.totalParking}",
                              style: (TextStyle(fontSize: 30))),
                        ),
                        Spacer()
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                          "${(selectedParking.free / selectedParking.parking.totalParking * 100).round()}% frei",
                          style: TextStyle(fontSize: 20)),
                    )
                  ],
                ),
              ),
            ),
            Divider(color: Colors.black, thickness: 1.5),
            Expanded(
              flex: 10,
              child: Container(
                child: ListView(
                  children: [
                    ListTile(
                        leading: Icon(Icons.pin_drop),
                        title: Text(
                            "${selectedParking.address.street}\n${selectedParking.address.zip} ${selectedParking.address.city}")),
                    ListTile(
                      leading: Icon(Icons.open_in_browser),
                      title: Text("${selectedParking.website}"),
                    ),
                    ListTile(
                      leading: Icon(Icons.local_parking),
                      title: Text(
                          "Behindertenparkplätze: ${selectedParking.parking.disabledParking}\n"
                          "Frauenparkplätze: ${selectedParking.parking.womenParking}\n"
                          "Familienparkplätze: ${selectedParking.parking.familyParking}\n"
                          "XL-Parkplätze: ${selectedParking.parking.xlParking}\n"
                          "Elektroparkplätze: ${selectedParking.parking.electroParking}\n"),
                    ),
                    ListTile(
                      leading: Icon(Icons.watch_later),
                      title: Text("${selectedParking.openHours}"),
                    ),
                    ListTile(
                      leading: Icon(Icons.attach_money),
                      title: Text("${selectedParking.payment}"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target:
                      LatLng(selectedParking.geo.lat, selectedParking.geo.lon),
                  zoom: 15,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId(selectedParking.apiId),
                    position: LatLng(
                        selectedParking.geo.lat, selectedParking.geo.lon),
                  )
                },
                myLocationEnabled: true,
              ),
            )
          ],
        ),
      );
    });
  }
}
