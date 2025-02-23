import 'package:KrrishVerse/res/appColors.dart';
import 'package:KrrishVerse/screens/DetailScreen/details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadmeScreen extends StatelessWidget {
  final String projectName;

  const ReadmeScreen({super.key, required this.projectName});

  @override
  Widget build(BuildContext context) {
    final DetailsScreenController controller = Get.put(DetailsScreenController());

    // Set project name and fetch README
    controller.setProjectName(projectName);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
        title: Obx(() {
          String extractedTitle = _extractReadmeHeading(controller.readmeContent.value);
          return Text(
            extractedTitle.isNotEmpty ? extractedTitle : projectName,
            style: GoogleFonts.orbitron(fontWeight: FontWeight.bold, color: Colors.white),
          );
        }),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: Colors.white));
        }

        return Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: MarkdownBody(
              data: _addSpacing(controller.readmeContent.value),
              styleSheet: MarkdownStyleSheet(
                h1: GoogleFonts.orbitron(
                    color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                h2: GoogleFonts.orbitron(
                    color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                h3: GoogleFonts.orbitron(
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                p: GoogleFonts.aBeeZee(
                    fontSize: Get.width * 0.04,
                    color: AppColors.lightNeutral.withOpacity(0.8)), // Dark shade for description
                code: GoogleFonts.aBeeZee(
                    color: Colors.white70, backgroundColor: Colors.black54),
                blockquote: GoogleFonts.aBeeZee(
                    color: AppColors.white.withOpacity(0.1), fontStyle: FontStyle.italic),
                listBullet: GoogleFonts.orbitron( // Highlight bullet points
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }),
    );
  }

  // Extract the first heading (e.g., # Project Title) from README
  String _extractReadmeHeading(String content) {
    final RegExp regex = RegExp(r'^#\s(.+)', multiLine: true);
    final Match? match = regex.firstMatch(content);
    return match != null ? match.group(1)!.trim() : '';
  }

  // Function to add new lines after headings and paragraphs
  String _addSpacing(String content) {
    return content.replaceAllMapped(RegExp(r'^(#+ .+)$', multiLine: true), (match) => '${match[1]}\n\n')
        .replaceAllMapped(RegExp(r'(.+)\n(?![\n#])'), (match) => '${match[1]}\n\n');
  }
}
