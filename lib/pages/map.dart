import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapLocation extends StatefulWidget {
  const MapLocation({Key? key}) : super(key: key);

  @override
  State<MapLocation> createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  final LatLng _initialPosition = const LatLng(2.0588817528250436, 45.341241373306);
  final LatLng _nearestPosition = const LatLng(2.037910453300025, 45.30102193345663);
  Location location = Location();
  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.onLocationChanged.listen((LocationData currentLocationData) {
      if (currentLocationData.latitude != null && currentLocationData.longitude != null) {
        setState(() {
          _currentLocation = LatLng(currentLocationData.latitude!, currentLocationData.longitude!);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentLocation!,
          zoom: 13,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("initialPosition"),
            icon: BitmapDescriptor.defaultMarker,
            position: _currentLocation!,
          ),
          Marker(
            markerId: const MarkerId("nearestPosition"),
            icon: BitmapDescriptor.defaultMarker,
            position: _nearestPosition,
          ),
        },
      ),
    );
  }
}
