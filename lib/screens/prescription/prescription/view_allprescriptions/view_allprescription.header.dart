import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../add_prescription/add_prescription_page.dart';

class ViewAllPrescriptionsHeader extends StatelessWidget {
  const ViewAllPrescriptionsHeader({super.key});

 @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "View All Prescriptions",
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
              MaterialPageRoute(builder: (context) => AddPrescriptionPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(35, 32, 158, 1),
          ),
          child: Text(
            "Add Prescriptions +",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}