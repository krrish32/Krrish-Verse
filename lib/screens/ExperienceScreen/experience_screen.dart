import 'package:KrrishVerse/res/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceScreen extends StatelessWidget {
  final List<Map<String, String>> experiences = [
    {
      'position': 'Associate Software Developer',
      'company': 'Indoqubix Cloudtech Private Limited',
      'duration': 'Jan 2024 - Present',
      'details':
      'Developed and maintained mobile and web applications using Flutter, Node.js, and MySQL. Integrated SAP Gigya SDK for authentication.'
    },
    {
      'position': 'Intern',
      'company': 'Indoqubix Cloudtech Private Limited',
      'duration': 'Jul 2023 - Dec 2023',
      'details':
      'Learned Agile methodologies, worked on real-world projects, and gained experience in API development and state management.'
    },
  ];

  ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.white
        ),
        title: Text(
          'Experience',
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
            vertical: Get.height * 0.02,
          ),
          child: ListView(
            children: experiences.map((experience) {
              return _buildExperienceCard(
                position: experience['position']!,
                company: experience['company']!,
                duration: experience['duration']!,
                details: experience['details']!,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceCard({
    required String position,
    required String company,
    required String duration,
    required String details,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: Get.height * 0.02),
      padding: EdgeInsets.all(Get.width * 0.04),
      decoration: BoxDecoration(
        color: AppColors.white,  // Changed to Light Neutral
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            position,
            style: GoogleFonts.orbitron(
              fontSize: Get.width * 0.05,
              fontWeight: FontWeight.bold,
              color: AppColors.backgroundColor,  // Changed to Vibrant Orange
            ),
          ),
          SizedBox(height: Get.height * 0.01),
          Text(
            company,
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
              fontStyle: FontStyle.italic,
              color: AppColors.backgroundColor.withOpacity(0.7),  // Changed to Dark Shade
            ),
          ),
          SizedBox(height: Get.height * 0.02),
          Text(
            details,
            style: GoogleFonts.aBeeZee(
              fontSize: Get.width * 0.04,
              color: AppColors.backgroundColor,  // Changed to Dark Shade
            ),
          ),
        ],
      ),
    );
  }
}
