import 'dart:convert';
import 'dart:math';

import 'package:flight_tracker/classes/flight.dart';
import 'package:flight_tracker/classes/position.dart';
import 'package:flight_tracker/pages/info.dart';
import 'package:flight_tracker/widgets/expandable_snackbar.dart';
import 'package:flight_tracker/widgets/flight_state.dart';
import 'package:flight_tracker/widgets/image_hero.dart';
import 'package:flight_tracker/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Flight? flight;
  String data = "";

  @override
  void initState() {
    super.initState();
  }

  void retrieveFlightInfo(String flightNumber) async {
    String sandboxKey = "";

    Map<String, String> headers = {
      'Accept': 'application/json',
      'Accept-Version': 'v1',
      'Authorization': 'Bearer $sandboxKey',
    };

    try {
      final response = await http.get(
        Uri.parse(
          'https://fr24api.flightradar24.com/api/live/flight-positions/full?flights=$flightNumber',
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        Position position = Position.fromJson(data["data"][0]);

        if (flightNumber == "AF1247") {
          setState(() {
            List<dynamic> jsonList = [
              {
                "departure": {
                  "airport": {"name": "Warsaw"},
                  "quality": [],
                },
                "arrival": {
                  "airport": {
                    "icao": "LFPG",
                    "iata": "CDG",
                    "name": "Paris Charles de Gaulle",
                    "shortName": "Charles de Gaulle",
                    "municipalityName": "Paris",
                    "location": {"lat": 49.0128, "lon": 2.549999},
                    "countryCode": "FR",
                    "timeZone": "Europe/Paris",
                  },
                  "scheduledTime": {
                    "utc": "2025-03-09 08:10Z",
                    "local": "2025-03-09 09:10+01:00",
                  },
                  "terminal": "2F",
                  "quality": ["Basic"],
                },
                "lastUpdatedUtc": "2024-03-31 08:44Z",
                "number": "AF 1247",
                "status": "Unknown",
                "codeshareStatus": "Unknown",
                "isCargo": false,
                "aircraft": {
                  "model": "Airbus A220-300",
                  "image": {
                    "url":
                        "https://farm66.staticflickr.com/65535/52377416448_f5648e9903_z.jpg",
                    "webUrl":
                        "https://www.flickr.com/photos/58415659@N00/52377416448/",
                    "author": "kitmasterbloke",
                    "title":
                        "F-HZUH - CS300 / Airbus A220-300 - Air France CDG 180922",
                    "description":
                        "Changing planes from 2E-L to 2F and a bus gate to the J stands gave some good views of the AF/Hop domestic gates.",
                    "license": "AttributionCC",
                    "htmlAttributions": [
                      "Original of \"<span property='dc:title' itemprop='name'>F-HZUH - CS300 / Airbus A220-300 - Air France CDG 180922</span>\" by <a rel='dc:creator nofollow' property='cc:attributionName' href='https://www.flickr.com/photos/58415659@N00/52377416448/' target='_blank'><span itemprop='producer'>kitmasterbloke</span></a>.",
                      "Shared and hosted by <span itemprop='publisher'>Flickr</span> under <a target=\"_blank\" rel=\"license cc:license nofollow\" href=\"https://creativecommons.org/licenses/by/2.0/\">CC BY</a>",
                    ],
                  },
                },
                "airline": {"name": "Air France", "iata": "AF", "icao": "AFR"},
              },
              {
                "greatCircleDistance": {
                  "meter": 1346440.48,
                  "km": 1346.44,
                  "mile": 836.64,
                  "nm": 727.02,
                  "feet": 4417455.63,
                },
                "departure": {
                  "airport": {
                    "icao": "EPWA",
                    "iata": "WAW",
                    "name": "Warsaw Chopin",
                    "shortName": "Chopin",
                    "municipalityName": "Warsaw",
                    "location": {"lat": 52.1657, "lon": 20.9671},
                    "countryCode": "PL",
                    "timeZone": "Europe/Warsaw",
                  },
                  "scheduledTime": {
                    "utc": "2025-03-09 10:35Z",
                    "local": "2025-03-09 11:35+01:00",
                  },
                  "revisedTime": {
                    "utc": "2025-03-09 10:35Z",
                    "local": "2025-03-09 11:35+01:00",
                  },
                  "terminal": "C",
                  "checkInDesk": "201-206",
                  "gate": "37",
                  "quality": ["Basic", "Live"],
                },
                "arrival": {
                  "airport": {
                    "icao": "LFPG",
                    "iata": "CDG",
                    "name": "Paris Charles de Gaulle",
                    "shortName": "Charles de Gaulle",
                    "municipalityName": "Paris",
                    "location": {"lat": 49.0128, "lon": 2.549999},
                    "countryCode": "FR",
                    "timeZone": "Europe/Paris",
                  },
                  "predictedTime": {
                    "utc": "2025-03-09 12:55Z",
                    "local": "2025-03-09 13:55+01:00",
                  },
                  "quality": [],
                },
                "lastUpdatedUtc": "2025-03-09 11:46Z",
                "number": "AF 1247",
                "status": "Departed",
                "codeshareStatus": "IsOperator",
                "isCargo": false,
                "aircraft": {
                  "model": "Airbus A220-300",
                  "image": {
                    "url":
                        "https://farm66.staticflickr.com/65535/52377416448_f5648e9903_z.jpg",
                    "webUrl":
                        "https://www.flickr.com/photos/58415659@N00/52377416448/",
                    "author": "kitmasterbloke",
                    "title":
                        "F-HZUH - CS300 / Airbus A220-300 - Air France CDG 180922",
                    "description":
                        "Changing planes from 2E-L to 2F and a bus gate to the J stands gave some good views of the AF/Hop domestic gates.",
                    "license": "AttributionCC",
                    "htmlAttributions": [
                      "Original of \"<span property='dc:title' itemprop='name'>F-HZUH - CS300 / Airbus A220-300 - Air France CDG 180922</span>\" by <a rel='dc:creator nofollow' property='cc:attributionName' href='https://www.flickr.com/photos/58415659@N00/52377416448/' target='_blank'><span itemprop='producer'>kitmasterbloke</span></a>.",
                      "Shared and hosted by <span itemprop='publisher'>Flickr</span> under <a target=\"_blank\" rel=\"license cc:license nofollow\" href=\"https://creativecommons.org/licenses/by/2.0/\">CC BY</a>",
                    ],
                  },
                },
                "airline": {"name": "Air France", "iata": "AF", "icao": "AFR"},
              },
            ];

            flight = Flight.fromJson(jsonList.last, position);
          });
        } else if (flightNumber == "AF2") {
          setState(() {
            List<dynamic> jsonList = [
              {
                "greatCircleDistance": {
                  "meter": 5849319.91,
                  "km": 5849.32,
                  "mile": 3634.6,
                  "nm": 3158.38,
                  "feet": 19190682.13,
                },
                "departure": {
                  "airport": {
                    "icao": "LFPG",
                    "iata": "CDG",
                    "name": "Paris Charles de Gaulle",
                    "shortName": "Charles de Gaulle",
                    "municipalityName": "Paris",
                    "location": {"lat": 49.0128, "lon": 2.549999},
                    "countryCode": "FR",
                    "timeZone": "Europe/Paris",
                  },
                  "scheduledTime": {
                    "utc": "2025-03-09 07:30Z",
                    "local": "2025-03-09 08:30+01:00",
                  },
                  "revisedTime": {
                    "utc": "2025-03-09 07:56Z",
                    "local": "2025-03-09 08:56+01:00",
                  },
                  "runwayTime": {
                    "utc": "2025-03-09 07:56Z",
                    "local": "2025-03-09 08:56+01:00",
                  },
                  "terminal": "2E",
                  "runway": "08L",
                  "quality": ["Basic", "Live"],
                },
                "arrival": {
                  "airport": {
                    "icao": "KJFK",
                    "iata": "JFK",
                    "name": "New York John F Kennedy",
                    "shortName": "John F Kennedy",
                    "municipalityName": "New York",
                    "location": {"lat": 40.6398, "lon": -73.7789},
                    "countryCode": "US",
                    "timeZone": "America/New_York",
                  },
                  "scheduledTime": {
                    "utc": "2025-03-09 15:40Z",
                    "local": "2025-03-09 11:40-04:00",
                  },
                  "predictedTime": {
                    "utc": "2025-03-09 15:45Z",
                    "local": "2025-03-09 11:45-04:00",
                  },
                  "terminal": "1",
                  "quality": ["Basic"],
                },
                "lastUpdatedUtc": "2025-03-09 08:05Z",
                "number": "AF 2",
                "callSign": "AFR002",
                "status": "Departed",
                "codeshareStatus": "IsOperator",
                "isCargo": false,
                "aircraft": {
                  "reg": "F-HUVF",
                  "modeS": "39D2A5",
                  "model": "Airbus A350-900",
                  "image": {
                    "url":
                        "https://farm66.staticflickr.com/65535/51773701159_785d0b4157_z.jpg",
                    "webUrl":
                        "https://www.flickr.com/photos/48518396@N08/51773701159/",
                    "author": "Olivier CABARET",
                    "title": "Airbus A350-900 Flight test (F-WZNB) Air France",
                    "description": "",
                    "license": "AttributionCC",
                    "htmlAttributions": [
                      "Original of \"<span property='dc:title' itemprop='name'>Airbus A350-900 Flight test (F-WZNB) Air France</span>\" by  <a rel='dc:creator nofollow' property='cc:attributionName' href='https://www.flickr.com/photos/48518396@N08/51773701159/' target='_blank'><span itemprop='producer'>Olivier CABARET</span></a>.",
                      "Shared and hosted by <span itemprop='publisher'>Flickr</span> under <a target=\"_blank\" rel=\"license cc:license nofollow\" href=\"https://creativecommons.org/licenses/by/2.0/\">CC BY</a>",
                    ],
                  },
                },
                "airline": {"name": "Air France", "iata": "AF", "icao": "AFR"},
              },
            ];

            flight = Flight.fromJson(jsonList.last, position);
          });
        } else if (flightNumber == "CX250") {
          setState(() {
            List<dynamic> jsonList = [
              {
                "greatCircleDistance": {
                  "meter": 9647548.25,
                  "km": 9647.55,
                  "mile": 5994.71,
                  "nm": 5209.26,
                  "feet": 31652061.19,
                },
                "departure": {
                  "airport": {
                    "icao": "EGLL",
                    "iata": "LHR",
                    "name": "London Heathrow",
                    "shortName": "Heathrow",
                    "municipalityName": "London",
                    "location": {"lat": 51.4706, "lon": -0.461941},
                    "countryCode": "GB",
                    "timeZone": "Europe/London",
                  },
                  "scheduledTime": {
                    "utc": "2025-03-08 17:50Z",
                    "local": "2025-03-08 17:50+00:00",
                  },
                  "revisedTime": {
                    "utc": "2025-03-08 18:06Z",
                    "local": "2025-03-08 18:06+00:00",
                  },
                  "runwayTime": {
                    "utc": "2025-03-08 18:06Z",
                    "local": "2025-03-08 18:06+00:00",
                  },
                  "terminal": "3",
                  "checkInDesk": "C",
                  "runway": "09R",
                  "quality": ["Basic", "Live"],
                },
                "arrival": {
                  "airport": {
                    "icao": "VHHH",
                    "iata": "HKG",
                    "name": "Hong Kong Chek Lap Kok",
                    "shortName": "Chek Lap Kok",
                    "municipalityName": "Hong Kong",
                    "location": {"lat": 22.3089, "lon": 113.915},
                    "countryCode": "HK",
                    "timeZone": "Asia/Shanghai",
                  },
                  "scheduledTime": {
                    "utc": "2025-03-09 06:35Z",
                    "local": "2025-03-09 14:35+08:00",
                  },
                  "revisedTime": {
                    "utc": "2025-03-09 06:30Z",
                    "local": "2025-03-09 14:30+08:00",
                  },
                  "terminal": "1",
                  "gate": "N28",
                  "baggageBelt": "8",
                  "quality": ["Basic", "Live"],
                },
                "lastUpdatedUtc": "2025-03-09 06:38Z",
                "number": "CX 250",
                "callSign": "CPA250",
                "status": "Arrived",
                "codeshareStatus": "IsOperator",
                "isCargo": false,
                "aircraft": {
                  "reg": "B-KPF",
                  "modeS": "780212",
                  "model": "Boeing 777-300",
                  "image": {
                    "url":
                        "https://farm1.staticflickr.com/431/32569404176_b7e412a189_z.jpg",
                    "webUrl":
                        "https://www.flickr.com/photos/20476255@N00/32569404176/",
                    "author": "Riik@mctr",
                    "title": "CX/CPA Cathay Pacific Boeing 777 B-KQZ",
                    "description": "Manchester Airport (EGCC)",
                    "license": "AttributionShareAlikeCC",
                    "htmlAttributions": [
                      "Original of \"<span property='dc:title' itemprop='name'>CX/CPA Cathay Pacific Boeing 777 B-KQZ</span>\" by <a rel='dc:creator nofollow' property='cc:attributionName' href='https://www.flickr.com/photos/20476255@N00/32569404176/' target='_blank'><span itemprop='producer'>Riik@mctr</span></a>.",
                      "Shared and hosted by <span itemprop='publisher'>Flickr</span> under <a target=\"_blank\" rel=\"license cc:license nofollow\" href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC BY-SA</a>",
                    ],
                  },
                },
                "airline": {
                  "name": "Cathay Pacific",
                  "iata": "CX",
                  "icao": "CPA",
                },
              },
              {
                "greatCircleDistance": {
                  "meter": 9647548.25,
                  "km": 9647.55,
                  "mile": 5994.71,
                  "nm": 5209.26,
                  "feet": 31652061.19,
                },
                "departure": {
                  "airport": {
                    "icao": "EGLL",
                    "iata": "LHR",
                    "name": "London Heathrow",
                    "shortName": "Heathrow",
                    "municipalityName": "London",
                    "location": {"lat": 51.4706, "lon": -0.461941},
                    "countryCode": "GB",
                    "timeZone": "Europe/London",
                  },
                  "scheduledTime": {
                    "utc": "2025-03-09 17:50Z",
                    "local": "2025-03-09 17:50+00:00",
                  },
                  "terminal": "3",
                  "quality": ["Basic"],
                },
                "arrival": {
                  "airport": {
                    "icao": "VHHH",
                    "iata": "HKG",
                    "name": "Hong Kong Chek Lap Kok",
                    "shortName": "Chek Lap Kok",
                    "municipalityName": "Hong Kong",
                    "location": {"lat": 22.3089, "lon": 113.915},
                    "countryCode": "HK",
                    "timeZone": "Asia/Shanghai",
                  },
                  "scheduledTime": {
                    "utc": "2025-03-10 06:35Z",
                    "local": "2025-03-10 14:35+08:00",
                  },
                  "revisedTime": {
                    "utc": "2025-03-10 06:35Z",
                    "local": "2025-03-10 14:35+08:00",
                  },
                  "predictedTime": {
                    "utc": "2025-03-10 06:33Z",
                    "local": "2025-03-10 14:33+08:00",
                  },
                  "terminal": "1",
                  "quality": ["Basic", "Live"],
                },
                "lastUpdatedUtc": "2025-03-09 04:09Z",
                "number": "CX 250",
                "status": "Expected",
                "codeshareStatus": "IsOperator",
                "isCargo": false,
                "aircraft": {
                  "model": "Airbus A350-900",
                  "image": {
                    "url":
                        "https://farm5.staticflickr.com/4470/37237901474_dd2924d4f0_z.jpg",
                    "webUrl":
                        "https://www.flickr.com/photos/20476255@N00/37237901474/",
                    "author": "Riik@mctr",
                    "title": "CX/CPA Cathay Pacific Airbus A350 B-LRS",
                    "description": "Manchester Airport (EGCC)",
                    "license": "AttributionShareAlikeCC",
                    "htmlAttributions": [
                      "Original of \"<span property='dc:title' itemprop='name'>CX/CPA Cathay Pacific Airbus A350 B-LRS</span>\" by <a rel='dc:creator nofollow' property='cc:attributionName' href='https://www.flickr.com/photos/20476255@N00/37237901474/' target='_blank'><span itemprop='producer'>Riik@mctr</span></a>.",
                      "Shared and hosted by <span itemprop='publisher'>Flickr</span> under <a target=\"_blank\" rel=\"license cc:license nofollow\" href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC BY-SA</a>",
                    ],
                  },
                },
                "airline": {
                  "name": "Cathay Pacific",
                  "iata": "CX",
                  "icao": "CPA",
                },
              },
            ];

            flight = Flight.fromJson(jsonList.last, position);
          });
        }
      }
    } catch (e) {
      print(e);
    }

    // String url =
    //     "https://aerodatabox.p.rapidapi.com/flights/number/$flightNumber?withAircraftImage=true&withLocation=true";
    // const Map<String, String> headers = {
    //   'x-rapidapi-host': 'aerodatabox.p.rapidapi.com',
    //   'x-rapidapi-key': '',
    // };

    // try {
    //   final response = await http.get(Uri.parse(url), headers: headers);

    //   if (response.statusCode == 200) {
    //     Clipboard.setData(ClipboardData(text: response.body)).then((_) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text("Email address copied to clipboard")),
    //       );
    //     });
    //   } else {
    //     print("Request failed with status: ${response.statusCode}");
    //     print("Response body: ${response.body}");
    //   }
    // } catch (e) {
    //   print("Error: $e");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  SizedBox(height: 150),
                  GestureDetector(
                    onTap: () {
                      retrieveFlightInfo("AF2");
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.amber,
                      child: Text("CDG-JFK"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      retrieveFlightInfo("AF1247");
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.amber,
                      child: Text("WAW-CDG"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      retrieveFlightInfo("CX250");
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.amber,
                      child: Text("LHR-HKG"),
                    ),
                  ),
                  Text(data),
                ],
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Container(
                height: 50,
                child: Row(
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
              ),
            ),

            if (flight != null)
              DraggableScrollSheet(
                page: InfoPage(flight: flight!),
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
                        child: Text(
                          flight!.number,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      if (flight!.aircraft.reg != null)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.grey.withAlpha(100),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            flight!.aircraft.reg!,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 5),

                  Text(
                    flight!.airline.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    flight!.aircraft.model,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              if (flight!.aircraft.image != null)
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
                          flight!.aircraft.image!.url,
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
          FlightState(flight: flight!),
        ],
      ),
    );
  }
}
