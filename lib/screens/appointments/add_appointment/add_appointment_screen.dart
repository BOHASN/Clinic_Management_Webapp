// ignore_for_file: unused_local_variable, unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../controllers/appointment_controller.dart';
import 'add_appointment_header.dart';

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({Key? key}) : super(key: key);

  @override
  _AddAppointmentScreenState createState() => _AddAppointmentScreenState();
}


class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  int selectedSlot = -1;
  final TextEditingController _appointmentPatientnameController =
      TextEditingController();
  final TextEditingController _appointmentDateController = TextEditingController();
  final TextEditingController _reasonForvisitController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _appointmentTimeslotController = TextEditingController();

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
      List<String> names = await AppointmentController.getPatientNames();
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

void _addAppointment() async {
  String appointmentPatientname = _appointmentPatientnameController.text;
  String appointmentDate = _appointmentDateController.text;
  String reasonForvisit = _reasonForvisitController.text;
  String appointmentTimeslot = getTimeSlot(selectedSlot);

  try {
    // Call the AppointmentController to add the appointment
    String result = await AppointmentController.addAppointment(
      appointmentPatientname: appointmentPatientname,
      appointmentDate: appointmentDate,
      reasonForvisit: reasonForvisit, 
      appointmentTimeslot: appointmentTimeslot,
    );

    // Display a success message to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(result)),
    );

    // Clear the text fields after adding the appointment
    _appointmentPatientnameController.clear();
    _appointmentDateController.clear();
    _reasonForvisitController.clear();
    // Clear the selected time slot
    setState(() {
      selectedSlot = -1;
    });
  } catch (e) {
    // Display an error message to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error occurred while adding appointment')),
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
      _appointmentPatientnameController.clear();
      showFilteredResults = false; // Set the flag to false to hide the filtered results
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Color.fromRGBO(228, 228, 231, 1),
                child: AddAppointmentHeader(),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
TextField(
  controller: _appointmentPatientnameController,
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
    suffixIcon: _appointmentPatientnameController.text.isNotEmpty
        ? IconButton(
            icon: Icon(Icons.clear, color: Color.fromRGBO(35, 32, 158, 1)),
            onPressed: _clearSearch,
          )
        : null,
  ),
  onChanged: _searchPatient,
),
if (showFilteredResults)
  ListView.builder(
    shrinkWrap: true,
    itemCount: filteredPatientNames.length,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text(filteredPatientNames[index]),
        onTap: () {
          setState(() {
            _appointmentPatientnameController.text = filteredPatientNames[index];
            showFilteredResults = false;
          });
        },
      );
    },
),

                              SizedBox(height: 100.0),
                              TextField(
                                controller: _appointmentDateController,
                                style: TextStyle(
                                    color: Color.fromRGBO(35, 32, 158, 1)),
                                decoration: InputDecoration(
                                  labelText: 'Date',
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(179, 179, 179, 1)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(35, 32, 158, 1)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(35, 32, 158, 1)),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () async {
                                      DateTime? selectedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000, 1, 1),
                                        lastDate: DateTime(2030, 12, 31),
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          return Theme(
                                            data: ThemeData.light().copyWith(
                                              colorScheme: ColorScheme.light(
                                                primary: Color.fromRGBO(
                                                    35, 32, 158, 1),
                                              ),
                                            ),
                                            child: child!,
                                          );
                                        },
                                      );

                                      if (selectedDate != null) {
                                        String formattedDate =
                                            DateFormat('EEEE, MMMM d, y')
                                                .format(selectedDate);
                                        setState(() {
                                          _appointmentDateController.text = formattedDate;
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.calendar_today),
                                    color: Color.fromRGBO(35, 32, 158,
                                        1), // Set the color of the icon button to red
                                  ),
                                ),
                              ),
                              SizedBox(height: 100.0),
                              TextField(
                                controller:_reasonForvisitController,
                                style: TextStyle(
                                    color: Color.fromRGBO(35, 32, 158, 1)),
                                decoration: InputDecoration(
                                  labelText: 'Reason For Visit',
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(179, 179, 179, 1)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(35, 32, 158, 1)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(35, 32, 158, 1)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
Expanded(
  child: Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Color.fromRGBO(35, 32, 158, 1),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Available Time Slots',
            style: TextStyle(
              color: Color.fromRGBO(35, 32, 158, 1),
              fontSize: 16.0,
            ),
          ),
        ),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 2.5,
          children: List.generate(18, (index) {
            final isSelected = selectedSlot == index;
            return Padding(
              padding: EdgeInsets.all(4.0),
              child: SizedBox(
                height: 48.0,
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      selectedSlot = isSelected ? -1 : index;
                    });
                  },
                  icon: Icon(
                    Icons.access_time,
                    color: isSelected
                        ? Colors.white
                        : Color.fromARGB(255, 220, 220, 220),
                  ),
                  label: Text(
                    '${getTimeSlot(index)}',
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : Color.fromRGBO(35, 32, 158, 1),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: isSelected
                        ? Color.fromRGBO(35, 32, 158, 1)
                        : Color.fromRGBO(186, 186, 189, 1),
                    padding: EdgeInsets.all(8.0),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    ),
  ),
),


                    ],
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: _addAppointment,
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
  Future<void> dispose() async {
    _appointmentPatientnameController.dispose();
    _appointmentDateController.dispose();
    _appointmentTimeslotController.dispose();
    _reasonForvisitController.dispose();
    super.dispose();
  }

  String getTimeSlot(int index) {
    final startHour = 8 + (index ~/ 2);
    final startMinutes = (index % 2) * 30;
    final endHour = startHour + (startMinutes == 30 ? 1 : 0);
    final endMinutes = startMinutes == 30 ? 0 : 30;
    return '${startHour.toString().padLeft(2, '0')}:${startMinutes.toString().padLeft(2, '0')}-'
        '${endHour.toString().padLeft(2, '0')}:${endMinutes.toString().padLeft(2, '0')}';
  }
}
