class Airport {
  final String icao;
  final String iata;
  final String name;
  final String city;
  final String country;
  final double latDegrees;
  final double latMinutes;
  final double latSeconds;
  final String latDirection;
  final double longDegrees;
  final double longMinutes;
  final double longSeconds;
  final String longDirection;
  final int elevation;
  final double latitude;
  final double longitude;

  Airport({
    required this.icao,
    required this.iata,
    required this.name,
    required this.city,
    required this.country,
    required this.latDegrees,
    required this.latMinutes,
    required this.latSeconds,
    required this.latDirection,
    required this.longDegrees,
    required this.longMinutes,
    required this.longSeconds,
    required this.longDirection,
    required this.elevation,
    required this.latitude,
    required this.longitude,
  });

  factory Airport.fromString(String data) {
    final parts = data.split(':');

    if (parts.length < 16) {
      throw FormatException('Invalid airport data format: $data');
    }

    return Airport(
      icao: parts[0],
      iata: parts[1],
      name: parts[2],
      city: parts[3],
      country: parts[4],
      latDegrees: _parseDouble(parts[5]),
      latMinutes: _parseDouble(parts[6]),
      latSeconds: _parseDouble(parts[7]),
      latDirection: parts[8],
      longDegrees: _parseDouble(parts[9]),
      longMinutes: _parseDouble(parts[10]),
      longSeconds: _parseDouble(parts[11]),
      longDirection: parts[12],
      elevation: _parseInt(parts[13]),
      latitude: _parseDouble(parts[14]),
      longitude: _parseDouble(parts[15]),
    );
  }

  static double _parseDouble(String value) {
    if (value == 'U' || value.isEmpty) return 0.0;
    return double.parse(value);
  }

  static int _parseInt(String value) {
    if (value.isEmpty) return 0;
    return int.parse(value);
  }
}
