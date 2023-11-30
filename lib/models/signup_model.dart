class SignUpModel {
  final String first_name;
  final String middle_name;
  final String last_name;
  final String mobile;
  final String password;

  SignUpModel({
    required this.first_name,
    required this.middle_name,
    required this.last_name,
    required this.mobile,
    required this.password,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      first_name: json["first_name"],
      middle_name: json["middle_name"],
      last_name: json["last_name"],
      mobile: json["mobile"],
      password: json["password"],
    );
  }
}
