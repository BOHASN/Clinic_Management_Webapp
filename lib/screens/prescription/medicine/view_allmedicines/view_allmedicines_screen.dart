import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constants.dart';
import '../../../../controllers/medicine_controller.dart';
import '../../../../models/medicine_model.dart';
import 'view_allmedicines_header.dart';

class ViewAllMedicinesScreen extends StatefulWidget {
  @override
  _ViewAllMedicinesScreenState createState() => _ViewAllMedicinesScreenState();
}

class _ViewAllMedicinesScreenState extends State<ViewAllMedicinesScreen> {
  List<Medicine> _medicines = [];

  @override
  void initState() {
    super.initState();
    _fetchMedicines();
  }

  Future<void> _fetchMedicines() async {
    try {
      List<Medicine> medicines = await MedicineController.getAllMedicines();
      setState(() {
        _medicines = medicines;
      });
    } catch (e) {
      // Handle error
    }
  }
Future<void> _deleteMedicine(int medicineId) async {
  try {
    await MedicineController.deleteMedicine(medicineId);
    setState(() {
      _medicines.removeWhere((medicine) => medicine.id == medicineId);
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
                  child: ViewAllMedicinesHeader(),
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
                            'Medicine ID',
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
                            'Medicine Name',
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
                            'Medicine Generic',
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
                            'Medicine Use',
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
                  ..._medicines.map((medicine) => TableRow(children: [
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(medicine.id.toString())),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(medicine.medicineName)),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(medicine.medicineGeneric)),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(medicine.medicineUse)),
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
                                        title: Text('Delete Medicine'),
                                        content: Text('Are you sure you want to delete this medicine?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              _deleteMedicine(medicine.id);
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