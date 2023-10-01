import 'package:flutter/material.dart';

import '../view_patients/view_patients_page.dart';

class AddPatientHeader extends StatelessWidget {
  const AddPatientHeader({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Add Patient",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Color.fromRGBO(35, 32, 158, 1),
                ),
          ),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewPatientsPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(
                35, 32, 158, 1), // set the background color of the button
          ),
          child: Text(
            "View All Patients",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
