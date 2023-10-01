class Patient {
  final String patientName;
  final String patientEmail;
  final String patientAddress;
  final String patientGender;
  final String patientBirthdate;
  final String patientBloodgroup;
  final String patientCon;
  final String patientSpecialneeds;
  final String patientPhonenumber;
  final int id;

  Patient(
      {required this.patientName,
      required this.patientEmail,
      required this.patientAddress,
      required this.patientGender,
      required this.patientBirthdate,
      required this.patientBloodgroup,
      required this.patientSpecialneeds,
      required this.patientCon,
      required this.patientPhonenumber,
      required this.id});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: int.parse(json['id']),
      patientName: json['Patientname'],
      patientEmail: json['Patientemail'],
      patientAddress: json['Patientaddress'],
      patientGender: json['Patientgender'],
      patientBirthdate: json['Patientbirthdate'],
      patientBloodgroup: json['Patientbloodgroup'],
      patientSpecialneeds: json['Patientspecialneeds'],
      patientCon: json['Patientcon'],
      patientPhonenumber: json['Patientphonenumber'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Patientname': patientName,
      'Patientbirthdate': patientBirthdate,
      'Patientphonenumber': patientPhonenumber,
      'Patientbloodgroup': patientBloodgroup,
      'Patientspecialneeds': patientSpecialneeds,
    };
  }
}
