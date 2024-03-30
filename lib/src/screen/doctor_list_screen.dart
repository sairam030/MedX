import 'package:flutter/material.dart';
import 'package:intern_medx/src/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:intern_medx/src/provider/doctor_list_provider.dart';
import 'package:intern_medx/src/widgets/doctor_card.dart';
import 'package:intern_medx/src/widgets/sort_menu.dart';

class DoctorListScreen extends StatelessWidget {

  final List<String> sortOptions = [
    'Earliest Available',
    'Highest Rating',
    'Nearest',
    'Fee: Low to High',
    'Fee: High to Low',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Our doctors', style: TextStyle(color:AppColors.whiteColor)),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Search Bar
            Consumer<DoctorProvider>(
              builder: (context, provider, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(28),
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          color: AppColors.searchBarColor,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          const Icon(Icons.search, color: AppColors.secondaryTextColor),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              onChanged: (query) {
                                provider.filterDoctors(query);
                              },
                              decoration: const InputDecoration(
                                hintText: 'Enter a keyword',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 10),

            // Buttons Row
// Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible( // Use Flexible instead of Expanded
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Consumer<DoctorProvider>(
                      builder: (context, provider, child) {
                        return Text(
                          '${provider.filteredDoctors.length} Doctors',
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            letterSpacing: 0.15,
                            color: AppColors.textColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.scaffoldBackgroundColor,
                        border: Border.all(color: AppColors.secondaryTextColor, width: 1),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 6),
                          Icon(Icons.filter_alt_outlined, color: AppColors.secondaryTextColor),
                          SizedBox(width: 4),
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.15,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                          SizedBox(width: 6),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SortMenu(
                              selectedIndex: Provider.of<DoctorProvider>(context, listen: false).selectedSortIndex,
                              options: sortOptions,
                              onSort: (index) {
                                Provider.of<DoctorProvider>(context, listen: false).sortDoctors(index);
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                          border: Border.all(color:AppColors.secondaryTextColor, width: 1),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(width: 6),
                            Icon(Icons.sort, color: AppColors.secondaryTextColor),
                            SizedBox(width: 4),
                            Text(
                              'Sort',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.15,
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                            SizedBox(width: 6),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Doctor List
            Expanded(
              child: Consumer<DoctorProvider>(
                builder: (context, provider, child) {
                  return RefreshIndicator(
                    onRefresh: () => Future<void>.value(provider.loadDoctors()), // Wrap in Future.value
                    child: ListView.builder(
                      itemCount: provider.filteredDoctors.length,
                      itemBuilder: (context, index) {
                        return DoctorCard(
                          doctor: provider.filteredDoctors[index],
                          isBookmarked: provider.isBookmarked(provider.filteredDoctors[index].id),
                          toggleBookmark: (bool isBookmarked) {
                            provider.toggleBookmark(provider.filteredDoctors[index].id);
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}