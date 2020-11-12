import 'package:carpar_app/model/City.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ParkingDetailView.dart';

class ParkingOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<City>(builder: (context, city, child) {
      return ListView.builder(
          itemCount: city.parkings.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(city.parkings[index].name),
              subtitle: Text("Entfernung"),
              trailing: Text(
                  "${city.parkings[index].parking.freeParking} / ${city.parkings[index].parking.totalParking}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ParkingDetailView(city.parkings[index].sId)),
                );
              },
            );
          });
    });
  }
}
