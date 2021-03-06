import 'package:carpar_app/model/City.dart';
import 'package:location/location.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'ParkingDetailView.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  LatLng _initialCameraPosition = LatLng(47.40773, 8.5005);
  GoogleMapController _controller;
  Location _location = Location();

  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.getLocation().then((l) => {
          _controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
          ))
        });

    setState(() {
      Provider.of<City>(context, listen: false).parkings.forEach((parking) {
        _markers.add(
          Marker(
            markerId: MarkerId(parking.sId),
            position:
                LatLng(parking.geo.coordinates[0], parking.geo.coordinates[1]),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ParkingDetailView(parking.sId),
              ),
            ),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _initialCameraPosition),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              markers: _markers,
            ),
          ],
        ),
      ),
    );
  }
}
// return new Scaffold(
//   body: GoogleMap(
//     mapType: MapType.normal,
//     initialCameraPosition: test != null ? test : _kGooglePlex,
//     markers: _markers,
//     onMapCreated: (GoogleMapController controller) {
//       _controller.complete(controller);
//       setState(() {
//         _markers.add(Marker(
//           markerId: MarkerId("teest"),
//           position: LatLng(37.42796133580664, -121.085749655969),
//           onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => ParkingDetailView("4534345"))),
//         ));
//       });
//     },
//   ),
// );
//   }
// }
