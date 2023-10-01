import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/medicine_model.dart';

class MedicineController {
  static Future<String> addMedicine({
    required String medicineName,
    required String medicineGeneric,
    required String medicineUse,
  }) async {
    final response = await http.post(
      Uri.parse('http://localhost/clinic_management.api/medicines.api/medicine_create.php'),
      body: {
        'medicine_name': medicineName,
        'medicine_generic': medicineGeneric,
        'medicine_use': medicineUse,
      },
    );

    if (response.statusCode == 200) {
      return 'Medicine added successfully';
    } else {
      throw 'Error occurred while adding medicine';
    }
  }

  static Future<List<Medicine>> getAllMedicines() async {
    final response = await http.get(
      Uri.parse('http://localhost/clinic_management.api/medicines.api/medicine_view.php'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Medicine.fromJson(item)).toList();
    } else {
      throw 'Error occurred while retrieving medicines';
    }
  }

static Future<String> deleteMedicine(int medicineId) async {
  final response = await http.post(
    Uri.parse('http://localhost/clinic_management.api/medicines.api/medicine_delete.php'),
    body: {
      'medicine_id': medicineId.toString(),
    },
  );

  if (response.statusCode == 200) {
    return 'Medicine deleted successfully';
  } else {
    throw 'Error occurred while deleting medicine';
  }
}

  static Future<String> updateMedicine(Medicine medicine, {required int id, required String medicineName, required String medicineGeneric, required String medicineUse, required int medicineid, required int medicineId}) async {
    final response = await http.post(
      Uri.parse('http://localhost/clinic_management.api/medicines.api/medicine_update.php'),
      body: {
        'medicine_id': medicine.id.toString(),
        'medicine_name': medicine.medicineName,
        'medicine_generic': medicine.medicineGeneric,
        'medicine_use': medicine.medicineUse,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (data['success']) {
        return 'Medicine updated successfully';
      } else {
        throw 'Failed to update medicine';
      }
    } else {
      throw 'Error occurred while updating medicine';
    }
  }
}
