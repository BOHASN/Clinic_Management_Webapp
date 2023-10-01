class Appointment {
  final String appointmentPatientname;
  final String appointmentDate;
  final String appointmentTimeslot;
  final String reasonForvisit;
  final int id;

  Appointment({
    required this.appointmentPatientname,
    required this.appointmentDate,
    required this.appointmentTimeslot,
    required this.reasonForvisit,
    required this.id,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: int.parse(json['id']),
      appointmentPatientname: json['Appointmentpatientname'],
      appointmentDate: json['Appointmentdate'], 
      appointmentTimeslot: json['Appointmenttimeslot'],
      reasonForvisit:json ['Reasonforvisit'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Appointmentpatientname' :appointmentPatientname,
      'Appointmentdate': appointmentDate,
      'Appointmenttimeslot': appointmentTimeslot,
      'Reasonforviit': reasonForvisit,
    };
  }
}
