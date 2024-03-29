import 'package:sensors/sensors.dart';
import 'package:flutter/material.dart';

class Sensors extends StatefulWidget {
  const Sensors({Key? key}) : super(key: key);

  @override
  _SensorsState createState() => _SensorsState();
}

class _SensorsState extends State<Sensors> {
  List<double> _accelerometerValues = <double>[];
  List<double> _userAccelerometerValues = <double>[];
  List<double> _gyroscopeValues = <double>[];

  @override
  void initState() {
    super.initState();

    // Register listeners for sensor events
    accelerometerEvents.listen((AccelerometerEvent event) {
      if(mounted) {
        setState(() {
          _accelerometerValues = <double>[event.x, event.y, event.z];
        });
      }
    });

    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      if(mounted) {
        setState(() {
          _userAccelerometerValues = <double>[event.x, event.y, event.z];
        });
      }
    });

    gyroscopeEvents.listen((GyroscopeEvent event) {
      if(mounted) {
        setState(() {
          _gyroscopeValues = <double>[event.x, event.y, event.z];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Text('Accelerometer: $_accelerometerValues\n'),
          ),
          Center(
            child: Text('UserAccelerometer: $_userAccelerometerValues\n'),
          ),
          Center(
            child: Text('Gyroscope: $_gyroscopeValues\n'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
