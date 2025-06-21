import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class BestCapital extends StatefulWidget {
  const BestCapital({super.key});

  @override
  State<BestCapital> createState() => _BestCapitalState();
}

class _BestCapitalState extends State<BestCapital> {
  String text = "Welcome to Best Capital";
  @override
  void initState() {
    super.initState();
    _fetchUserCurrentLocation();
  }

  Future<void> _fetchUserCurrentLocation() async {
    if (await Geolocator.isLocationServiceEnabled()) {
      await Geolocator.requestPermission();
      Position userCurrentLocation = await Geolocator.getCurrentPosition();
      print('${userCurrentLocation.latitude}, ${userCurrentLocation.longitude}');
      if (mounted) {
        setState(() {
          text =
              "current position: Latitude => ${userCurrentLocation.latitude}, Longitude => ${userCurrentLocation.longitude}";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
