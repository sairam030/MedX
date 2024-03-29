import 'package:flutter/material.dart';
import 'package:intern_medx/src/widgets/filter_menu.dart';
import 'package:provider/provider.dart';
import 'package:intern_medx/src/provider/doctor_list_provider.dart';
import 'package:intern_medx/src/widgets/doctor_card.dart';
import 'package:intern_medx/src/widgets/sort_menu.dart';

class DoctorListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Our doctors', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromRGBO(63, 92, 184, 1),
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          color: const Color.fromRGBO(233, 233, 233, 1),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          const Icon(Icons.search, color: Color.fromRGBO(107, 114, 128, 1)),
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

            SizedBox(height: 10),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
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
                          color: Colors.black,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return DoctorFilterBottomSheet();
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                            border: Border.all(color: Color.fromRGBO(107, 114, 128, 1), width: 1),
                          ),
                          child: const Row(
                            children: [
                              SizedBox(width: 6),
                              Icon(Icons.filter_alt_outlined, color: Color.fromRGBO(107, 114, 128, 1)),
                              SizedBox(width: 4),
                              Text(
                                'Filter',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.15,
                                  color: Color.fromRGBO(107, 114, 128, 1),
                                ),
                              ),
                              SizedBox(width: 6),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SortMenu();
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                            border: Border.all(color: Color.fromRGBO(107, 114, 128, 1), width: 1),
                          ),
                          child: const Row(
                            children: [
                              SizedBox(width: 6),
                              Icon(Icons.sort, color: Color.fromRGBO(107, 114, 128, 1)),
                              SizedBox(width: 4),
                              Text(
                                'Sort',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.15,
                                  color: Color.fromRGBO(107, 114, 128, 1),
                                ),
                              ),
                              SizedBox(width: 6),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            // Doctor List
            Expanded(
              child: Consumer<DoctorProvider>(
                builder: (context, provider, child) {
                  return RefreshIndicator(
                    onRefresh: () => Future<void>.value(provider.loadDoctors()), // Wrap in Future.value
                    child: ListView.builder(
                      itemCount: provider.filteredDoctors.length,
                      itemBuilder: (context, index) {
                        return DoctorCard(provider.filteredDoctors[index]);
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
