import 'package:KrrishVerse/screens/EducationScreen/education_screen.dart';
import 'package:KrrishVerse/screens/ExperienceScreen/experience_screen.dart';
import 'package:KrrishVerse/screens/SkillsScreen/technical_skills_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AboutScreen/about_screen.dart';
import '../ContactScreen/contact_screen.dart';
import '../DetailScreen/details_screen.dart';
import '../MainScreen/main_screen.dart';
import '../ProjectList/projectListScreen.dart';
import 'projectController.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      themeMode: ThemeMode.dark,
      getPages: [
        GetPage(name: '/', page: () => MainScreen()),
        GetPage(name: '/projectDetail', page: () => ProjectDetailScreen()),
        GetPage(name: '/about', page: () => const AboutScreen()),
        GetPage(name: '/contact', page: () => ContactScreen()),
        GetPage(name: '/projectList', page: () => ProjectListScreen()),
        GetPage(name: '/Experience', page: ()=>ExperienceScreen()),
        GetPage(name: '/technicalSkills',page: ()=>SkillsScreen()),
        GetPage(name: '/Education', page: ()=>EducationScreen())// New project list route
      ],
      initialBinding: BindingsBuilder(() {
        Get.put(ProjectController());
      }),
    );
  }
}
