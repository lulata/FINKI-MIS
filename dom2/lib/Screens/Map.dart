import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location '),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            Position position = await Geolocator.getCurrentPosition();
            print('Location: ${position.latitude}, ${position.longitude}');
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
