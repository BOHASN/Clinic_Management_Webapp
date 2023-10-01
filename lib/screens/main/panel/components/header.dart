import 'package:flutter/material.dart';

import '../../../appointments/add_appointment/add_appointment_page.dart';
import '../../../appointments/all_appointments/all_appointments_page.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool isSmallScreen = constraints.maxWidth <= 768;

        return Row(
          children: [
            Expanded(
              child: Text(
                "Today's Appointments",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Color.fromRGBO(35, 32, 158, 1),
                    ),
              ),
            ),
            SizedBox(width: isSmallScreen ? 10 : 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddAppointmentPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(35, 32, 158, 1),
              ),
              child: Text(
                isSmallScreen ? "+" : "Add new appointment +",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: isSmallScreen ? 10 : 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllAppointmentsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(35, 32, 158, 1),
              ),
              child: Text(
                isSmallScreen ? "View all" : "View all appointments",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
