class Bill {
  final String billPatientname;
  final String billDate;
  final String billAmount;
  final String billNote;
  final int id;

  Bill({
    required this.billPatientname,
    required this.billDate,
    required this.billAmount,
    required this.billNote,
    required this.id,
  });

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      id: int.parse(json['id']),
      billPatientname: json['Billpatientname'],
      billDate: json['Billdate'], 
      billAmount: json['Billamount'],
      billNote:json ['Billnote'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Billpatientname' :billPatientname,
      'Billdate': billAmount,
      'Billamount': billAmount,
      'Billnote': billDate,
    };
  }
}
