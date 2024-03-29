import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intern_medx/src/provider/doctor_list_provider.dart';
import 'package:intern_medx/src/models/doctor.dart';


class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  DoctorCard(this.doctor);

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorProvider>(
      builder: (context, provider, child) {
        return Card(
          margin: const EdgeInsets.all(10),
          color: Colors.white,
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
                              provider.toggleBookmark(doctor.id);
                            },
                            child: Icon(
                              provider.isBookmarked(doctor.id)
                                  ? Icons.bookmark
                                  : Icons.bookmark_border_outlined,
                              color: provider.isBookmarked(doctor.id)
                                  ? Colors.blue
                                  : const Color.fromRGBO(107, 114, 128, 1),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Color.fromRGBO(209, 213, 219, 1),
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
                              color: Color.fromRGBO(107, 114, 128, 1)),
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
                                    color: Color.fromRGBO(254, 176, 82, 1)),
                                Text(
                                  ' ${doctor.rating}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            const VerticalDivider(
                              color: Color.fromRGBO(209, 213, 219, 1),
                              thickness: 1,
                            ),
                            Text(
                              '${doctor.reviews} Reviews',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(107, 114, 128, 1)),
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
      },
    );
  }
}

