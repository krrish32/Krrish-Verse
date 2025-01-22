import 'package:KrrishVerse/res/appColors.dart';
import 'package:KrrishVerse/res/appIcons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsScreen extends StatelessWidget {
  final Map<String, List<Map<String, String>>> categorizedSkills = {
    'Frameworks': [
      {'name': 'Flutter', 'icon': AppIcons.flutterIcon},
      {'name': 'React', 'icon': AppIcons.reactIcon},
      {'name': 'Tailwind CSS', 'icon': AppIcons.tailwindcssIcon},
    ],
    'Backend': [
      {'name': 'Node.js', 'icon': AppIcons.nodejsIcon},
      {'name': 'MySQL', 'icon': AppIcons.mysqlIcon},
    ],
    'Tools': [
      {'name': 'Firebase', 'icon': AppIcons.firebaseIcon},
      {'name':'Git & Github', 'icon':AppIcons.githubIcon}
    ],
  };

  SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.lightNeutral, // Changed to light neutral
        ),
        title: Text(
          'Skills',
          style: GoogleFonts.orbitron(
            color: AppColors.lightNeutral, // Changed to light neutral
            fontSize: Get.width * 0.06,
          ),
        ),
        backgroundColor: AppColors.backgroundColor, // Changed to dark shade
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.backgroundColor, AppColors.lightNeutral], // Changed to use dark shade and light neutral
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.04,
            vertical: Get.height * 0.02,
          ),
          child: ListView(
            children: [
              ...categorizedSkills.entries.map((entry) {
                return _buildCategorySection(
                  category: entry.key,
                  skills: entry.value,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection({
    required String category,
    required List<Map<String, String>> skills,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: GoogleFonts.orbitron(
            fontSize: Get.width * 0.06,
            fontWeight: FontWeight.bold,
            color: AppColors.softGreen, // Changed to vibrant color
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        Wrap(
          spacing: Get.width * 0.03,
          runSpacing: Get.height * 0.02,
          children: skills.map((skill) {
            return _buildSkillCard(
              name: skill['name']!,
              iconPath: skill['icon']!,
            );
          }).toList(),
        ),
        SizedBox(height: Get.height * 0.03),
      ],
    );
  }

  Widget _buildSkillCard({
    required String name,
    required String iconPath,
  }) {
    return Container(
      width: Get.width * 0.3, // Adjust width for responsive layout
      decoration: BoxDecoration(
        color: AppColors.lightNeutral, // Changed to light neutral
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.backgroundColor.withOpacity(0.5),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(Get.width * 0.04),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              iconPath,
              height: Get.width * 0.10,
              width: Get.width * 0.10,
              fit: BoxFit.cover,
            ),
            SizedBox(height: Get.height * 0.01),
            Text(
              name,
              style: GoogleFonts.orbitron(
                fontSize: Get.width * 0.040,
                fontWeight: FontWeight.bold,
                color: AppColors.backgroundColor, // Changed to dark shade for contrast
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
