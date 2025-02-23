import 'package:KrrishVerse/res/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor, // Changed to dark shade
      body: Stack(
        children: [
          // Centered Text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hello \nthere!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.orbitron(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: AppColors.lightNeutral, // Changed to light neutral
                    letterSpacing: 5,
                    shadows: [
                      Shadow(
                        blurRadius: 15.0,
                        color: AppColors.white.withOpacity(0.8), // Changed to vibrant orange
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'I\'m Krrish Gulia',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.orbitron(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white, // Changed to vibrant orange
                    letterSpacing: 3,
                    shadows: [
                      Shadow(
                        blurRadius: 8.0,
                        color: AppColors.backgroundColor.withOpacity(0.6), // Changed to dark shade
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Floating Action Button to go to EducationScreen
          Positioned(
            bottom: 40.0,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: () {
                // Navigate to EducationScreen
                Get.toNamed('/about');
              },
              backgroundColor: AppColors.white, // Changed to vibrant orange
              child: const Icon(
                Icons.arrow_forward,
                color: AppColors.backgroundColor, // Changed to dark shade
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
