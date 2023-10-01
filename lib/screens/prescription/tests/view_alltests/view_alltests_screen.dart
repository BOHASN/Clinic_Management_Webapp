
import 'package:clinic_managment/screens/prescription/tests/view_alltests/view_alltests_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constants.dart';
import '../../../../controllers/test_controller.dart';
import '../../../../models/test_model.dart';

class ViewAllTestsScreen extends StatefulWidget {
  @override
  _ViewAllTestsScreenState createState() => _ViewAllTestsScreenState();
}

class _ViewAllTestsScreenState extends State<ViewAllTestsScreen> {
  List<Test> _tests = [];

  @override
  void initState() {
    super.initState();
    _fetchTests();
  }

  Future<void> _fetchTests() async {
    try {
      List<Test> tests = (await TestController.getAllTests()).cast<Test>();
      setState(() {
        _tests = tests;
      });
    } catch (e) {
      // Handle error
    }
  }
Future<void> _deleteTest(int testId) async {
  try {
    await TestController.deleteTest(testId);
    setState(() {
      _tests.removeWhere((test) => test.id == testId);
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
                  child: ViewAllTestsHeader(),
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
                            'Test ID',
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
                            'Test Name',
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
                            'Description',
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
                            'Note',
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
                  ..._tests.map((test) => TableRow(children: [
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(test.id.toString())),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(test.testName)),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(test.testDescription)),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(test.testNote)),
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
                                        title: Text('Delete Test'),
                                        content: Text('Are you sure you want to delete this test?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              _deleteTest(test.id);
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