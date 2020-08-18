import 'package:http/http.dart' as http;

class Github {
  final String userName;
  final String url = 'https://api.github.com/';
  static String clientId = 'YOUR_CLIENT_ID';
  static String clientSecret = 'YOUR_CLIENT_SECRET';

  final String query = "?client_id=$clientId&client_secret=$clientSecret";

  Github(this.userName);

  Future<http.Response> fetchUser() {
    return http.get(url + 'users/' + userName + query);
  }

  Future<http.Response> fetchFollowing() {
    return http.get(url + 'users/' + userName + '/following' + query);
  }
}
