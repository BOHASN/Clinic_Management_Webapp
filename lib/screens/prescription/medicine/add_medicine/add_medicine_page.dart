import 'package:clinic_managment/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'add_medicine_screen.dart';

class AddMedicinePage extends StatelessWidget {
  const AddMedicinePage({Key? key});

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
                    child: AddMedicineScreen(),
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
