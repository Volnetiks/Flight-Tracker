import 'package:flight_tracker/classes/flight.dart';
import 'package:flight_tracker/widgets/airport_flight_information.dart';
import 'package:flight_tracker/widgets/hero_widget.dart';
import 'package:flight_tracker/widgets/progress_line.dart';
import 'package:flutter/material.dart';

class FlightState extends StatefulWidget {
  const FlightState({super.key, required this.flight});

  final Flight flight;

  @override
  State<FlightState> createState() => _FlightStateState();
}

class _FlightStateState extends State<FlightState> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          flex: 3,
          child: FlightTrackerHero(
            tag: 'departing-airport',
            child: AirportFlightInformation(
              airport: widget.flight.departure.airport,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              FlightTrackerHero(
                tag: 'in-flight-container',
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.green.withAlpha(50),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    widget.flight.status == "Departed"
                        ? "In Flight"
                        : widget.flight.status,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
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
              if (widget.flight.status == "Departed")
                FlightTrackerHero(
                  tag: 'flight-altitude-speed',
                  child: Text(
                    "KTS - FT",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: FlightTrackerHero(
            tag: 'arrival-airport',
            child: AirportFlightInformation(
              airport: widget.flight.arrival.airport,
            ),
          ),
        ),
      ],
    );
  }
}
