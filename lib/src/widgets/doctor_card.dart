import 'package:flutter/material.dart';
import 'package:intern_medx/src/common/colors.dart';
import 'package:intern_medx/src/models/doctor.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final bool isBookmarked;
  final Function(bool) toggleBookmark;

  DoctorCard({
    required this.doctor,
    required this.isBookmarked,
    required this.toggleBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 98,
              height: 98,
              margin: const EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(doctor.pic),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        doctor.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Toggle bookmark status
                          toggleBookmark(!isBookmarked);
                        },
                        child: Icon(
                          isBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_border_outlined,
                          color: isBookmarked
                              ? AppColors.blue
                              :  AppColors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: AppColors.dividerColor,
                    thickness: 1,
                  ),
                  Text(
                    doctor.specialization,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.school_outlined,
                          color: AppColors.secondaryTextColor),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          doctor.qualification,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: AppColors.accentColor),
                            Text(
                              ' ${doctor.rating}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const VerticalDivider(
                          color: AppColors.dividerColor,
                          thickness: 1,
                        ),
                        Text(
                          '${doctor.reviews} Reviews',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondaryTextColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
