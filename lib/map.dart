import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapScreenn extends StatefulWidget {
  const MapScreenn({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreenn> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};
  final LatLng _center = const LatLng(31.7917, -7.0926); // Coordonnées du centre du Maroc

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _getCurrentLocation() async {
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    final Placemark placemark = placemarks.first;

    setState(() {
      final LatLng currentPosition = LatLng(position.latitude, position.longitude);
      _markers.add(
        Marker(
          markerId: const MarkerId('current_position'),
          position: currentPosition,
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: 'Your Current Position',
            snippet: placemark.subLocality ?? placemark.locality,
          ),
        ),
      );
    });

    // Mettre à jour l'icône du marqueur
    await _updateMarkerIcon();
  }

  Future<void> _updateMarkerIcon() async {
    // Charger l'icône depuis les assets
    final BitmapDescriptor icon =
        await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/red_marker.png');

    setState(() {
      // Mettre à jour le marqueur avec l'icône chargée depuis les assets
      _markers.removeWhere((marker) => marker.markerId.value == 'current_position');
      _markers.add(
        Marker(
          markerId: const MarkerId('current_position'),
          position: _markers.first.position,
          icon: icon,
          infoWindow: const InfoWindow(
            title: 'Your Current Position',
          ),
        ),
      );
    });
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
        markers: _markers,
      ),
    );
  }
}
