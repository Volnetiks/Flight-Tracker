import 'package:flight_tracker/widgets/image_hero.dart';
import 'package:flight_tracker/widgets/infos/flight_info_header.dart';
import 'package:flight_tracker/widgets/hero_widget.dart';
import 'package:flight_tracker/widgets/infos/flight_info_panel.dart';
import 'package:flight_tracker/widgets/infos/info_line.dart';
import 'package:flight_tracker/widgets/progress_line.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

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
                    FlightTrackerHeroImage(
                      tag: 'image',
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 150 * 3,
                          height: 70 * 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              "https://cdn.jetphotos.com/full/5/1432322_1739498699.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
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
                          leadValue: "456KTS",
                          endValue: "34.433FT",
                        ),
                        InfoLine(
                          leadIcon: Icon(Icons.satellite_alt_outlined),
                          leadText: "Squawk",
                          endIcon: Icon(Icons.west),
                          endText: "Course",
                          leadValuePremium: true,
                          endValue: "74°",
                        ),
                        InfoLine(
                          leadIcon: Icon(Icons.arrow_circle_up),
                          leadText: "Vertical Rate",
                          endIcon: Icon(Icons.source_outlined),
                          endText: "Data Source",
                          leadValuePremium: true,
                          endValuePremium: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            FlightInfoHeader(),
          ],
        ),
      ),
    );
  }
}
