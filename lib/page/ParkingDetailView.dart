import 'package:carpar_app/control/SharedPrefControl.dart';
import 'package:carpar_app/model/City.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ParkingDetailView extends StatefulWidget {
  String parkingId;

  ParkingDetailView(this.parkingId);

  @override
  _ParkingDetailViewState createState() => _ParkingDetailViewState();
}

class _ParkingDetailViewState extends State<ParkingDetailView> {
  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<City>(builder: (context, city, child) {
      var selectedParking = city.parkings
          .firstWhere((element) => element.sId == (this.widget.parkingId));
      return Scaffold(
        appBar: AppBar(
          title: Text("${selectedParking.name}"),
          actions: [
            FlatButton(
              textColor: Colors.white,
              onPressed: () async {
                await SharedPrefControl.toggleFavParking(selectedParking.sId);
                setState(() {});
              },
              child: FutureBuilder<bool>(
                  future: SharedPrefControl.parkingIsFav(selectedParking.sId),
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.hasData && snapshot.data) {
                      return Icon(Icons.star);
                    } else {
                      return Icon(Icons.star_border);
                    }
                  }),
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
                            "${selectedParking.address.street}\n${selectedParking.address.zip} ${selectedParking.address.city}"),
                        onTap: () {
                          launchUrl(
                              'https://www.google.com/maps/search/?api=1&query=${selectedParking.geo.coordinates[0]},${selectedParking.geo.coordinates[0]}');
                        }),
                    ListTile(
                        leading: Icon(Icons.open_in_browser),
                        title: Text("${selectedParking.website}"),
                        onTap: () {
                          launchUrl(selectedParking.website);
                        }),
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
                      title: Text("${selectedParking.openHours.map((element) {
                        return element.day.toUpperCase() +
                            " - " +
                            element.dayTo.toUpperCase() +
                            ": " +
                            element.open;
                      })}"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(selectedParking.geo.coordinates[0],
                      selectedParking.geo.coordinates[1]),
                  zoom: 15,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId(selectedParking.apiId),
                    position: LatLng(selectedParking.geo.coordinates[0],
                        selectedParking.geo.coordinates[1]),
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
