import 'package:flutter/material.dart';

import 'add_prescription_header.dart';

class MedicineFields {
  String type;
  String selectMedicine;
  String mgMl;
  String dose;
  String duration;
  String note;

  MedicineFields({
    this.type = '',
    this.selectMedicine = '',
    this.mgMl = '',
    this.dose = '',
    this.duration = '',
    this.note = '',
  });
}

class TestFields {
  String selectTest;
  String note;

  TestFields({
    this.selectTest = '',
    this.note = '',
  });
}

class AddPrescriptionScreen extends StatefulWidget {
  @override
  _AddPrescriptionScreenState createState() => _AddPrescriptionScreenState();
}

class _AddPrescriptionScreenState extends State<AddPrescriptionScreen> {
  List<MedicineFields> medicineFieldsList = [];
  List<TestFields> testFieldsList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Color.fromRGBO(228, 228, 231, 1),
                child: AddPrescriptionHeader(),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                          child: TextField(
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
                            ),
                          ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Medicine List',
                    style: TextStyle(
                      color: Color.fromRGBO(35, 32, 158, 1),
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    width: 1000,
                    height: 200,
                    
                    decoration: BoxDecoration(                      
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: Color.fromRGBO(35, 32, 158, 1),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: medicineFieldsList.length,
                      itemBuilder: (context, index) {
                        final fields = medicineFieldsList[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                        color: Color.fromRGBO(35, 32, 158, 1),
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'Type',
                                        labelStyle: TextStyle(
                                          color: Color.fromRGBO(179, 179, 179, 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(35, 32, 158, 1),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(35, 32, 158, 1),
                                          ),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          fields.type = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                        color: Color.fromRGBO(35, 32, 158, 1),
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'Select Medicine',
                                        labelStyle: TextStyle(
                                          color: Color.fromRGBO(179, 179, 179, 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(35, 32, 158, 1),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(35, 32, 158, 1),
                                          ),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          fields.selectMedicine = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                        color: Color.fromRGBO(35, 32, 158, 1),
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'mg/ml',
                                        labelStyle: TextStyle(
                                          color: Color.fromRGBO(179, 179, 179, 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(35, 32, 158, 1),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(35, 32, 158, 1),
                                          ),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          fields.mgMl = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                        color: Color.fromRGBO(35, 32, 158, 1),
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'Dose',
                                        labelStyle: TextStyle(
                                          color: Color.fromRGBO(179, 179, 179, 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(35, 32, 158, 1),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(35, 32, 158, 1),
                                          ),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          fields.dose = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                        color: Color.fromRGBO(35, 32, 158, 1),
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'Duration',
                                        labelStyle: TextStyle(
                                          color: Color.fromRGBO(179, 179, 179, 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(35, 32, 158, 1),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(35, 32, 158, 1),
                                          ),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                         
                                          fields.duration = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                        color: Color.fromRGBO(35, 32, 158, 1),
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'Note',
                                        labelStyle: TextStyle(
                                          color: Color.fromRGBO(179, 179, 179, 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(35, 32, 158, 1),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(35, 32, 158, 1),
                                          ),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          fields.note = value;
                                        });
                                      },
                                    ),
                                  ),

                                ],
                              ),
Align(
  alignment: Alignment.center,
  child: IconButton(
    icon: Icon(Icons.remove_circle),
    color: Color.fromRGBO(35, 32, 158, 1),
    onPressed: () {
      setState(() {
        medicineFieldsList.removeAt(index);
      });
    },
  ),
)

                            ],
                            
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        medicineFieldsList.add(MedicineFields());
                      });
                    },
                    child: Text('Add Medicine'),
                        style: ElevatedButton.styleFrom(
      primary: Color.fromRGBO(35, 32, 158, 1),
      onPrimary: Colors.white,
    ),
                    
                    
                  ),
                  SizedBox(height: 24.0),
                  
                  Text(
                    'Test List',
                    style: TextStyle(
                      color: Color.fromRGBO(35, 32, 158, 1),
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    width: 1000,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: Color.fromRGBO(35, 32, 158, 1),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: testFieldsList.length,
                      itemBuilder: (context, index) {
                        final fields = testFieldsList[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              
                              TextField(
                                style: TextStyle(
                                  color: Color.fromRGBO(35, 32, 158, 1),
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Select Test',
                                  labelStyle: TextStyle(
                                    color: Color.fromRGBO(179, 179, 179, 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(35, 32, 158, 1),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(35, 32, 158, 1),
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    fields.selectTest = value;
                                  });
                                },
                              ),
                              SizedBox(height: 8.0),
                              TextField(
                                style: TextStyle(
                                  color: Color.fromRGBO(35, 32, 158, 1),
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Note',
                                  labelStyle: TextStyle(
                                    color: Color.fromRGBO(179, 179, 179, 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(35, 32, 158, 1),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(35, 32, 158, 1),
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState
(() {
                                    fields.note = value;
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.remove_circle),
                                color: Color.fromRGBO(35, 32, 158, 1),
                                onPressed: () {
                                  setState(() {
                                    testFieldsList.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        testFieldsList.add(TestFields());
                      });
                    },
                    child: Text('Add Test'),
                        style: ElevatedButton.styleFrom(
      primary: Color.fromRGBO(35, 32, 158, 1),
      onPrimary: Colors.white,
    ),
                    
                    
                  ),
                  Container(
  alignment: Alignment.bottomRight, // Aligns the button to the bottom right
  child: ElevatedButton(
    onPressed: () {
      // Add patient logic here
    },
    child: Text('Confirm'),
    style: ElevatedButton.styleFrom(
      primary: Color.fromRGBO(35, 32, 158, 1),
      onPrimary: Colors.white,
    ),
  ),
)
                ],
              ),
            ),
            SizedBox(height: 16.0),


          ],
        ),
      ),
    );
  }
}
