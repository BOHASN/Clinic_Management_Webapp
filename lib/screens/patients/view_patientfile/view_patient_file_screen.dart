import 'package:clinic_managment/screens/patients/view_patientfile/view_patient_file_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../constants.dart';
import '../../../models/patient_model.dart';

class PatientFileScreen extends StatelessWidget {
  final Patient patient;

  PatientFileScreen({required this.patient});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: defaultPadding),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    padding: EdgeInsets.all(defaultPadding),
                    color: Color.fromRGBO(228, 228, 231, 1),
                    child: PatientFileHeader(),
                  );
                },
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: defaultPadding),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Patient ID: ${patient.id}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(35, 32, 158, 1),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Patient Name: ${patient.patientName}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(35, 32, 158, 1),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Patient Email: ${patient.patientEmail}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(35, 32, 158, 1),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Birth Date: ${patient.patientBirthdate}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(35, 32, 158, 1),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Phone: ${patient.patientPhonenumber}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(35, 32, 158, 1),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Blood Group: ${patient.patientBloodgroup}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(35, 32, 158, 1),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Address: ${patient.patientAddress}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(35, 32, 158, 1),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Patient Condition: ${patient.patientCon}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(35, 32, 158, 1),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Patient Special needs: ${patient.patientSpecialneeds}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(35, 32, 158, 1),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
