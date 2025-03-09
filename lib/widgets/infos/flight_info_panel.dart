import 'package:flight_tracker/widgets/infos/info_line.dart';
import 'package:flight_tracker/widgets/progress_line.dart';
import 'package:flutter/material.dart';

class FlightInfoPanel extends StatelessWidget {
  const FlightInfoPanel({
    super.key,
    required this.title,
    required this.infoLines,
    this.leadingWidget,
  });

  final Widget title;
  final List<InfoLine> infoLines;
  final Widget? leadingWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title,
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                if (leadingWidget != null)
                  Column(children: [leadingWidget!, SizedBox(height: 10)]),
                ...infoLines
                    .expand(
                      (item) => [
                        item,
                        SizedBox(
                          height: 25,
                          child: ProgressLine(
                            progress: 0,
                            dottedColor: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    )
                    .toList()
                  ..removeLast(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
