// ignore_for_file: unused_field

import 'package:clinic_managment/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../controllers/patient_controller.dart';
import '../../../models/patient_model.dart';
import '../view_patientfile/view_patient_file_screen.dart';
import 'view_patients_header.dart';

class ViewPatientsScreen extends StatefulWidget {
  @override
  _ViewPatientsScreenState createState() => _ViewPatientsScreenState();
}

class _ViewPatientsScreenState extends State<ViewPatientsScreen> {
  List<Patient> _patients = [];

  @override
  void initState() {
    super.initState();
    _fetchPatients();
  }

  Future<void> _fetchPatients() async {
    try {
      List<Patient> patients = await PatientController.getAllPatients();
      setState(() {
        _patients = patients;
      });
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _deletePatient(int patientId) async {
  try {
    await PatientController.deletePatient(patientId);
    setState(() {
      _patients.removeWhere((patient) => patient.id == patientId);
    });
  } catch (e) {
    // Handle error
  }
}

  


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: defaultPadding),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    padding: EdgeInsets.all(defaultPadding),
                    color: Color.fromRGBO(228, 228, 231,1), // set the background color of the box
                    child: ViewPatientsHeader(), // This is a custom widget that needs to be implemented
                  );
                },
              ),
            ),
Table(
  border: TableBorder.all(color: Colors.black26),
  children: [
    TableRow(children: [
      TableCell(
        child: Container(
          color: Color.fromRGBO(228, 228, 231, 1),
          height: 40,
          child: Center(
            child: Text(
              'Patient ID',
              style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
            ),
          ),
        ),
      ),
      TableCell(
        child: Container(
          color: Color.fromRGBO(228, 228, 231, 1),
          height: 40,
          child: Center(
            child: Text(
              'Patient Name',
              style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
            ),
          ),
        ),
      ),
      TableCell(
        child: Container(
          color: Color.fromRGBO(228, 228, 231, 1),
          height: 40,
          child: Center(
            child: Text(
              'Birth Date',
              style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
            ),
          ),
        ),
      ),
      TableCell(
        child: Container(
          color: Color.fromRGBO(228, 228, 231, 1),
          height: 40,
          child: Center(
            child: Text(
              'Phone',
              style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
            ),
          ),
        ),
      ),
      TableCell(
        child: Container(
          color: Color.fromRGBO(228, 228, 231, 1),
          height: 40,
          child: Center(
            child: Text(
              'Blood Group',
              style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
            ),
          ),
        ),
      ),
      TableCell(
        child: Container(
          color: Color.fromRGBO(228, 228, 231, 1),
          height: 40,
          child: Center(
            child: Text(
              'Actions',
              style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
            ),
          ),
        ),
      ),
    ]),
 ..._patients.map((Patient) => TableRow(children: [
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(Patient.id.toString())),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(Patient.patientName)),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(Patient.patientBirthdate)),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(Patient.patientPhonenumber)),
                      ),
                    ),
                                        TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(Patient.patientBloodgroup)),
                      ),
                    ),
TableCell(
  child: Container(
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Delete Patient'),
                                        content: Text('Are you sure you want to delete this patient?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              _deletePatient(Patient.id);
                                            },
                                            child: Text('Delete'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: SvgPicture.asset(
                                  "assets/icons/delete-file.svg",
                                  height: 24,
                                  width: 24,
                                ),
                              ),

IconButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PatientFileScreen(patient: Patient)),
    );
  },icon: SvgPicture.asset(
            "assets/icons/edit-file.svg",
            height: 24, // Adjust the height as per your requirement
            width: 24, // Adjust the width as per your requirement
          ),
),

                            ],
                          ),
                        ),
                      ),
                  ])).toList(),
                ],
              ),
            ],
          ),
        ),
    );
  }
}