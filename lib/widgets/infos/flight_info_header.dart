import 'package:flight_tracker/classes/flight.dart';
import 'package:flight_tracker/widgets/airport_flight_information.dart';
import 'package:flight_tracker/widgets/hero_widget.dart';
import 'package:flight_tracker/widgets/progress_line.dart';
import 'package:flutter/material.dart';

class FlightInfoHeader extends StatelessWidget {
  const FlightInfoHeader({super.key, required this.flight});

  final Flight flight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      height: 150,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              spacing: 5,
              children: [
                FlightTrackerHero(
                  tag: 'departing-airport',
                  child: AirportFlightInformation(
                    airport: flight.departure.airport,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    "Departed 12 mins ago",
                    style: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              spacing: 10,
              children: [
                FlightTrackerHero(
                  tag: 'flight-progress-line',
                  child: SizedBox(
                    height: 45,
                    child: ProgressLine(
                      progress: 0.25,
                      lineColor: Colors.green,
                      dottedColor: Colors.grey,
                      icon: Icons.flight,
                      iconColor: Colors.green,
                      quarterTurns: 1,
                      iconSize: 30,
                    ),
                  ),
                ),
                FlightTrackerHero(
                  tag: 'flight-altitude-speed',
                  child: Text(
                    "KTS - FT",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                FlightTrackerHero(
                  tag: 'in-flight-container',
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.green.withAlpha(50),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      flight.status == "Departed" ? "In Flight" : flight.status,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              spacing: 5,
              children: [
                FlightTrackerHero(
                  tag: 'arrival-airport',
                  child: AirportFlightInformation(
                    airport: flight.arrival.airport,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    "Arriving in 1 hr 3 mins",
                    style: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
