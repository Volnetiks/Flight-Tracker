import 'package:flight_tracker/classes/airport.dart';
import 'package:flutter/services.dart';

class AirportDataService {
  static final AirportDataService _instance = AirportDataService._internal();
  factory AirportDataService() => _instance;

  AirportDataService._internal();

  List<Airport> airports = [];
  bool isLoaded = false;
  double loadingProgress = 0.0;

  Future<void> loadAirportsFromAsset(String assetPath) async {
    try {
      final data = await rootBundle.loadString(assetPath);
      final lines = data.split('\n');
      final totalLines = lines.length;

      airports.clear();
      loadingProgress = 0.0;

      for (int i = 0; i < lines.length; i++) {
        final line = lines[i];
        if (line.trim().isNotEmpty) {
          try {
            airports.add(Airport.fromString(line));
          } catch (e) {
            print('Warning: Failed to parse line: $line. Error: $e');
          }
        }

        loadingProgress = (i + 1) / totalLines;
      }

      isLoaded = true;
      print('Loaded ${airports.length} airports from asset file');
    } catch (e) {
      print('Error loading airports from asset: $e');
      rethrow;
    }
  }

  List<Airport> getAirportsByCountry(String country) {
    return airports
        .where(
          (airport) => airport.country.toLowerCase() == country.toLowerCase(),
        )
        .toList();
  }

  Airport? getAirportByIcao(String icao) {
    try {
      return airports.firstWhere(
        (airport) => airport.icao.toLowerCase() == icao.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
}
