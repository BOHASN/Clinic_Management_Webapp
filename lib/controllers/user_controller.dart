import 'dart:convert';
import 'package:clinic_managment/models/user_model.dart';
import 'package:http/http.dart' as http;


class UserController {
  static Future<String> addUser({
    required String userName,
    required String userPassword,

  }) async {
    final response = await http.post(
      Uri.parse(
          'http://localhost/clinic_management.api/users.api/user_create.php'),
      body: {
        'user_name': userName,
        'user_password': userPassword,

      },
    );

    if (response.statusCode == 200) {
      return 'User added successfully';
    } else {
      throw 'Error occurred while adding user';
    }
  }

  static Future<List<User>> getAllUsers() async {
    final response = await http.get(
      Uri.parse(
          'http://localhost/clinic_management.api/users.api/user_view.php'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => User.fromJson(item)).toList();
    } else {
      throw 'Error occurred while retrieving users';
    }
  }
    static Future<String> deleteUser(int userId) async {
  final response = await http.post(
    Uri.parse('http://localhost/clinic_management.api/users.api/user_delete.php'),
    body: {
      'user_id': userId.toString(),
    },
  );

  if (response.statusCode == 200) {
    return 'User deleted successfully';
  } else {
    throw 'Error occurred while deleting user';
  }
}
  static Future<bool> loginUser(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost/clinic_management.api/users.api/Login.php'),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData['success'] ?? false;
    } else {
      throw 'Error occurred while logging in';
    }
  }

}