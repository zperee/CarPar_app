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
      ),
      body: Center(
        child: Text("dsfkjs"),
      ),
    );
  }
}
