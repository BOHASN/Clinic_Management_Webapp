// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import '../../../controllers/user_controller.dart';
import 'add_user_header.dart';

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();


  void _addUser() async {
    String userName = _userNameController.text;
    String userPassword = _userPasswordController.text;

    try {
      // Call the TestController to add the test
      String result = await UserController.addUser(
        userName: userName,
        userPassword: userPassword,
      );

      // Display a success message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User added successfully')),
      );

      // Clear the text fields after adding the medicine
      _userNameController.clear();
      _userPasswordController.clear();

    } catch (e) {
      // Display an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occurred while adding user')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Color.fromRGBO(228, 228, 231, 1),
                child: AddUserHeader(),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _userNameController,
                          style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(color: Color.fromRGBO(179, 179, 179, 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(35, 32, 158, 1)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(35, 32, 158, 1)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0, height: 80),
                    ],
                  ),
                  SizedBox(width: 16.0, height: 80),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _userPasswordController,
                          style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Color.fromRGBO(179, 179, 179, 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(35, 32, 158, 1)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(35, 32, 158, 1)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0, height: 80),
                    ],
                  ),
                  SizedBox(width: 16.0, height: 80),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: _addUser,
                      child: Text('Confirm'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(35, 32, 158, 1),
                        onPrimary: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _userPasswordController.dispose();
    super.dispose();
  }
}
