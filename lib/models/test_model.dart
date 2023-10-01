class Test {
  final String testName;
  final String testDescription;
  final String testNote;
  final int id;

  Test({
    required this.testName,
    required this.testDescription,
    required this.testNote,
    required this.id,
  });

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      id: int.parse(json['id']),
      testName: json['Testname'],
      testDescription: json['Testdescription'],
      testNote: json['Testnote'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Testname': testName,
      'Testdescription': testDescription,
      'Testnote': testNote,
    };
  }
}
