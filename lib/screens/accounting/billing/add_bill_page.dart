import 'package:clinic_managment/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'add_bill_screen.dart';

class AddBillPage extends StatelessWidget {
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
                    child: AddBillScreen(),
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
