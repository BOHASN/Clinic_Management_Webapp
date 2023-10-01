

// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import '../../../controllers/patient_controller.dart';
import 'add_patient_header.dart';

class AddPatientScreen extends StatefulWidget {
  @override
  _AddPatientScreenState createState() => _AddPatientScreenState();
}
class _AddPatientScreenState extends State<AddPatientScreen> {
  TextEditingController _patientNameController = TextEditingController();
  TextEditingController _patientEmailController = TextEditingController();
  TextEditingController _patientPhonenumberController = TextEditingController();
  TextEditingController _patientBirthdateController = TextEditingController();
  TextEditingController _patientAddressController = TextEditingController();
  TextEditingController _patientGenderController = TextEditingController();
  TextEditingController _patientBloodgroupController = TextEditingController();
  TextEditingController _patientConController = TextEditingController();
  TextEditingController _patientSpecialneedsController = TextEditingController();

  void _addPatient() async {
    String patientName = _patientNameController.text;
    String patientEmail = _patientEmailController.text;
    String patientPhonenumber = _patientPhonenumberController.text;
    String patientBirthdate = _patientBirthdateController.text;
    String patientAddress = _patientAddressController.text;
    String patientGender = _patientGenderController.text;
    String patientBloodgroup = _patientBloodgroupController.text;
    String patientCon = _patientConController.text;
    String patientSpecialneeds = _patientSpecialneedsController.text;

    try {
      // Call the MedicineController to add the medicine
      String result = await PatientController.addPatient(
        patientName: patientName,
        patientEmail: patientEmail,
        patientPhonenumber: patientPhonenumber,
        patientAddress: patientAddress, 
        patientBirthdate: patientBirthdate, 
        patientCon: patientCon, 
        patientBloodgroup: patientBloodgroup,
        patientGender: patientGender,
        patientSpecialneeds: patientSpecialneeds,
      );

      // Display a success message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Patient added successfully')),
      );

      // Clear the text fields after adding the medicine
      _patientNameController.clear();
      _patientEmailController.clear();
      _patientPhonenumberController.clear();
      _patientBirthdateController.clear();
      _patientGenderController.clear();
      _patientAddressController.clear();
      _patientBloodgroupController.clear();
      _patientConController.clear();
      _patientSpecialneedsController.clear();
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
            padding: EdgeInsets.only(bottom: 16.0),
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Color.fromRGBO(228, 228, 231, 1),
              child: AddPatientHeader(),
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
                      flex: 1,
                      child: TextField(
                        controller: _patientNameController,
                        style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                        decoration: InputDecoration(
                          labelText: 'Full Name',
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
                    SizedBox(width: 16.0,height: 40),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: _patientEmailController,
                        style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                        decoration: InputDecoration(
                          labelText: 'Email',
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
                    SizedBox(width: 16.0,height: 40),
                  ],
                ),
                SizedBox(width: 16.0,height: 40),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: _patientPhonenumberController,
                        style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
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
                    SizedBox(width: 16.0,height: 40),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: _patientBirthdateController,
                        style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
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
                    SizedBox(width: 16.0,height: 40),
                  ],
                ),
                SizedBox(width: 16.0,height: 40),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: _patientAddressController,
                        style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                        decoration: InputDecoration(
                          labelText: 'Address',
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
                    SizedBox(width: 16.0,height: 40),
                  ],
                ),
               SizedBox(width: 16.0,height: 40),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: _patientGenderController,
                        style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                        decoration: InputDecoration(
                          labelText: 'Gender',
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
                   SizedBox(width: 16.0,height: 40),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: _patientBloodgroupController,
                        style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                        decoration: InputDecoration(
                          labelText: 'Blood Group',
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
                    SizedBox(width: 16.0,height: 40),
                  ],
                ),
                SizedBox(width: 16.0,height: 40),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: _patientConController,
                        style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                        decoration: InputDecoration(
                          labelText: 'Patient Condition',
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
                    SizedBox(width: 16.0,height: 40),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: _patientSpecialneedsController,
                        style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                        decoration: InputDecoration(
                          labelText: 'Patient Special Needs',
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
                    SizedBox(width: 16.0,height: 40),
                  ],
                ),
                SizedBox(width: 16.0,height: 40),
                Container(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: _addPatient,
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
    _patientNameController.dispose();
    _patientEmailController.dispose();
    _patientGenderController.dispose();
    _patientAddressController.dispose();
    _patientBloodgroupController.dispose();
    _patientSpecialneedsController.dispose();
    _patientConController.dispose();
    _patientBirthdateController.dispose();
    _patientPhonenumberController.dispose();
    super.dispose();
  }
}
