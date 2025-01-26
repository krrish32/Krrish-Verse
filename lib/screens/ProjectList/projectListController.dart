import 'package:KrrishVerse/api-client/APIS/gitHubApis.dart';
import 'package:KrrishVerse/api-client/Model/gitHubRepoListModel.dart';
import 'package:get/get.dart';

class ProjectListController extends GetxController{
  var projectList = <GitRepositoryDetail>[].obs;
  var isLoading = false.obs;
  GitHubApiClient gitHubApiClient = GitHubApiClient();

  @override
  void onInit() async{
    await fetchProjectList();
    super.onInit();
  }

  Future fetchProjectList()async {
    isLoading.value = true;
    try {
      final response = await gitHubApiClient.getProjectList();
      for (int i = 0; i < response.length; i++) {
        projectList.add(GitRepositoryDetail.fromJson(response[i]));
      }
      projectList.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));
      print(response);
    }
    catch (err) {
      printError(info: "$err");
    }
    isLoading.value = false;
  }
}