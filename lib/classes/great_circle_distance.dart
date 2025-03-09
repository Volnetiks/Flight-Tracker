class GreatCircleDistance {
  final double meter;
  final double km;
  final double mile;
  final double nm;
  final double feet;

  GreatCircleDistance({
    required this.meter,
    required this.km,
    required this.mile,
    required this.nm,
    required this.feet,
  });

  factory GreatCircleDistance.fromJson(Map<String, dynamic> json) {
    return GreatCircleDistance(
      meter: json['meter'],
      km: json['km'],
      mile: json['mile'],
      nm: json['nm'],
      feet: json['feet'],
    );
  }
}
