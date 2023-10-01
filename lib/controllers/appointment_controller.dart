import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/appointment_model.dart';

class AppointmentController {
  static Future<String> addAppointment({
    required String appointmentPatientname,
    required String appointmentDate,
    required String appointmentTimeslot,
    required String reasonForvisit,
  }) async {
    final response = await http.post(
      Uri.parse(
          'http://localhost/clinic_management.api/appointments.api/appointment_create.php'),
      body: {
        'appointment_patientname': appointmentPatientname,
        'appointment_date': appointmentDate,
        'appointment_timeslot': appointmentTimeslot,
        'reason_forvisit': reasonForvisit,
      },
    );

    if (response.statusCode == 200) {
      return 'Appointment added successfully';
    } else {
      throw 'Error occurred while adding appointment';
    }
  }

  static Future<List<Appointment>> getAllAppointments() async {
    final response = await http.get(
      Uri.parse(
          'http://localhost/clinic_management.api/appointments.api/appointment_view.php'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Appointment.fromJson(item)).toList();
    } else {
      throw 'Error occurred while retrieving appointments';
    }
  }
    static Future<List<String>> getPatientNames() async {
    final Uri uri = Uri.parse('http://localhost/clinic_management.api/patients.api/fetch_patients.php');

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<String> names = List<String>.from(data);
        return names;
      } else {
        throw Exception('Failed to fetch patient names');
      }
    } catch (e) {
      throw Exception('Error occurred while fetching patient names: $e');
    }
  }
  static Future<String> deleteAppointment(int appointmentId) async {
  final response = await http.post(
    Uri.parse('http://localhost/clinic_management.api/appointments.api/appointment_delete.php'),
    body: {
      'appointment_id': appointmentId.toString(),
    },
  );

  if (response.statusCode == 200) {
    return 'Appointment deleted successfully';
  } else {
    throw 'Error occurred while deleting appointment';
  }
}
}
