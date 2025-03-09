class Position {
  String fr24Id;
  String flight;
  String callsign;
  double lat;
  double lon;
  int track;
  int alt;
  int gspeed;
  int vspeed;
  String squawk;
  DateTime timestamp;
  String source;
  String hex;
  String type;
  String reg;
  String paintedAs;
  String operatingAs;
  String origIata;
  String origIcao;
  String destIata;
  String destIcao;
  DateTime eta;

  Position({
    required this.fr24Id,
    required this.flight,
    required this.callsign,
    required this.lat,
    required this.lon,
    required this.track,
    required this.alt,
    required this.gspeed,
    required this.vspeed,
    required this.squawk,
    required this.timestamp,
    required this.source,
    required this.hex,
    required this.type,
    required this.reg,
    required this.paintedAs,
    required this.operatingAs,
    required this.origIata,
    required this.origIcao,
    required this.destIata,
    required this.destIcao,
    required this.eta,
  });

  factory Position.fromJson(Map<String, dynamic> json) {
    print(json);
    return Position(
      fr24Id: json['fr24_id'],
      flight: json['flight'],
      callsign: json['callsign'],
      lat: json['lat'],
      lon: json['lon'],
      track: json['track'],
      alt: json['alt'],
      gspeed: json['gspeed'],
      vspeed: json['vspeed'],
      squawk: json['squawk'],
      timestamp: DateTime.parse(json['timestamp']),
      source: json['source'],
      hex: json['hex'],
      type: json['type'],
      reg: json['reg'],
      paintedAs: json['painted_as'],
      operatingAs: json['operating_as'],
      origIata: json['orig_iata'],
      origIcao: json['orig_icao'],
      destIata: json['dest_iata'],
      destIcao: json['dest_icao'],
      eta: DateTime.parse(json['eta']),
    );
  }
}
