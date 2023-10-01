import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/bill_model.dart';

class BillController {
  static Future<String> addBill({
    required String billPatientname,
    required String billDate,
    required String billAmount,
    required String billNote,
  }) async {
    final response = await http.post(
      Uri.parse(
          'http://localhost/clinic_management.api/bills.api/bill_create.php'),
      body: {
        'bill_patientname': billPatientname,
        'bill_date': billDate,
        'bill_amount': billAmount,
        'bill_note': billNote,
      },
    );

    if (response.statusCode == 200) {
      return 'Bill added successfully';
    } else {
      throw 'Error occurred while adding bill';
    }
  }

  static Future<List<Bill>> getAllBills() async {
    final response = await http.get(
      Uri.parse(
          'http://localhost/clinic_management.api/bills.api/bill_view.php'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Bill.fromJson(item)).toList();
    } else {
      throw 'Error occurred while retrieving bills';
    }
  }
static Future<String> deleteBill(int billId) async {
  final response = await http.post(
    Uri.parse('http://localhost/clinic_management.api/bills.api/bill_delete.php'),
    body: {
      'bill_id': billId.toString(),
    },
  );

  if (response.statusCode == 200) {
    return 'Bill deleted successfully';
  } else {
    throw 'Error occurred while deleting bill';
  }
}
  static Future<void> updateBill(Bill bill, {required billId}) async {
    final response = await http.post(
      Uri.parse('http://localhost/clinic_management.api/bills.api/bill_update.php'),
      body: bill.toJson(),
    );

    if (response.statusCode == 200) {
      // Handle the successful update if needed
    } else {
      throw 'Error occurred while updating bill';
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

}

  // static Future<String> deleteBill(int medicineId) async {
  //   final response = await http.post(
  //     Uri.parse('http://localhost/clinic_management.api/medicines.api/medicine_delete.php'),
  //     body: {
  //       'medicine_id': medicineId.toString(),
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> data = jsonDecode(response.body);
  //     if (data['success']) {
  //       return 'Medicine deleted successfully';
  //     } else {
  //       throw 'Failed to delete medicine';
  //     }
  //   } else {
  //     throw 'Error occurred while deleting medicine';
  //   }
  // }

  // static Future<String> updateMedicine(Medicine medicine, {required int id, required String medicineName, required String medicineGeneric, required String medicineUse, required int medicineid, required int medicineId}) async {
  //   final response = await http.post(
  //     Uri.parse('http://localhost/clinic_management.api/medicines.api/medicine_update.php'),
  //     body: {
  //       'medicine_id': medicine.id.toString(),
  //       'medicine_name': medicine.medicineName,
  //       'medicine_generic': medicine.medicineGeneric,
  //       'medicine_use': medicine.medicineUse,
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> data = jsonDecode(response.body);
  //     if (data['success']) {
  //       return 'Medicine updated successfully';
  //     } else {
  //       throw 'Failed to update medicine';
  //     }
  //   } else {
  //     throw 'Error occurred while updating medicine';
  //   }
  // }

