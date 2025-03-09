import 'package:flight_tracker/classes/location.dart';

class Airport {
  final String icao;
  final String iata;
  final String name;
  final String shortName;
  final String municipalityName;
  final Location location;
  final String countryCode;
  final String timeZone;

  Airport({
    required this.icao,
    required this.iata,
    required this.name,
    required this.shortName,
    required this.municipalityName,
    required this.location,
    required this.countryCode,
    required this.timeZone,
  });

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      icao: json['icao'],
      iata: json['iata'],
      name: json['name'],
      shortName: json['shortName'],
      municipalityName: json['municipalityName'],
      location: Location.fromJson(json['location']),
      countryCode: json['countryCode'],
      timeZone: json['timeZone'],
    );
  }
}
