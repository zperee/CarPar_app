import 'package:carpar_app/page/TabsView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CarParApp());
}

class CarParApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarPar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabsView(),
    );
  }
}
