import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

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
      postLocationLogs(
        userCurrentLocation.latitude,
        userCurrentLocation.longitude,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text, style: Theme.of(context).textTheme.bodyLarge,));
  }

  Future<void> postLocationLogs(double latitude, double longitude) async {
    try {
      await http.get(
        Uri.parse(
          "https://ecom.onelap.in:8443/OnelapinBackendSpring-0.0.1-SNAPSHOT/user/print-location-logs?latitude=$latitude&longitude=$longitude",
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
