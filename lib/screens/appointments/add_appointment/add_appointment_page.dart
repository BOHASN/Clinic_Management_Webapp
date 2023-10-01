import 'package:clinic_managment/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'add_appointment_screen.dart';

class AddAppointmentPage extends StatelessWidget {
  const AddAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SideMenu(),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                    child: AddAppointmentScreen(),
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
