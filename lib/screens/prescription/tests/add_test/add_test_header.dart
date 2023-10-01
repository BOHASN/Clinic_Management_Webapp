import 'package:flutter/material.dart';

import '../view_alltests/view_alltests_page.dart';

class AddTestHeader extends StatelessWidget {
  const AddTestHeader({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Add Diagnosis Test",
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
              MaterialPageRoute(builder: (context) => ViewAllTestsPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(
                35, 32, 158, 1), // set the background color of the button
          ),
          child: Text(
            "View All Diagnosis Tests",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
