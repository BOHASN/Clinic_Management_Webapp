import 'package:clinic_managment/constants.dart';
import 'package:clinic_managment/screens/prescription/prescription/view_allprescriptions/view_allprescription.header.dart';
import 'package:flutter/material.dart';


class ViewAllPrescriptionsScreen extends StatelessWidget {
  const ViewAllPrescriptionsScreen ({Key? key});


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
                    color: Color.fromRGBO(228, 228, 231,1), // set the background color of the box
                    child: ViewAllPrescriptionsHeader(), // This is a custom widget that needs to be implemented
                  );
                },
              ),
            ),
            Table(
              border: TableBorder.all(color: Colors.black26,),
              children: [
                TableRow(children: [
                                    TableCell(
                    child: Container(
                      color: Color.fromRGBO(228, 228, 231,1),
                      height: 40,
                      child: Center(
                        child: Text('Prescription ID',
                         style: TextStyle(color: Color.fromRGBO(35, 32, 158,1)),),
                      ),
                    ),
                  ),

                  TableCell(
                    child: Container(
                      color: Color.fromRGBO(228, 228, 231,1),
                      height: 40,
                      child: Center(
                        child: Text('Patient Name',
                         style: TextStyle(color: Color.fromRGBO(35, 32, 158,1)),
                        ),
                      ),
                    ),
                  ),
                                    TableCell(
                    child: Container(
                      color: Color.fromRGBO(228, 228, 231,1),
                      height: 40,
                      child: Center(
                        child: Text('Content',
                         style: TextStyle(color: Color.fromRGBO(35, 32, 158,1)),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      color: Color.fromRGBO(228, 228, 231,1),
                      height: 40,
                      child: Center(
                        child: Text('Action',
                         style: TextStyle(color: Color.fromRGBO(35, 32, 158,1)),),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



