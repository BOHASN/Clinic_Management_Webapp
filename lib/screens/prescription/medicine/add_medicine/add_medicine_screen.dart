// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import '../../../../controllers/medicine_controller.dart';
import 'add_medicine_header.dart';

class AddMedicineScreen extends StatefulWidget {
  @override
  _AddMedicineScreenState createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  TextEditingController _medicineNameController = TextEditingController();
  TextEditingController _medicineGenericController = TextEditingController();
  TextEditingController _medicineUseController = TextEditingController();

  void _addMedicine() async {
    String medicineName = _medicineNameController.text;
    String medicineGeneric = _medicineGenericController.text;
    String medicineUse = _medicineUseController.text;

    try {
      // Call the MedicineController to add the medicine
      String result = await MedicineController.addMedicine(
        medicineName: medicineName,
        medicineGeneric: medicineGeneric,
        medicineUse: medicineUse,
      );

      // Display a success message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Medicine added successfully')),
      );

      // Clear the text fields after adding the medicine
      _medicineNameController.clear();
      _medicineGenericController.clear();
      _medicineUseController.clear();
    } catch (e) {
      // Display an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occurred while adding medicine')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Color.fromRGBO(228, 228, 231, 1),
                child: AddMedicineHeader(),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _medicineNameController,
                          style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                          decoration: InputDecoration(
                            labelText: 'Medicine Name',
                            labelStyle: TextStyle(color: Color.fromRGBO(179, 179, 179, 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(35, 32, 158, 1)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(35, 32, 158, 1)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0, height: 80),
                    ],
                  ),
                  SizedBox(width: 16.0, height: 80),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _medicineGenericController,
                          style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                          decoration: InputDecoration(
                            labelText: 'Medicine Generic',
                            labelStyle: TextStyle(color: Color.fromRGBO(179, 179, 179, 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(35, 32, 158, 1)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(35, 32, 158, 1)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0, height: 80),
                    ],
                  ),
                  SizedBox(width: 16.0, height: 80),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _medicineUseController,
                          style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                          decoration: InputDecoration(
                            labelText: 'Medicine Use',
                            labelStyle: TextStyle(color: Color.fromRGBO(179, 179, 179, 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(35, 32, 158, 1)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(35, 32, 158, 1)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0, height: 40),
                    ],
                  ),
                  SizedBox(width: 16.0, height: 80),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: _addMedicine,
                      child: Text('Confirm'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(35, 32, 158, 1),
                        onPrimary: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _medicineNameController.dispose();
    _medicineGenericController.dispose();
    _medicineUseController.dispose();
    super.dispose();
  }
}
