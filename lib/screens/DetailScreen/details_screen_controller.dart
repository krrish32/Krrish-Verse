import 'dart:convert';

import 'package:KrrishVerse/api-client/APIS/gitHubApis.dart';
import 'package:KrrishVerse/api-client/Model/projectReadmeModel.dart';
import 'package:get/get.dart';

class DetailsScreenController extends GetxController{
  GitHubApiClient gitHubApiClient = GitHubApiClient();
  var projectName = "".obs;
  var readmeContent = "".obs;
  var isLoading = false.obs;

  void setProjectName(String name) {
    projectName.value = name;
    fetchReadme();
  }

  Future fetchReadme()async{
    try {
      final res = await gitHubApiClient.getProjectReadme(projectName.value);
      var response = ProjectReadmeModel.fromJson(res);

      // Remove unwanted whitespace and newlines
      String cleanedBase64 = response.content!.replaceAll(RegExp(r'\s'), '');

      // Decode Base64 safely
      List<int> bytes = base64Decode(cleanedBase64);
      readmeContent.value = utf8.decode(bytes);
    } catch (e) {
      print("Error decoding README: $e");
      readmeContent.value = "Failed to load README";
    }

  }


}