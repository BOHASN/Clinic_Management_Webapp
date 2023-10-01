// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import '../../../../controllers/test_controller.dart';
import 'add_test_header.dart';


class AddTestScreen extends StatefulWidget {
  @override
  _AddTestScreenState createState() => _AddTestScreenState();
}

class _AddTestScreenState extends State<AddTestScreen> {
  TextEditingController _testNameController = TextEditingController();
  TextEditingController _testDescriptionController = TextEditingController();
  TextEditingController _testNoteController = TextEditingController();

  void _addTest() async {
    String testName = _testNameController.text;
    String testDescription = _testDescriptionController.text;
    String testNote = _testNoteController.text;

    try {
      // Call the TestController to add the test
      String result = await TestController.addTest(
        testName: testName,
        testDescription: testDescription,
        testNote: testNote,
      );

      // Display a success message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Test added successfully')),
      );

      // Clear the text fields after adding the medicine
      _testNameController.clear();
      _testDescriptionController.clear();
      _testNoteController.clear();
    } catch (e) {
      // Display an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occurred while adding test')),
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
                child: AddTestHeader(),
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
                          controller: _testNameController,
                          style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                          decoration: InputDecoration(
                            labelText: 'Test Name',
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
                          controller: _testDescriptionController,
                          style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                          decoration: InputDecoration(
                            labelText: 'Description',
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
                          controller: _testNoteController,
                          style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                          decoration: InputDecoration(
                            labelText: 'Note',
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
                      SizedBox(width: 16.0, height: 40),
                    ],
                  ),
                  SizedBox(width: 16.0, height: 80),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: _addTest,
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
    _testNameController.dispose();
    _testDescriptionController.dispose();
    _testNoteController.dispose();
    super.dispose();
  }
}
