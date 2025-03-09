import 'dart:async';

import 'package:flight_tracker/services/airport_data_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final String assetPath;
  final Widget nextScreen;

  const SplashScreen({
    super.key,
    required this.assetPath,
    required this.nextScreen,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AirportDataService _airportDataService = AirportDataService();
  String _loadingText = "Loading airport data...";
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      Timer.periodic(Duration(milliseconds: 100), (timer) {
        if (_airportDataService.isLoaded || !mounted) {
          timer.cancel();
          return;
        }

        setState(() {
          _progress = _airportDataService.loadingProgress;
          _loadingText = "Loading airports... ${(_progress * 100).toInt()}%";
        });
      });

      await _airportDataService.loadAirportsFromAsset(widget.assetPath);

      if (mounted) {
        setState(() {
          _loadingText = "Loading complete!";
          _progress = 1.0;
        });

        Future.delayed(Duration(milliseconds: 500), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => widget.nextScreen),
          );
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _loadingText = "Error loading data: $e";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(value: _progress),
            SizedBox(height: 20),
            Text(_loadingText),
          ],
        ),
      ),
    );
  }
}
