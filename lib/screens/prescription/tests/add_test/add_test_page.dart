import 'package:clinic_managment/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'add_test_screen.dart';

class AddTestPage extends StatelessWidget {
  const AddTestPage({Key? key});

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
                    child: AddTestScreen(),
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
