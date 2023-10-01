import 'package:clinic_managment/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'view_alltests_screen.dart';

class ViewAllTestsPage extends StatelessWidget {
  const ViewAllTestsPage({super.key});

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
                    child: ViewAllTestsScreen(),
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
