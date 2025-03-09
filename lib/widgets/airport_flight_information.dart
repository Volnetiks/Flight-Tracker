import 'package:flight_tracker/classes/airport.dart';
import 'package:flutter/material.dart';

class AirportFlightInformation extends StatelessWidget {
  const AirportFlightInformation({super.key, required this.airport});

  final Airport airport;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          airport.iata,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          airport.municipalityName,
          style: TextStyle(fontSize: 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "CEST (UTC+2)",
          style: TextStyle(color: Colors.grey, fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
