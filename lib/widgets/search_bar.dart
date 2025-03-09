import 'package:flutter/material.dart';

class FlightTrackerSearchBar extends StatefulWidget {
  const FlightTrackerSearchBar({super.key});

  @override
  State<FlightTrackerSearchBar> createState() => _FlightTrackerSearchBarState();
}

class _FlightTrackerSearchBarState extends State<FlightTrackerSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(90),
        ),
        child: TextField(
          expands: true,
          maxLines: null,
          minLines: null,
          controller: _searchController,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: "Search flights...",
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
