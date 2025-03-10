import 'dart:math';

import 'package:flight_tracker/classes/flight.dart';
import 'package:flight_tracker/widgets/hero_widget.dart';
import 'package:flight_tracker/widgets/infos/flight_info_header.dart';
import 'package:flight_tracker/widgets/infos/flight_info_panel.dart';
import 'package:flight_tracker/widgets/infos/info_line.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key, required this.flight});

  final Flight flight;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        title: Text("Air France"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 150),
                    SizedBox(height: 20),
                    FlightInfoPanel(
                      title: Row(
                        spacing: 5,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(90),
                            ),
                            child: Center(
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90),
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Live Information",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      infoLines: [
                        InfoLine(
                          leadIcon: Icon(Icons.speed),
                          endIcon: Icon(Icons.trending_up),
                          leadText: "Speed",
                          endText: "Altitude",
                          leadValue: "KTS",
                          endValue: "FT",
                        ),
                        InfoLine(
                          leadIcon: Icon(Icons.satellite_alt_outlined),
                          leadText: "Squawk",
                          endIcon: Transform.rotate(
                            angle: 0,
                            child: Icon(Icons.north),
                          ),
                          endText: "Course",
                          leadValuePremium: true,
                          endValue: "widget.flight.position.track°",
                          leadValue: "widget.flight.position.squawk",
                        ),
                        InfoLine(
                          leadIcon: Icon(Icons.arrow_circle_up),
                          leadText: "Vertical Rate",
                          endIcon: Icon(Icons.source_outlined),
                          endText: "Data Source",
                          leadValuePremium: true,
                          endValuePremium: true,
                          leadValue: "widget.flight.position.vspeedFT/min",
                          endValue: " widget.flight.position.source",
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    FlightInfoPanel(
                      title: Text(
                        "Departure",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      infoLines: [
                        InfoLine(
                          leadIcon: Icon(Icons.calendar_today_outlined),
                          endIcon: Icon(Icons.access_time_rounded),
                          leadText: "Date of Departure",
                          endText: "Departure Time",
                          leadValue: "March 8, 2025",
                          endValue: "1:15PM",
                        ),
                        InfoLine(
                          leadIcon: Icon(Icons.apartment_rounded),
                          leadText: "Airport",
                          endIcon: Icon(Icons.meeting_room_outlined),
                          endText: "Terminal",
                          endValue: "3 Ultimate",
                          leadValue: "Roissy-Charles-De-Gaulle",
                        ),
                        InfoLine(
                          leadIcon: Icon(Icons.airplane_ticket_outlined),
                          leadText: "Boarding",
                          endIcon: Icon(Icons.domain_outlined),
                          endText: "Gate",
                          leadValue: "12:30PM",
                          endValue: "13",
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    FlightInfoPanel(
                      title: Text(
                        "Arrival",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      infoLines: [
                        InfoLine(
                          leadIcon: Icon(Icons.calendar_today_outlined),
                          endIcon: Icon(Icons.access_time_rounded),
                          leadText: "Date of Arrival",
                          endText: "Arrival Time",
                          leadValue: "March 8, 2025",
                          endValue: "1:15PM",
                        ),
                        InfoLine(
                          leadIcon: Icon(Icons.apartment_rounded),
                          leadText: "Airport",
                          endIcon: Icon(Icons.meeting_room_outlined),
                          endText: "Terminal",
                          endValue: "3 Ultimate",
                          leadValue: "Newark Liberty International Airport",
                        ),
                        InfoLine(
                          leadIcon: Icon(Icons.luggage_outlined),
                          leadText: "Luggage",
                          endIcon: Icon(Icons.domain_outlined),
                          endText: "Gate",
                          leadValue: "12:30PM",
                          endValue: "13",
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    FlightInfoPanel(
                      leadingWidget: FlightTrackerHero(
                        tag: 'image',
                        child: Align(
                          alignment: Alignment.center,
                          child: AspectRatio(
                            aspectRatio: 150 / 70,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "https://cdn.jetphotos.com/full/5/1432322_1739498699.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        "Aircraft Information",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      infoLines: [
                        InfoLine(
                          leadIcon: Icon(Icons.pin_outlined),
                          endIcon: Icon(Icons.flight_outlined),
                          leadText: "Registration Number",
                          endText: "Aircraft Type",
                          leadValue: "F-HUVF",
                          endValue: "A350-900",
                        ),
                        InfoLine(
                          leadIcon: Icon(Icons.cake_outlined),
                          leadText: "Age",
                          endIcon: Icon(Icons.campaign_outlined),
                          endText: "ATC Callsign",
                          endValuePremium: true,
                          leadValuePremium: true,
                        ),
                        InfoLine(
                          leadIcon: Icon(Icons.airlines_outlined),
                          leadText: "Airline",
                          endIcon: Icon(Icons.flag_outlined),
                          endText: "Country",
                          leadValue: "Air France",
                          endValue: "France",
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
            FlightInfoHeader(flight: widget.flight),
          ],
        ),
      ),
    );
  }
}
