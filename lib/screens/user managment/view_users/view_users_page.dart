import 'package:clinic_managment/components/side_menu.dart';
import 'package:clinic_managment/screens/user%20managment/view_users/view_users_screen.dart';
import 'package:flutter/material.dart';




class ViewUsersPage extends StatelessWidget {
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
                    child: ViewUsersScreen(),
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
