import 'package:KrrishVerse/res/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectListScreen extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {
      'title': 'Portfolio App',
      'description': 'A personal portfolio showcasing my skills and projects.',
    },
    {
      'title': 'EdTech Platform',
      'description': 'A mobile app for learning and purchasing technology courses.',
    },
    {
      'title': 'Bingo Game',
      'description': 'A 3x3 Bingo game built using Flutter.',
    },
    {
      'title': 'E-commerce App',
      'description': 'A platform for online shopping with payment gateway integration.',
    },
  ];

  ProjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.lightNeutral
        ),
        title: Text(
          'Projects',
          style: GoogleFonts.orbitron(
            color: AppColors.lightNeutral, // Changed to light neutral
            fontSize: Get.width * 0.06,
          ),
        ),
        backgroundColor: AppColors.backgroundColor, // Changed to dark shade
      ),
      body: Container(
        decoration: const BoxDecoration(
            color :AppColors.backgroundColor
        ),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.04,
            vertical: Get.height * 0.02,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return _buildProjectCard(
              title: projects[index]['title']!,
              description: projects[index]['description']!,
            );
          },
        ),
      ),
    );
  }

  Widget _buildProjectCard({required String title, required String description}) {
    return Card(
      elevation: 6,
      shadowColor: AppColors.softGreen.withOpacity(0.5), // Changed to vibrant color for shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(bottom: Get.height * 0.02),
      child: Container(
        padding: EdgeInsets.all(Get.width * 0.04),
        decoration: BoxDecoration(
          color: AppColors.lightNeutral, // Changed to light neutral
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.orbitron(
                fontSize: Get.width * 0.05,
                fontWeight: FontWeight.bold,
                color: AppColors.softGreen, // Changed to vibrant color
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            Text(
              description,
              style: GoogleFonts.aBeeZee(
                fontSize: Get.width * 0.04,
                color: AppColors.backgroundColor.withOpacity(0.8), // Changed to dark shade for description
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    'Coming Soon',
                    'Details for $title will be added shortly!',
                    backgroundColor: AppColors.lightNeutral,
                    colorText: AppColors.backgroundColor,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.softGreen, // Changed to vibrant color for button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'View Details',
                  style: GoogleFonts.aBeeZee(
                    color: Colors.white,
                    fontSize: Get.width * 0.04,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}