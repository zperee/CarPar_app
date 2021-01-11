import 'package:carpar_app/control/SharedPrefControl.dart';
import 'package:carpar_app/model/City.dart';
import 'package:carpar_app/model/Parking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ParkingDetailView.dart';

class ParkingOverview extends StatefulWidget {
  int pageType;

  ParkingOverview(this.pageType);

  @override
  _ParkingOverviewState createState() => _ParkingOverviewState();
}

class _ParkingOverviewState extends State<ParkingOverview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<City>(builder: (context, city, child) {
      return FutureBuilder<List<String>>(
          future: SharedPrefControl.getFavParkings(),
          builder:
              (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            if (city.parkings != null && city.parkings.length > 0) {
              List<Parking> parking;
              if (widget.pageType == 1 && snapshot.hasData) {
                parking = widget.pageType == 0
                    ? city.parkings
                    : city.parkings
                        .where((item) => snapshot.data.contains(item.sId))
                        .toList();
              } else {
                parking = city.parkings;
              }

              Future<void> _pullRefresh() async {
                city.updateData(city.sId);
              }

              if (parking.length > 0) {
                return RefreshIndicator(
                  onRefresh: _pullRefresh,
                  child: ListView.builder(
                      itemCount: parking.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(parking[index].name),
                          trailing: Text(
                              "${parking[index].free} / ${parking[index].parking.totalParking}"),
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ParkingDetailView(parking[index].sId)),
                            );
                            setState(() {});
                          },
                        );
                      }),
                );
              } else {
                return Center(child: Text("Keine Favoriten gespeichert"));
              }
            } else {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xff345363)),
                        strokeWidth: 5,
                      )
                    ],
                  ),
                ),
              );
            }
          });
    });
  }
}
