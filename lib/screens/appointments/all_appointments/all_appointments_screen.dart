import 'package:clinic_managment/constants.dart';
import 'package:clinic_managment/models/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../controllers/appointment_controller.dart';
import 'all_appointments_header.dart';

class AllAppointmentsScreen extends StatefulWidget {
  @override
  _AllAppointmentsScreenState createState() => _AllAppointmentsScreenState();
}
class _AllAppointmentsScreenState extends State<AllAppointmentsScreen> {
  List<Appointment> _appointments = [];

  @override
  void initState() {
    super.initState();
    _fetchAppointments();
  }

  Future<void> _fetchAppointments() async {
    try {
      List<Appointment> appointments = await AppointmentController.getAllAppointments();
      setState(() {
        _appointments = appointments;
      });
    } catch (e) {
      // Handle error
    }
  }
  Future<void> _deleteAppointment(int appointmentId) async {
  try {
    await AppointmentController.deleteAppointment(appointmentId);
    setState(() {
      _appointments.removeWhere((appointment) =>appointment.id == appointmentId);
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
                    color: Color.fromRGBO(228, 228, 231,1), // set the background color of the box
                    child: AllAppointmentsHeader(), // This is a custom widget that needs to be implemented
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
                        child: Text('Reason For Visit',
                         style: TextStyle(color: Color.fromRGBO(35, 32, 158,1)),),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      color: Color.fromRGBO(228, 228, 231,1),
                      height: 40,
                      child: Center(
                        child: Text('Date',
                         style: TextStyle(color: Color.fromRGBO(35, 32, 158,1)),),
                      ),
                    ),
                  ),
                                    TableCell(
                    child: Container(
                      color: Color.fromRGBO(228, 228, 231,1),
                      height: 40,
                      child: Center(
                        child: Text('Time',
                         style: TextStyle(color: Color.fromRGBO(35, 32, 158,1)),),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      color: Color.fromRGBO(228, 228, 231,1),
                      height: 40,
                      child: Center(
                        child: Text('Status',
                         style: TextStyle(color: Color.fromRGBO(35, 32, 158,1)),),
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
                  ..._appointments.map((appointment) => TableRow(children: [
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(appointment.appointmentPatientname)),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(appointment.reasonForvisit)),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(appointment.appointmentDate)),
                      ),
                    ),
                     TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text(appointment.appointmentTimeslot)),
                      ),
                    ),
                      TableCell(
                      child: Container(
                        height: 40,
                        child: Center(child: Text("Waiting")),
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
                                        title: Text('Delete Appointment'),
                                        content: Text('Are you sure you want to delete this appointment?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              _deleteAppointment(appointment.id);
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
