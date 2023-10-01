import 'package:flutter/material.dart';
import '../view_allprescriptions/view_allprescriptions_page.dart';
 // Import the ViewAllPrescriptionsPage

class AddPrescriptionHeader extends StatelessWidget {
  const AddPrescriptionHeader({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Add Prescription",
            style: Theme.of(context).textTheme.headline6?.copyWith(
              color: Color.fromRGBO(35, 32, 158, 1),
            ),
          ),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewAllPrescriptionsPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(35, 32, 158, 1),
          ),
          child: Text(
            "View All Prescriptions",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
