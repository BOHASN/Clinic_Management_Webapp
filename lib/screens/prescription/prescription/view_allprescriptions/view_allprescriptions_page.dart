import 'package:clinic_managment/components/side_menu.dart';
import 'package:clinic_managment/screens/prescription/prescription/view_allprescriptions/view_allprescription_screen.dart';
import 'package:flutter/material.dart';



class ViewAllPrescriptionsPage extends StatelessWidget {
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
                    child: ViewAllPrescriptionsScreen(),
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
