import 'package:KrrishVerse/res/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationScreen extends StatelessWidget {
  final List<Map<String, String>> educationDetails = [
    {
      'degree': 'Master of Computer Applications',
      'institution': 'JB Knowledge Park, Faridabad',
      'duration': '2023 - 2025',
      'score': 'CGPA: 7.5',
    },
    {
      'degree': 'Bachelor of Computer Applications',
      'institution': 'J.C. Bose University of Science and Technology, YMCA',
      'duration': '2020 - 2023',
      'score': 'CGPA: 8.2',
    },
    {
      'degree': '12th Grade',
      'institution': 'Shreeram Model School',
      'duration': '2019 - 2020',
      'score': '78%',
    },
    {
      'degree': '10th Grade',
      'institution': 'Shreeram Model School',
      'duration': '2017 - 2018',
      'score': '57%',
    },
  ];

  EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: AppColors.white
        ),
        title: Text(
          'Education',
          style: GoogleFonts.orbitron(
            color: AppColors.white,
            fontSize: Get.width * 0.06,
          ),
        ),
        backgroundColor: AppColors.backgroundColor,  // Changed to Dark Shade
      ),
      body: Container(
        color: AppColors.backgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.04,
            vertical: Get.height * 0.01,
          ),
          child: ListView(
            children: [
              Wrap(
                spacing: Get.width * 0.03,
                runSpacing: Get.height * 0.02,
                children: educationDetails.map((education) {
                  return _buildEducationCard(
                    degree: education['degree']!,
                    institution: education['institution']!,
                    duration: education['duration']!,
                    score: education['score']!,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEducationCard({
    required String degree,
    required String institution,
    required String duration,
    required String score,
  }) {
    return Container(
      width: Get.width * 0.9, // Adjust width for consistent layout
      decoration: BoxDecoration(
        color: AppColors.white,  // Changed to Light Neutral
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.white.withOpacity(0.5),  // Changed to Vibrant Orange
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(Get.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              degree,
              style: GoogleFonts.orbitron(
                fontSize: Get.width * 0.05,
                fontWeight: FontWeight.bold,
                color: AppColors.backgroundColor,  // Changed to Vibrant Orange
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            Text(
              institution,
              style: GoogleFonts.aBeeZee(
                fontSize: Get.width * 0.045,
                color: AppColors.backgroundColor.withOpacity(0.7),  // Changed to Dark Shade
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            Text(
              duration,
              style: GoogleFonts.aBeeZee(
                fontSize: Get.width * 0.04,
                color: AppColors.backgroundColor.withOpacity(0.7),  // Changed to Dark Shade
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            Text(
              score,
              style: GoogleFonts.aBeeZee(
                fontSize: Get.width * 0.04,
                fontWeight: FontWeight.bold,
                color: AppColors.backgroundColor,  // Changed to Dark Shade
              ),
            ),
          ],
        ),
      ),
    );
  }
}
