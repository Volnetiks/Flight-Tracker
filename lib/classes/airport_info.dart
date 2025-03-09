import 'package:flight_tracker/classes/airport.dart';
import 'package:flight_tracker/classes/schedule_time.dart';

class AirportInfo {
  final Airport airport;
  final ScheduledTime? scheduledTime;
  final ScheduledTime? revisedTime;
  final ScheduledTime? runwayTime;
  final ScheduledTime? predictedTime;
  final String? terminal;
  final String? runway;
  final List<String> quality;
  final String? checkInDesk;
  final String? gate;

  AirportInfo({
    required this.airport,
    required this.scheduledTime,
    this.revisedTime,
    this.runwayTime,
    this.predictedTime,
    this.terminal,
    this.runway,
    required this.quality,
    this.checkInDesk,
    this.gate,
  });

  factory AirportInfo.fromJson(Map<String, dynamic> json) {
    return AirportInfo(
      airport: Airport.fromJson(json['airport']),
      scheduledTime:
          json['scheduledTime'] != null
              ? ScheduledTime.fromJson(json['scheduledTime'])
              : null,
      revisedTime:
          json['revisedTime'] != null
              ? ScheduledTime.fromJson(json['revisedTime'])
              : null,
      runwayTime:
          json['runwayTime'] != null
              ? ScheduledTime.fromJson(json['runwayTime'])
              : null,
      predictedTime:
          json['predictedTime'] != null
              ? ScheduledTime.fromJson(json['predictedTime'])
              : null,
      terminal: json['terminal'],
      runway: json['runway'],
      quality: List<String>.from(json['quality']),
      checkInDesk: json['checkInDesk'],
      gate: json['gate'],
    );
  }
}
