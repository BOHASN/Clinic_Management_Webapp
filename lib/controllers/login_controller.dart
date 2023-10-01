import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginController {
  static Future<bool> loginUser(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost/clinic_management.api/users.api/Login.php'),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      bool success = data['success'];

      return success;
    } else {
      throw 'Error occurred while logging in';
    }
  }
}
