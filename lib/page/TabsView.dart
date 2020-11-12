import 'package:carpar_app/model/City.dart';
import 'package:carpar_app/page/MapView.dart';
import 'package:carpar_app/page/ParkingOverview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          title: Consumer<City>(builder: (context, city, child) {
            return Text(city.name);
          }),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            ParkingOverview(),
            MapView(),
            ParkingOverview(),
          ],
        ),
      ),
    );
  }
}
