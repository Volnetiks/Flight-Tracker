import 'package:flight_tracker/widgets/infos/premium_lock.dart';
import 'package:flutter/material.dart';

class InfoLine extends StatelessWidget {
  const InfoLine({
    super.key,
    required this.leadIcon,
    required this.leadText,
    required this.endIcon,
    required this.endText,
    this.leadValue = "",
    this.endValue = "",
    this.endValuePremium = false,
    this.leadValuePremium = false,
  });

  final Widget leadIcon;
  final String leadText;
  final String leadValue;
  final bool leadValuePremium;

  final Widget endIcon;
  final String endText;
  final String endValue;
  final bool endValuePremium;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 5,
              children: [
                leadIcon,
                Text(leadText, style: TextStyle(color: Colors.grey)),
              ],
            ),
            Row(
              spacing: 5,
              children: [
                endIcon,
                Text(endText, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leadValuePremium
                ? PremiumLock()
                : Text(
                  leadValue,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
            endValuePremium
                ? PremiumLock()
                : Text(endValue, style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }
}
