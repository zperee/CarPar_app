import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParkingDetailView extends StatelessWidget {
  String parkingId;

  ParkingDetailView(this.parkingId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parkhausname"),
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
                      Text("50",
                          style:
                              (TextStyle(fontSize: 56, color: Colors.green))),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, top: 30.0),
                        child: Text("/150", style: (TextStyle(fontSize: 30))),
                      ),
                      Spacer()
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("33% frei", style: TextStyle(fontSize: 20)),
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
                      title: Text("Gliessereistrasse 8\ntest")),
                  ListTile(
                    leading: Icon(Icons.open_in_browser),
                    title: Text("www.plsz.ch"),
                  ),
                  ListTile(
                    leading: Icon(Icons.local_parking),
                    title: Text("www.plsz.ch"),
                  ),
                  ListTile(
                    leading: Icon(Icons.watch_later),
                    title: Text("Montag: 7:00 - 18:00\n"
                        "Dienstag: 7:00 - 18:00\n"
                        "Mittwoch: 7:00 - 18:00\n"
                        "Donnerstag: 7:00 - 18:00\n"
                        "Freitag: 7:00 - 18:00\n"
                        "Samstag: 7:00 - 18:00\n"
                        "Sonntag: 7:00 - 18:00"),
                  ),
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text("www.plsz.ch"),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition:
                  CameraPosition(target: LatLng(47.40773, 8.5005)),
              myLocationEnabled: true,
            ),
          )
        ],
      ),
    );
  }
}
