import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/test_model.dart';


class TestController {
  static Future<String> addTest({
    required String testName,
    required String testDescription,
    required String testNote,
  }) async {
    final response = await http.post(
      Uri.parse('http://localhost/clinic_management.api/tests.api/test_create.php'),
      body: {
        'test_name': testName,
        'test_description': testDescription,
        'test_note': testNote,
      },
    );

    if (response.statusCode == 200) {
      return 'Test added successfully';
    } else {
      throw 'Error occurred while adding test';
    }
  }

  static Future<List<Test>> getAllTests() async {
    final response = await http.get(
      Uri.parse('http://localhost/clinic_management.api/tests.api/test_view.php'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Test.fromJson(item)).toList();
    } else {
      throw 'Error occurred while retrieving tests';
    }
  }

 static Future<String> deleteTest(int testId) async {
  final response = await http.post(
    Uri.parse('http://localhost/clinic_management.api/tests.api/test_delete.php'),
    body: {
      'test_id': testId.toString(),
    },
  );

  if (response.statusCode == 200) {
    return 'Test deleted successfully';
  } else {
    throw 'Error occurred while deleting test';
  }
}

}
