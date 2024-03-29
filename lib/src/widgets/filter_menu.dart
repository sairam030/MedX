import 'package:flutter/material.dart';
import 'package:intern_medx/src/provider/doctor_list_provider.dart';
import 'package:provider/provider.dart';

class DoctorFilterBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Filter Doctors',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Gender:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilterChip(
                    label: const Text('Male'),
                    selected: provider.selectedGenderFilter == Gender.Male,
                    onSelected: (selected) {
                      provider.setGenderFilter(Gender.Male);
                    },
                  ),
                  FilterChip(
                    label: const Text('Female'),
                    selected: provider.selectedGenderFilter == Gender.Female,
                    onSelected: (selected) {
                      provider.setGenderFilter(Gender.Female);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
