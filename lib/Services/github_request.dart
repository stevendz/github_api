import 'package:http/http.dart' as http;

class Github {
  final String userName;
  final String url = 'https://api.github.com/';
  static String clientId = '69245e68bba3307c2468';
  static String clientSecret = 'c665ae879cde135d5e1ec28668e4cbdef7d3ad5d';

  final String query = "?client_id=$clientId&client_secret=$clientSecret";

  Github(this.userName);

  Future<http.Response> fetchUser() {
    return http.get(url + 'users/' + userName + query);
  }

  Future<http.Response> fetchFollowing() {
    return http.get(url + 'users/' + userName + '/following' + query);
  }
}
