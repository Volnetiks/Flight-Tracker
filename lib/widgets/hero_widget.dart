import 'package:flutter/material.dart';

class FlightTrackerHero extends StatelessWidget {
  const FlightTrackerHero({super.key, required this.child, required this.tag});

  final Widget child;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      flightShuttleBuilder: (
        BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext,
      ) {
        return SingleChildScrollView(child: fromHeroContext.widget);
      },
      child: Material(color: Colors.transparent, child: child),
    );
  }
}
