import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? _mapController;
  Marker? _currentMarker;
  Position? _lastPosition;

  final List<LatLng> _polylinePoints = [];
  final Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _startLocationTracking();
  }

  /// Fetch location every 10 seconds
  void _startLocationTracking() {
    Timer.periodic(const Duration(seconds: 10), (timer) async {
      Position position = await _getCurrentLocation();
      _updateLocation(position);
    });
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void _updateLocation(Position position) {
    LatLng newLatLng = LatLng(position.latitude, position.longitude);

    setState(() {
      _currentMarker = Marker(
        markerId: const MarkerId("current_location"),
        position: newLatLng,
        infoWindow: InfoWindow(
          title: "My current location",
          snippet:
          "Lat: ${position.latitude}, Lng: ${position.longitude}",
        ),
      );

      if (_lastPosition != null) {
        _polylinePoints.add(newLatLng);
        _polylines.add(
          Polyline(
            polylineId: const PolylineId("route"),
            points: _polylinePoints,
            width: 5,
            color: Colors.blue,
          ),
        );
      }

      _lastPosition = position;
    });

    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(newLatLng, 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Real-Time Location Tracker"),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(23.777176, 90.399452),
          zoom: 14,
        ),
        myLocationEnabled: true,
        markers: _currentMarker != null ? {_currentMarker!} : {},
        polylines: _polylines,
        onMapCreated: (controller) {
          _mapController = controller;
        },
      ),
    );
  }
}
