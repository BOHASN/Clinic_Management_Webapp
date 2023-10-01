// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../controllers/bill_controller.dart';
import 'add_bill_header.dart';

class AddBillScreen extends StatefulWidget {
  const AddBillScreen({Key? key}) : super(key: key);

  @override
  _AddBillScreenState createState() => _AddBillScreenState();
}

class _AddBillScreenState extends State<AddBillScreen> {
  final TextEditingController _billPatientnameController = TextEditingController();
  final TextEditingController _billAmountController = TextEditingController();
  final TextEditingController _billNoteController = TextEditingController();
  final TextEditingController _billDateController = TextEditingController();

  List<String> patientNames = [];
  List<String> filteredPatientNames = [];
  bool showFilteredResults = false; // Flag to control the visibility of filtered results

  @override
  void initState() {
    super.initState();
    fetchPatientNames();
  }

  Future<void> fetchPatientNames() async {
    try {
      List<String> names = await BillController.getPatientNames();
      print('Patient Names: $names'); // Print the names for debugging
      setState(() {
        patientNames = names;
        filteredPatientNames = names;
      });
    } catch (e) {
      // Handle error
      print('Error occurred while fetching patient names: $e');
    }
  }

  void _addBill() async {
    String billPatientname = _billPatientnameController.text;
    String billDate = _billDateController.text;
    String billAmount = _billAmountController.text;
    String billNote = _billNoteController.text;

    try {
      String result = await BillController.addBill(
        billPatientname: billPatientname,
        billDate: billDate,
        billAmount: billAmount,
        billNote: billNote,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bill added successfully')),
      );

      _billPatientnameController.clear();
      _billDateController.clear();
      _billAmountController.clear();
      _billNoteController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occurred while adding bill')),
      );
    }
  }

  void _searchPatient(String keyword) {
    setState(() {
      filteredPatientNames = patientNames
          .where((name) => name.toLowerCase().startsWith(keyword.toLowerCase()))
          .toList();
      showFilteredResults = true; // Set the flag to true when there are filtered results
    });
  }

  void _clearSearch() {
    setState(() {
      _billPatientnameController.clear();
      showFilteredResults = false; // Set the flag to false to hide the filtered results
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Color.fromRGBO(228, 228, 231, 1),
                child: AddBillHeader(),
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
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: TextField(
                            controller: _billPatientnameController,
                            style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                            decoration: InputDecoration(
                              labelText: 'Patient Name',
                              labelStyle: TextStyle(color: Color.fromRGBO(179, 179, 179, 1)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(35, 32, 158, 1)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(35, 32, 158, 1)),
                              ),
                              prefixIcon: Icon(Icons.search, color: Color.fromRGBO(35, 32, 158, 1)),
                              suffixIcon: _billPatientnameController.text.isNotEmpty
                                  ? IconButton(
                                      icon: Icon(Icons.clear, color: Color.fromRGBO(35, 32, 158, 1)),
                                      onPressed: _clearSearch,
                                    )
                                  : null,
                            ),
                            onChanged: _searchPatient,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (showFilteredResults) // Only show the filtered results if the flag is true
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: filteredPatientNames.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(filteredPatientNames[index]),
                          onTap: () {
                            setState(() {
                              _billPatientnameController.text = filteredPatientNames[index];
                            });
                          },
                        );
                      },
                    ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: TextField(
                            controller: _billDateController,
                            style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                            decoration: InputDecoration(
                              labelText: 'Date',
                              labelStyle: TextStyle(color: Color.fromRGBO(179, 179, 179, 1)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(35, 32, 158, 1)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(35, 32, 158, 1)),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  DateTime? selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000, 1, 1),
                                    lastDate: DateTime(2030, 12, 31),
                                    builder: (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary: Color.fromRGBO(35, 32, 158, 1),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );

                                  if (selectedDate != null) {
                                    String formattedDate = DateFormat('EEEE, MMMM d, y').format(selectedDate);
                                    setState(() {
                                      _billDateController.text = formattedDate;
                                    });
                                  }
                                },
                                icon: Icon(Icons.calendar_today),
                                color: Color.fromRGBO(35, 32, 158, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: TextField(
                            controller: _billAmountController,
                            style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                            decoration: InputDecoration(
                              labelText: 'Payment Amount',
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
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: TextField(
                            controller: _billNoteController,
                            style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
                            decoration: InputDecoration(
                              labelText: 'Note (Optional)',
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
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: _addBill,
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
    _billPatientnameController.dispose();
    _billDateController.dispose();
    _billAmountController.dispose();
    _billNoteController.dispose();

    super.dispose();
  }
}
