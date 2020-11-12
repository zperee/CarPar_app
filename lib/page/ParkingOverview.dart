import 'package:carpar_app/model/Parking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ParkingDetailView.dart';

class ParkingOverview extends StatelessWidget {
  String cityId;

  ParkingOverview(this.cityId);

  var items = [Parking(name: "test"), Parking(name: "test")];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            subtitle: Text("Entfernung"),
            trailing: Text("50/150"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ParkingDetailView("4534345")),
              );
            },
          );
        });
  }
}
