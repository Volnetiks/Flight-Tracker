class Location {
  final double lat;
  final double lon;

  Location({required this.lat, required this.lon});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(lat: json['lat'], lon: json['lon']);
  }
}
