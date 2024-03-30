// time.dart
class Time {
  final int hours;
  final int minutes;

  Time({required this.hours, required this.minutes});

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      hours: json['hours'],
      minutes: json['minutes'],
    );
  }
}
