// ignore_for_file: prefer_collection_literals, avoid_print

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  static const String location = '/map';
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  LocationData? _locationData;
  LatLng photomarketLocation = const LatLng(
      30.628484217416954, 31.319353635617006); // Photomarket location
  late BitmapDescriptor customMarkerIcon; // Custom marker icon
  double customMarkerSize = 50.0; // Size of the custom marker icon

  @override
  void initState() {
    super.initState();
    _createCustomMarkerBitmap('lib/core/assets/images/mosque.png')
        .then((BitmapDescriptor icon) {
      setState(() {
        customMarkerIcon = icon;
        _getLocation();
      });
    });
  }

  Future<void> _getLocation() async {
    final location = Location();
    bool serviceEnabled;
    PermissionStatus permission;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // Location services are still not enabled
        return;
      }
    }

    permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        // Location permission not granted
        return;
      }
    }

    _locationData = await location.getLocation();
    if (_locationData != null) {
      setState(() {
        print(_locationData!.latitude);
        print(_locationData!.longitude);
        _updateMap(_locationData!.latitude!, _locationData!.longitude!);
      });
    }
  }

  void _updateMap(double lat, double long) {
    if (_controller != null) {
      _controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(lat, long),
            zoom: 15.0,
          ),
        ),
      );
    }
  }

  Future<BitmapDescriptor> _createCustomMarkerBitmap(
      String imageAssetPath) async {
    ByteData byteData = await rootBundle.load(imageAssetPath);
    Uint8List byteList =
        byteData.buffer.asUint8List(); // Convert List<int> to Uint8List
    return BitmapDescriptor.fromBytes(byteList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Location'),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(0, 0),
          zoom: 15.0,
        ),
        onMapCreated: (controller) {
          setState(() {
            _controller = controller;
            if (_locationData != null) {
              _updateMap(_locationData!.latitude!, _locationData!.longitude!);
            }
          });
        },
        markers: _locationData != null
            ? Set<Marker>.from([
                Marker(
                  markerId: const MarkerId('user_location'),
                  position: LatLng(
                      _locationData!.latitude!, _locationData!.longitude!),
                  infoWindow: const InfoWindow(
                    title: 'My Location',
                  ),
                ),
                Marker(
                  markerId: const MarkerId('photomarket_location'),
                  position: photomarketLocation,
                  infoWindow: const InfoWindow(
                    title: 'Photomarket',
                  ),
                  icon: customMarkerIcon != null
                      ? customMarkerIcon
                      : BitmapDescriptor
                          .defaultMarker, // Use the custom marker icon
                ),
              ])
            : Set<Marker>.identity(),
      ),
    );
  }
}
