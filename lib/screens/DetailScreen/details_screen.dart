import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../portfolio/projectController.dart';

class ProjectDetailScreen extends StatelessWidget {
  final ProjectController projectController = Get.find();

  ProjectDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final project = projectController.selectedProject!;

    return Scaffold(
      appBar: AppBar(
        title: Text(project['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(project['image']!),
            SizedBox(height: 16),
            Text(
              project['title']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              project['description']!,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Open GitHub or live demo link
              },
              child: Text('View on GitHub'),
            ),
          ],
        ),
      ),
    );
  }
}
