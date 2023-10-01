import 'package:clinic_managment/constants.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';

class PanelScreen extends StatefulWidget {
  const PanelScreen({Key? key});

  @override
  _PanelScreenState createState() => _PanelScreenState();
}

class _PanelScreenState extends State<PanelScreen> {
  bool showSideMenu = true;

  void toggleSideMenu() {
    setState(() {
      showSideMenu = !showSideMenu;
    });
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
              child: Container(
                padding: EdgeInsets.all(defaultPadding),
                color: Color.fromRGBO(228, 228, 231, 1),
                child: Header(),
              ),
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Table(
                  border: TableBorder.all(color: Colors.black26),
                  columnWidths: {
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(),
                    2: FlexColumnWidth(),
                    3: FlexColumnWidth(),
                    4: FlexColumnWidth(),

                  },
                  children: [
                    TableRow(children: [
                      _buildTableCell(constraints, 'Patient Name'),
                      _buildTableCell(constraints, 'Reason For Visit'),
                      _buildTableCell(constraints, 'Time'),
                      _buildTableCell(constraints, 'Status'),
                      _buildTableCell(constraints, 'Action'),
                    ]),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  TableCell _buildTableCell(BoxConstraints constraints, String text) {
    return TableCell(
      child: Container(
        color: Color.fromRGBO(228, 228, 231, 1),
        height: 40,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
          ),
        ),
      ),
    );
  }
}
