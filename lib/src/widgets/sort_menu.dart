import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern_medx/src/provider/doctor_list_provider.dart';
import 'package:provider/provider.dart';

class SortMenu extends StatelessWidget {
  final List<String> options = [
    'Earliest Available',
    'Highest Rating',
    'Nearest',
    'Fee: Low to High',
    'Fee: High to Low',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Sort By',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 36,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context); // Close the bottom sheet
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(), // Add a divider line
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      provider.sortDoctors(index);
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      color: provider.selectedSortIndex == index ? Colors.blue.withOpacity(0.2) : null, // Add blue filter for selected item
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            options[index],
                            style: const TextStyle(fontSize: 16, color: Colors.black),
                            textAlign: TextAlign.start,
                          ),
                          if (provider.selectedSortIndex == index)
                            Icon(Icons.check, color: Colors.black), // Render check mark if selected
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
