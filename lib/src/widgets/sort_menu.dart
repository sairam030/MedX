import 'package:flutter/material.dart';
import 'package:intern_medx/src/common/colors.dart';

class SortMenu extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final Function(int) onSort;

  SortMenu({
    required this.options,
    required this.selectedIndex,
    required this.onSort,
  });

  @override
  Widget build(BuildContext context) {
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
                  onSort(index); // Call the callback function
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  color: selectedIndex == index ? Colors.blue.withOpacity(0.2) : null, // Apply blue filter for selected item
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        options[index],
                        style: TextStyle(
                          fontSize: 16,
                          color: selectedIndex == index ? AppColors.textColor : null, // Change text color for selected item
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      if (selectedIndex == index)
                        const Icon(Icons.check, color: AppColors.textColor), // Render check mark if selected
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
