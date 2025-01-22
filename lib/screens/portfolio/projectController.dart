import 'package:get/get.dart';

class ProjectController extends GetxController {
  final projects = <Map<String, String>>[
    {
      'title': 'Project 1',
      'description': 'Description of Project 1',
      'image': 'assets/images/Project1.jpg',
    },
    {
      'title': 'Project 2',
      'description': 'Description of Project 2',
      'image': 'assets/images/Project1.jpg',
    },
    // Add more projects here
  ].obs;

  Map<String, String>? selectedProject;

  void selectProject(Map<String, String> project) {
    selectedProject = project;
  }
}
