import 'package:flight_tracker/classes/aircraft_old.dart';
import 'package:flight_tracker/classes/airline.dart';
import 'package:flight_tracker/classes/airport_info.dart';
import 'package:flight_tracker/classes/great_circle_distance.dart';

class Flight {
  final GreatCircleDistance greatCircleDistance;
  final AirportInfo departure;
  final AirportInfo arrival;
  final String lastUpdatedUtc;
  final String number;
  final String callSign;
  final String status;
  final String codeshareStatus;
  final bool isCargo;
  final Aircraft aircraft;
  final Airline airline;

  Flight({
    required this.greatCircleDistance,
    required this.departure,
    required this.arrival,
    required this.lastUpdatedUtc,
    required this.number,
    required this.callSign,
    required this.status,
    required this.codeshareStatus,
    required this.isCargo,
    required this.aircraft,
    required this.airline,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      greatCircleDistance: GreatCircleDistance.fromJson(
        json['greatCircleDistance'],
      ),
      departure: AirportInfo.fromJson(json['departure']),
      arrival: AirportInfo.fromJson(json['arrival']),
      lastUpdatedUtc: json['lastUpdatedUtc'],
      number: json['number'],
      callSign: json['callSign'] ?? '',
      status: json['status'],
      codeshareStatus: json['codeshareStatus'],
      isCargo: json['isCargo'],
      aircraft: Aircraft.fromJson(json['aircraft']),
      airline: Airline.fromJson(json['airline']),
    );
  }
}
