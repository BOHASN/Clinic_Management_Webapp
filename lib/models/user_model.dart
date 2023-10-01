class User {
  final String userName;
  final String userPassword;
  final int id;

  User({
    required this.userName,
    required this.userPassword,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: int.parse(json['id']),
      userName: json['Username'],
      userPassword: json['Userpassword'], 

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Username' :userName,
      'Userpassword': userPassword,
    };
  }
}
