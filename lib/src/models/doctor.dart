// doctor.dart
class Doctor {
  final int id;
  final String name;
  final String pic;
  final String specialization;
  final String qualification;
  final double rating;
  final int reviews;
  final Location location;
  final Time availableTime;
  final String fees;
  final String gender; // New field for gender

  Doctor({
    required this.id,
    required this.name,
    required this.pic,
    required this.specialization,
    required this.qualification,
    required this.rating,
    required this.reviews,
    required this.location,
    required this.availableTime,
    required this.fees,
    required this.gender, // Added gender to constructor
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      pic: json['pic'],
      specialization: json['specialization'],
      qualification: json['qualification'],
      rating: json['rating'].toDouble(),
      reviews: json['reviews'],
      location: Location.fromJson(json['location']),
      availableTime: Time.fromJson(json['available_time']),
      fees: json['fees'],
      gender: json['gender'], // Assigning gender from JSON
    );
  }
}

// location.dart
class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

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
