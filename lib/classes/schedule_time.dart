class ScheduledTime {
  final String utc;
  final String local;

  ScheduledTime({required this.utc, required this.local});

  factory ScheduledTime.fromJson(Map<String, dynamic> json) {
    return ScheduledTime(utc: json['utc'], local: json['local']);
  }
}
