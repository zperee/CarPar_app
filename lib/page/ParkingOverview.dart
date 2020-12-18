import 'package:carpar_app/control/SharedPrefControl.dart';
import 'package:carpar_app/model/City.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ParkingDetailView.dart';

class ParkingOverview extends StatelessWidget {
  int pageType;

  ParkingOverview(this.pageType);

  @override
  Widget build(BuildContext context) {
    return Consumer<City>(builder: (context, city, child) {
      if (city.parkings != null && city.parkings.length > 0) {
        //var favParking = SharedPrefControl.getFavParkings();

        var parking = pageType == 0
            ? city.parkings
            : city.parkings.where((p) => p.apiId.contains("NP08")).toList();

        Future<void> _pullRefresh() async {
          city.updateData(city.sId);
        }

        return RefreshIndicator(
          onRefresh: _pullRefresh,
          child: ListView.builder(
            itemCount: parking.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(parking[index].name),
                trailing: Text(
                    "${parking[index].free} / ${parking[index].parking.totalParking}"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ParkingDetailView(parking[index].sId)),
                  );
                },
              );
            },
          ),
        );
      } else {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff345363)),
                  strokeWidth: 5,
                )
              ],
            ),
          ),
        );
      }
    });
  }
}
