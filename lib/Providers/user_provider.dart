import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../Models/User.dart';
import '../Services/github_request.dart';

class UserProvider with ChangeNotifier {
  User _user;
  String _errorMessage;
  bool _loading = false;

  Future<bool> fetchUser(username) async {
    setLoading(true);
    await Github(username).fetchUser().then((data) {
      setLoading(false);
      if (data.statusCode == 200) {
        setUser(User.fromJson(json.decode(data.body)));
      } else {
        Map<String, dynamic> result = json.decode(data.body);
        setMessage(result['message']);
      }
    });

    return _user != null;
  }

  void setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return _loading;
  }

  void setUser(value) {
    _user = value;
    notifyListeners();
  }

  User getUser() {
    return _user;
  }

  void setMessage(value) {
    _errorMessage = value;
    notifyListeners();
  }

  String getMessage() {
    return _errorMessage;
  }
}
