class Medicine {
  final String medicineName;
  final String medicineGeneric;
  final String medicineUse;
  final int id;

  Medicine({
    required this.medicineName,
    required this.medicineGeneric,
    required this.medicineUse,
    required this.id,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: int.parse(json['id']),
      medicineName: json['Medicinename'],
      medicineGeneric: json['Medicinegeneric'],
      medicineUse: json['Medicineuse'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Medicinename': medicineName,
      'Medicinegeneric': medicineGeneric,
      'Medicineuse': medicineUse,
    };
  }
}
