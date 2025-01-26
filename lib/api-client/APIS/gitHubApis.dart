import 'dart:convert';
import 'package:KrrishVerse/api-client/endpoints.dart';
import 'package:http/http.dart' as http;

class GitHubApiClient {

  // Private constructor
  static final GitHubApiClient _instance = GitHubApiClient._internal();
  final String baseUrl;

  // Private constructor
  GitHubApiClient._internal({this.baseUrl = Endpoints.gitBaseUrl});

  // Factory constructor to return the same instance
  factory GitHubApiClient() {
    return _instance;
  }


  // GET Request
  Future<dynamic> getProjectList() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl${Endpoints.gitRepoListUrlEndpoint}'));
      return _handleResponse(response);
    } catch (error) {
      throw Exception('GET request failed: $error');
    }
  }

  // POST Request
  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (error) {
      throw Exception('POST request failed: $error');
    }
  }

  // PUT Request
  Future<dynamic> put(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (error) {
      throw Exception('PUT request failed: $error');
    }
  }

  // DELETE Request
  Future<dynamic> delete(String endpoint) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl$endpoint'));
      return _handleResponse(response);
    } catch (error) {
      throw Exception('DELETE request failed: $error');
    }
  }

  // Handle HTTP Responses
  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('HTTP Error: ${response.statusCode}, ${response.body}');
    }
  }
}
