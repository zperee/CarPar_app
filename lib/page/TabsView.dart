import 'package:carpar_app/page/MapView.dart';
import 'package:carpar_app/page/ParkingOverview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.map)),
              Tab(icon: Icon(Icons.star)),
            ],
          ),
          title: Text('Zürich'),
        ),
        body: TabBarView(
          children: [
            ParkingOverview("2314234"),
            MapView(),
            ParkingOverview("3"),
          ],
        ),
      ),
    );
  }
}
