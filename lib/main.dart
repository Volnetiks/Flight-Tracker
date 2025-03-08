import 'package:flight_tracker/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlightTracker());
}

class FlightTracker extends StatelessWidget {
  const FlightTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flight Tracker', home: const HomePage());
  }
}
