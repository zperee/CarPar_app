import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
              child: Center(
                  child: Text("Offen",
                      style: (TextStyle(fontSize: 18, color: Colors.white)))),
            ),
          ),
          Expanded(
            flex: 6,
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Icon(Icons.pin_drop),
                      ),
                      Column(
                        children: [
                          Text("Gliessereistrasse 18"),
                          Text("8005 Zürich"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Icon(Icons.open_in_browser),
                      ),
                      Column(
                        children: [
                          Text("www.plsz.ch"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Icon(Icons.watch_later),
                      ),
                      Column(
                        children: [
                          Text("Montag: 7:00 - 18:00"),
                          Text("Dienstag: 7:00 - 18:00"),
                          Text("Mittwoch: 7:00 - 18:00"),
                          Text("Donnerstag: 7:00 - 18:00"),
                          Text("Freitag: 7:00 - 18:00"),
                          Text("Samstag: 7:00 - 18:00"),
                          Text("Sonntag: 7:00 - 18:00"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 10, child: Text("Map"))
        ],
      ),
    );
  }
}
