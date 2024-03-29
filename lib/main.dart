// main.dart
import 'package:flutter/material.dart';
import 'package:intern_medx/src/screen/doctor_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:intern_medx/src/provider/doctor_list_provider.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DoctorProvider(), // Create an instance of DoctorProvider
      child: MaterialApp(
        title: 'medX',
        theme: ThemeData(
          // Your app's theme data
        ),
        home: DoctorListScreen(), // Set DoctorListScreen as the home screen
      ),
    );
  }
}
