import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? position;
  GoogleMapController? mapController;
  static const mountainView = LatLng(37.4223, -122.0848);

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  _getCurrentLocation() async {
    final permission = await Geolocator.checkPermission();
    LocationPermission? locationPermission;
    if (permission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
    }
    if (locationPermission == LocationPermission.always) {
      position = await Geolocator.getCurrentPosition();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            mapController = controller;
          });
        },
        initialCameraPosition: CameraPosition(
            target: LatLng(position?.latitude ?? 0, position?.longitude ?? 0), zoom: 13),
        onLongPress: (argument) {
          setState(() {});
        },
        markers: {
          Marker(
            flat: true,
            draggable: true,
            visible: true,
            infoWindow: const InfoWindow(title: "Anjan", snippet: "snippet"),
            onDrag: (value) {
              setState(() {});
            },
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            markerId: const MarkerId("Andijan"),
            position: LatLng(position?.latitude ?? 0, position?.longitude ?? 0),
          ),
          Marker(
            flat: true,
            draggable: true,
            visible: true,
            infoWindow: const InfoWindow(title: "Robber", snippet: "snippet"),
            onDrag: (value) {
              setState(() {});
            },
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
            markerId: const MarkerId("Not Anjan"),
            position: LatLng(position?.latitude ?? 0, position?.longitude ?? 0),
          ),
        },
        onTap: (argument) {
          setState(() {});
        },
        buildingsEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        trafficEnabled: true,
        zoomControlsEnabled: true,
        rotateGesturesEnabled: true,
        mapToolbarEnabled: true,
        compassEnabled: true,
        indoorViewEnabled: true,
        mapType: MapType.satellite,
      ),
    );
  }
}
