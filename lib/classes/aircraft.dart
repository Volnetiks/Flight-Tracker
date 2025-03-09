import 'package:flight_tracker/classes/image.dart';

class Aircraft {
  final String? reg;
  final String? modeS;
  final String model;
  final Image? image;

  Aircraft({this.reg, this.modeS, required this.model, this.image});

  factory Aircraft.fromJson(Map<String, dynamic> json) {
    return Aircraft(
      reg: json['reg'],
      modeS: json['modeS'],
      model: json['model'],
      image: json['image'] != null ? Image.fromJson(json['image']) : null,
    );
  }
}
