// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:clinic_managment/constants.dart';
import 'package:clinic_managment/controllers/bill_controller.dart';
import 'package:clinic_managment/models/bill_model.dart';
import 'package:clinic_managment/screens/accounting/report/view_allreports_header.dart';
import 'package:http/http.dart' as http;


class ViewAllReportsScreen extends StatefulWidget {
  @override
  _ViewAllReportsScreenState createState() => _ViewAllReportsScreenState();
}

class _ViewAllReportsScreenState extends State<ViewAllReportsScreen> {
  List<Bill> _bills = [];

  @override
  void initState() {
    super.initState();
    _fetchBills();
  }

  Future<void> _fetchBills() async {
    try {
      List<Bill> bills = await BillController.getAllBills();
      setState(() {
        _bills = bills;
      });
    } catch (e) {
      // Handle error
    }
  }
Future<void> _deleteBill(int billId) async {
  try {
    await BillController.deleteBill(billId);
    setState(() {
      _bills.removeWhere((bill) => bill.id == billId);
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
                    child: ViewAllReportsHeader(),
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
                          'Bill ID',
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
                          'Patient Name',
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
                          'Date',
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
                          'Amount',
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
                ..._bills.map(
                  (bill) => TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          height: 40,
                          child: Center(child: Text(bill.id.toString())),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 40,
                          child: Center(child: Text(bill.billPatientname)),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 40,
                          child: Center(child: Text(bill.billDate)),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 40,
                          child: Center(child: Text(bill.billAmount)),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 40,
                          child: Center(child: Text(bill.billNote)),
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
                                        title: Text('Delete Bill'),
                                        content: Text('Are you sure you want to delete this bill?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              _deleteBill(bill.id);
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
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
