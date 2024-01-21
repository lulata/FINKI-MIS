import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<MapView> {
  double? lat;
  double? lng;

  @override
  void initState() {
    super.initState();
    _getLocationPermission();
  }
  //
  // Future<void> _getLocationPermission() async {
  //   LocationPermission permission = await Geolocator.requestPermission();
  //   if (permission == LocationPermission.denied ||
  //       permission == LocationPermission.deniedForever) {
  //     // Handle denied or permanently denied permission
  //     print('Location permission denied.');
  //   } else {
  //     // Permission granted, you can now get the location
  //     print('Location permission granted.');
  //   }
  // }

  Future<void> _getLocationPermission() async {
    var status = await Permission.location.request();
    if (status == PermissionStatus.denied || status == PermissionStatus.permanentlyDenied) {
      // Handle denied or permanently denied permission
      print('Location permission denied.');
    } else {
      // Permission granted, you can now get the location
      print('Location permission granted.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  Position position = await Geolocator.getCurrentPosition();
                  print(
                      'Location: ${position.latitude}, ${position.longitude}');
                  setState(() {
                    lat = position.latitude;
                    lng = position.longitude;
                  });
                },
                child: Text('Get Location'),
              ),
            ),
            Center(
              child: Text("Longitude: " + lng.toString()),
            ),
            Center(
              child: Text("Latitude: " + lat.toString()),
            )
          ],
        ));
  }
}
