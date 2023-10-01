import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../add_test/add_test_page.dart';

class ViewAllTestsHeader extends StatelessWidget {
  const ViewAllTestsHeader({super.key});

   @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "All Diagnosis Tests",
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
              MaterialPageRoute(builder: (context) => AddTestPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(
                35, 32, 158, 1), // set the background color of the button
          ),
          child: Text(
            "Add Diagnosis Test",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
