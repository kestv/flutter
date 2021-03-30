import 'dart:convert';
import 'package:flutter_app/classes/user.dart';
import 'package:http/http.dart' as http;

class UsersService {
  Future<User> getUser(int userId) async {
    var url = Uri.http('10.0.2.2:57703', '/api/Users/$userId');
    var _response = await http.get(url);
    if (_response.statusCode == 200) {
      User _user = User.fromJson(json.decode(_response.body));
      return _user;
    } else {
      throw Exception('Failed to fetch Users');
    }
  }
}
