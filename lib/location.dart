import 'dart:async';
import 'dart:math' show cos, sqrt, asin;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng _marocCenter = const LatLng(31.7917, -7.0926);
  late LatLng _currentPosition;
  final LatLng _position1 = const LatLng(32.2997, -9.2372);
  final LatLng _position2 = const LatLng(30.4333, -9.6);
  final Set<Marker> _markers = {};
  late LatLng _previousPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _previousPosition = _position1;
    _calculateDistance();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_position1.toString()),
          position: _position1,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId(_position2.toString()),
          position: _position2,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
      _markers.add(
        Marker(
          markerId: const MarkerId('current_position'),
          position: _currentPosition,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ),
      );
    });
  }

  Future<void> _getCurrentLocation() async {
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  double _calculateDistance() {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((_previousPosition.latitude - _position2.latitude) * p) / 2 +
        c(_position2.latitude * p) *
            c(_previousPosition.latitude * p) *
            (1 - c((_previousPosition.longitude - _position2.longitude) * p)) /
            2;
    var distance = 12742 * asin(sqrt(a));
    return distance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Google Maps Demo'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _marocCenter,
          zoom: 5.0,
        ),
        markers: _markers,
        polylines: {
          Polyline(
            polylineId: const PolylineId('trajectory'),
            color: const Color.fromARGB(255, 33, 150, 243),
            points: [_position1, _position2],
          ),
        },
      ),
    );
  }
}

