import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maplocation extends StatefulWidget {
  const Maplocation({super.key});

  @override
  State<Maplocation> createState() => _MaplocationState();
}

class _MaplocationState extends State<Maplocation> {
  @override
  static const LatLng curantlocation =
      LatLng(2.0588817528250436, 45.341241373306);

  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: curantlocation, zoom: 16)),
    );
  }
}
