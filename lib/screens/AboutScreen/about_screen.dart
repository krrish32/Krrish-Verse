import 'package:KrrishVerse/res/appColors.dart';
import 'package:KrrishVerse/res/appIcons.dart';
import 'package:KrrishVerse/res/appImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.softGreen, AppColors.lightNeutral],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Get.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * 0.05),
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(AppImages.profileImage),
                ),
                SizedBox(height: Get.height * 0.03),
                Text(
                  'Krrish Gulia',
                  style: GoogleFonts.orbitron(
                    fontSize: Get.width * 0.08,
                    fontWeight: FontWeight.bold,
                    color: AppColors.backgroundColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Get.height * 0.01),
                Text(
                  'Software Developer',
                  style: GoogleFonts.aBeeZee(
                    fontSize: Get.width * 0.05,
                    color: AppColors.backgroundColor.withOpacity(0.7),
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(
                  color: AppColors.softGreen,
                  thickness: 1,
                ),
                SizedBox(height: Get.height * 0.02),
                Text(
                  'I am a passionate software developer with experience in mobile and web development. I enjoy learning new technologies and working on innovative projects during my free time.'
                  ,style: GoogleFonts.aBeeZee(
                    fontSize: Get.width * 0.04,
                    color: AppColors.backgroundColor.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(
                  color: AppColors.softGreen,
                  thickness: 1,
                ),
                SizedBox(height: Get.height * 0.02),
                Text(
                  'Apart from coding, I love:',
                  style: GoogleFonts.orbitron(
                    fontSize: Get.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: AppColors.backgroundColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Get.height * 0.02),
                Text(
                  '• Playing Games\n'
                      '• Sketching\n'
                      '• Travelling',
                  style: GoogleFonts.aBeeZee(
                    fontSize: Get.width * 0.045,
                    color: AppColors.backgroundColor.withOpacity(0.8),
                  ),
                  textAlign: TextAlign.start,
                ),
                const Divider(
                  color: AppColors.softGreen,
                  thickness: 1,
                ),
                SizedBox(height: Get.height * 0.02),
                _buttonRow(context),
                SizedBox(height: Get.height * 0.04),
                _socialMediaLinks(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonRow(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _futuristicButton(context, 'Projects', '/projectList', Icons.code),
            SizedBox(width: Get.width * 0.1),
            _futuristicButton(context, 'Skills', '/technicalSkills', Icons.build),
          ],
        ),
        SizedBox(height: Get.height * 0.015),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _futuristicButton(context, 'Education', '/Education', Icons.school),
            SizedBox(width: Get.width * 0.1),
            _futuristicButton(context, 'Experience', '/Experience', Icons.work),
          ],
        ),
      ],
    );
  }

  Widget _futuristicButton(
      BuildContext context, String title, String route, IconData icon) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.softGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadowColor: AppColors.softGreen.withOpacity(0.5),
          elevation: 8,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: Get.width * 0.06, color: AppColors.backgroundColor),
              SizedBox(height: Get.height * 0.008),
              Text(
                title,
                style: GoogleFonts.orbitron(
                  fontSize: Get.width * 0.04,
                  fontWeight: FontWeight.bold,
                  color: AppColors.backgroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialMediaLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            _launchURL(Uri.parse('https://www.linkedin.com/in/krrish-gulia-8265a8208/'));
          },
          icon: Image.asset(
            AppIcons.linkedInIcon,
            scale: 1.5,
            color: AppColors.backgroundColor,
          ),
        ),
        SizedBox(width: Get.width * 0.05),
        IconButton(
          onPressed: () {
            _launchURL(Uri.parse('https://github.com/krrish32'));
          },
          icon: Image.asset(
            AppIcons.githubIcon,
            color: AppColors.backgroundColor,
            scale: 1.5,
          ),
        ),
      ],
    );
  }

  // Method to launch URL
  Future<void> _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
