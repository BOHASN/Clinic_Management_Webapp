import 'package:flutter/material.dart';

import '../screens/accounting/billing/add_bill_page.dart';
import '../screens/accounting/report/view_allreports_page.dart';
import '../screens/appointments/add_appointment/add_appointment_page.dart';
import '../screens/appointments/all_appointments/all_appointments_page.dart';
import '../screens/patients/add_patient/add_patient_page.dart';
import '../screens/patients/view_patients/view_patients_page.dart';
import '../screens/prescription/medicine/add_medicine/add_medicine_page.dart';
import '../screens/prescription/prescription/add_prescription/add_prescription_page.dart';
import '../screens/prescription/tests/add_test/add_test_page.dart';
import '../screens/main/main_screen.dart';
import '../screens/user managment/add_user/add_user_page.dart';
import '../screens/user managment/view_users/view_users_page.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    DrawerHeader(
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    _buildPanelSection(context),
                    _buildSection(
                      context,
                      "Patients",
                      [
                        "Add Patient",
                        "View Patients",
                      ],
                      [
                        
                        Icons.person_add,
                        Icons.view_list,
                      ],
                    ),
                    _buildSection(
                      context,
                      "Appointments",
                      [
                        "Add Appointment",
                        "Today Appointments",
                        "All Appointments",
                      ],
                      [
                        Icons.add,
                        Icons.calendar_today,
                        Icons.list,
                      ],
                    ),
                    _buildSection(
                      context,
                      "Prescription",
                      [
                        "Prescription",
                        "Medicines",
                        "Diagnosis Tests",
                      ],
                      [
                        Icons.receipt,
                        Icons.medical_services,
                        Icons.science,
                      ],
                    ),
                    _buildSection(
                      context,
                      "Accounting",
                      [
                        "Billing",
                        "Reports",
                      ],
                      [
                        Icons.attach_money,
                        Icons.analytics,
                      ],
                    ),
                    _buildSection(
                      context,
                      "User Management",
                      [
                        "Add New User",
                        "User List",
                        
                      ],
                      [
                        Icons.person_add,
                        Icons.people,
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPanelSection(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      },
      leading: Icon(
        Icons.dashboard,
        color: Color.fromARGB(137, 0, 128, 255),
      ),
      title: Text(
        "Panel",
        style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<String> items,
    List<IconData> icons,
  ) {
    List<Widget> children = items.asMap().entries.map((entry) {
      final int index = entry.key;
      final String item = entry.value;
      final IconData icon = icons.length > index ? icons[index] : Icons.help;

      return ListTile(
        onTap: () {
          Navigator.pop(context); // Close the side menu drawer
          if (item == 'Add Patient') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPatientPage()),
            );
          } else if (item == 'View Patients') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewPatientsPage()),
            );
          } else if (item == 'Add Appointment') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddAppointmentPage()),
            );
          } else if (item == 'Today Appointments') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          } else if (item == 'All Appointments') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AllAppointmentsPage()),
            );
          } else if (item == 'Prescription') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPrescriptionPage()),
            );
          } else if (item == 'Medicines') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddMedicinePage()),
            );
          } else if (item == 'Diagnosis Tests') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTestPage()),
            );
          } else if (item == 'Billing') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddBillPage()),
            );
          } else if (item == 'Reports') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewAllReportsPage()),
            );
                      } else if (item == 'Add New User') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddUserPage()),
            );
                      } else if (item == 'User List') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewUsersPage()),
            );
          }
          
        },
        leading: Icon(icon, color: Color.fromARGB(137, 0, 128, 255)),
        title: Text(
          item,
          style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
        ),
      );
    }).toList();

    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(color: Color.fromRGBO(35, 32, 158, 1)),
      ),
      children: children,
    );
  }
}
