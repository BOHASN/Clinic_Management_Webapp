import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/patient_model.dart';

class PatientController {
  static Future<String> addPatient({
    required String patientName,
    required String patientEmail,
    required String patientAddress,
    required String patientPhonenumber,
    required String patientBirthdate,
    required String patientBloodgroup,
    required String patientGender,
    required String patientCon,
    required String patientSpecialneeds,
  }) async {
    final response = await http.post(
      Uri.parse(
          'http://localhost/clinic_management.api/patients.api/patient_create.php'),
      body: {
        'patient_name': patientName,
        'patient_email': patientEmail,
        'patient_address': patientAddress,
        'patient_phonenumber': patientPhonenumber,
        'patient_birthdate': patientBirthdate,
        'patient_bloodgroup': patientBloodgroup,
        'patient_gender': patientGender,
        'patient_con': patientCon,
        'patient_specialneeds': patientSpecialneeds,
      },
    );

    if (response.statusCode == 200) {
      return 'Patient added successfully';
    } else {
      throw 'Error occurred while adding patient';
    }
  }

  static Future<List<Patient>> getAllPatients() async {
    final response = await http.get(
      Uri.parse(
          'http://localhost/clinic_management.api/patients.api/patient_view.php'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Patient.fromJson(item)).toList();
    } else {
      throw 'Error occurred while retrieving patients';
    }
  }
  static Future<String> deletePatient(int patientId) async {
  final response = await http.post(
    Uri.parse('http://localhost/clinic_management.api/patients.api/patient_delete.php'),
    body: {
      'patient_id': patientId.toString(),
    },
  );

  if (response.statusCode == 200) {
    return 'Patient deleted successfully';
  } else {
    throw 'Error occurred while deleting patient';
  }
}

  // static Future<List<String>> getAllPatientNames() async {
  //   final response = await http.get(
  //     Uri.parse(
  //         'http://localhost/clinic_management.api/patients.api/patient_names.php'),
  //   );

  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = jsonDecode(response.body);
  //     return data.map((item) => item['patient_name'] as String).toList();
  //   } else {
  //     throw 'Error occurred while retrieving patient names';
  //   }
  // }
}
