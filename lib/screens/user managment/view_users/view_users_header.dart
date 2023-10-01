import 'package:flutter/material.dart';

import '../add_user/add_user_page.dart';

class ViewUsersHeader extends StatelessWidget {
  const ViewUsersHeader({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Users",
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
              MaterialPageRoute(builder: (context) => AddUserPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(
                35, 32, 158, 1), // set the background color of the button
          ),
          child: Text(
            "Add User +",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
