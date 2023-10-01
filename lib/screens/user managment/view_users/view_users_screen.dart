import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../controllers/user_controller.dart';
import '../../../models/user_model.dart';
import 'view_users_header.dart';

class ViewUsersScreen extends StatefulWidget {
  @override
  _ViewUsersScreenState createState() => _ViewUsersScreenState();
}

class _ViewUsersScreenState extends State<ViewUsersScreen> {
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      List<User> users = (await UserController.getAllUsers()).cast<User>();
      setState(() {
        _users = users;
      });
    } catch (e) {
      // Handle error
    }
  }
    Future<void> _deleteUser(int userId) async {
  try {
    await UserController.deleteUser(userId);
    setState(() {
      _users.removeWhere((user) => user.id == userId);
    });
  } catch (e) {
    // Handle error
  }
}



@override
Widget build(BuildContext context) {
  return SafeArea(
    child: SingleChildScrollView(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: defaultPadding),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  padding: EdgeInsets.all(defaultPadding),
                  color: Color.fromRGBO(228, 228, 231, 1),
                  child: ViewUsersHeader(),
                );
              },
            ),
          ),
              Table(
                border: TableBorder.all(color: Colors.black26),
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        color: Color.fromRGBO(228, 228, 231, 1),
                        height: 40,
                        child: Center(
                          child: Text(
                            'User ID',
                            style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: Color.fromRGBO(228, 228, 231, 1),
                        height: 40,
                        child: Center(
                          child: Text(
                            'Username',
                            style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: Color.fromRGBO(228, 228, 231, 1),
                        height: 40,
                        child: Center(
                          child: Text(
                            'Actions',
                            style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  ..._users.map((user) => TableRow(children: [
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(user.id.toString())),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(user.userName)),
                      ),
                    ),


TableCell(
  child: Container(
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Delete User'),
                                        content: Text('Are you sure you want to delete this user?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              _deleteUser(user.id);
                                            },
                                            child: Text('Delete'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: SvgPicture.asset(
                                  "assets/icons/delete-file.svg",
                                  height: 24,
                                  width: 24,
                                ),
                              ),
      ],
    ),
  ),
),
                  ])).toList(),
                ],
              ),
            ],
          ),
        ),
    );
  }
}