import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:intern_medx/src/models/doctor.dart';


class DoctorProvider extends ChangeNotifier {
  List<Doctor> _doctors = [];
  List<Doctor> _filteredDoctors = [];
  final List<int> _bookmarkedDoctorIds = [];
  int _selectedSortIndex = 0;

  // Bangalore location coordinates which are for the user's location
  double userLat = 12.9716;
  double userLon = 77.594566;

  List<Doctor> get filteredDoctors => _filteredDoctors;
  int get selectedSortIndex => _selectedSortIndex;

  DoctorProvider() {
    loadDoctors();
  }

  Future<void> loadDoctors() async {
    String data = await rootBundle.loadString('assets/data.json');
    final jsonResult = json.decode(data);
    _doctors = List<Doctor>.from(jsonResult['doctors'].map((x) => Doctor.fromJson(x)));
    _filteredDoctors = _doctors;
    // Notify listeners after data loading is finished
    notifyListeners();
  }



  void filterDoctors(String query) {
    _filteredDoctors = _doctors.where((doctor) {
      return doctor.name.toLowerCase().contains(query.toLowerCase()) ||
          doctor.specialization.toLowerCase().contains(query.toLowerCase());
    }).toList();
    notifyListeners();
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371; // Radius of the earth in kilometers
    double dLat = _degreesToRadians(lat2 - lat1);
    double dLon = _degreesToRadians(lon2 - lon1);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c; // Distance in kilometers
    return distance;
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  void sortDoctors(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        _filteredDoctors.sort((a, b) {
          var totalAvailableTimeA = a.availableTime.hours * 60 + a.availableTime.minutes;
          var totalAvailableTimeB = b.availableTime.hours * 60 + b.availableTime.minutes;
          return totalAvailableTimeA.compareTo(totalAvailableTimeB);
        });
        break;
      case 1:
        _filteredDoctors.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 2:
      // Implement sorting by nearest location
        _filteredDoctors.sort((a, b) {
          double distanceA = calculateDistance(userLat, userLon, a.location.latitude, a.location.longitude);
          double distanceB = calculateDistance(userLat, userLon, b.location.latitude, b.location.longitude);
          return distanceA.compareTo(distanceB);
        });
        filteredDoctors.sort((a, b) {
          double distanceA = calculateDistance(userLat, userLon, a.location.latitude, a.location.longitude);
          double distanceB = calculateDistance(userLat, userLon, b.location.latitude, b.location.longitude);
          return distanceA.compareTo(distanceB);
        });
        break;
      case 3:
        _filteredDoctors.sort((a, b) => _parseFees(a.fees).compareTo(_parseFees(b.fees)));
        break;
      case 4:
        _filteredDoctors.sort((a, b) => _parseFees(b.fees).compareTo(_parseFees(a.fees)));
        break;
    }
    _selectedSortIndex = selectedIndex;
    notifyListeners();
  }

  int _parseFees(String fees) {
    return int.parse(fees.replaceAll('\$', ''));
  }

  void toggleBookmark(int doctorId) {
    if (_bookmarkedDoctorIds.contains(doctorId)) {
      _bookmarkedDoctorIds.remove(doctorId);
    } else {
      _bookmarkedDoctorIds.add(doctorId);
    }
    notifyListeners();
  }

  bool isBookmarked(int doctorId) {
    return _bookmarkedDoctorIds.contains(doctorId);
  }
}
