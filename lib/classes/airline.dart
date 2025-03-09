class Airline {
  final String name;
  final String iata;
  final String icao;

  Airline({required this.name, required this.iata, required this.icao});

  factory Airline.fromJson(Map<String, dynamic> json) {
    return Airline(name: json['name'], iata: json['iata'], icao: json['icao']);
  }
}
