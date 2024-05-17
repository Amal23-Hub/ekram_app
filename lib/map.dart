import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenn extends StatefulWidget {
  const MapScreenn({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreenn> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(31.7917, -7.0926); // Coordonnées du centre du Maroc

  // List of locations of observations
  final List<LatLng> _observations = [
    const LatLng(31.6000, -7.6163), // Example observation 1
    const LatLng(32.3754, -6.3057), // Example observation 2
    const LatLng(30.4267, -9.6086), // Example observation 3
  ];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 6.0,
        ),
        markers: _observations.map((LatLng position) {
          return Marker(
            markerId: MarkerId(position.toString()),
            position: position,
            // You can customize the marker icon here
            // icon: BitmapDescriptor.defaultMarker,
            infoWindow: const InfoWindow(
              title: 'Observation',
              snippet: 'Details about the observation',
            ),
          );
        }).toSet(),
      ),
    );
  }
}
