import 'package:flight_tracker/widgets/expandable_snackbar.dart';
import 'package:flight_tracker/widgets/flight_state.dart';
import 'package:flight_tracker/widgets/image_hero.dart';
import 'package:flight_tracker/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        spacing: 10,
                        children: [
                          FlightTrackerSearchBar(),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                            child: Icon(
                              Icons.person_outline_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            DraggableScrollSheet(
              previewContent: _buildPreviewContent(),
              handleColor: Colors.grey.withAlpha(128),
              minHeight: 250,
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviewContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.withAlpha(100)),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Text("AF62", style: TextStyle(fontSize: 12)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.withAlpha(100)),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Text("F-HUVF", style: TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),

                  Text(
                    "Air France",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "A350-900",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              FlightTrackerHeroImage(
                tag: "image",
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 150,
                    height: 70,
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
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 5),
          FlightState(),
        ],
      ),
    );
  }
}
