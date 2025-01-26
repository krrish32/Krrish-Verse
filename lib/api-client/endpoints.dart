import 'package:KrrishVerse/constants/app_constants.dart';

class Endpoints{
  //Base Url
  static const gitBaseUrl = "https://api.github.com/";

  //Endpoints
  static const gitRepoListUrlEndpoint = "users/${AppConstants.gitUserName}/repos";
  static gitRepoReadmeUrlEndpoint(String repoName)=> "repos/${AppConstants.gitUserName}/$repoName/readme";
}