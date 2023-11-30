import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class VolunteerRegistrationModel {
  String? fullName;
  String? gender;
  String? dateOfBirth;
  String? trust;
  List<dynamic>? language;
  String? jobProfile;
  String? Image;
  String? address;
  String? country;
  String? pinCode;
  String? state;
  String? city;
  String? whatsappNumber;
  String? participateOrNOt;
  String? department;
  List<dynamic>? departmenrList;
  String? days;
  String? suggestion;
  //List<String>? skills;

  VolunteerRegistrationModel(
      {this.fullName,
        this.gender,
        this.dateOfBirth,
        this.trust,
        this.language,
        this.jobProfile,
        this.address,
        this.country,
        this.pinCode,
        this.state,
        this.city,
        this.whatsappNumber,
        this.participateOrNOt,
        this.department,
        this.departmenrList,
        this.days,
        this.suggestion,
        this.Image,
       // this.skills
      });

  VolunteerRegistrationModel.fromJson(Map<String, dynamic> json) {
    fullName = json['FullName'];
    gender = json['Gender'];
    dateOfBirth = json['DateOfBirth'];
    trust = json['Trust'];
    language = json['Language']; //.cast<String>();
    jobProfile = json['jobProfile'];
    Image = json["Image"];
    address = json['Address'];
    country = json['Country'];
    pinCode = json['PinCode'];
    state = json['State'];
    city = json['City'];
    whatsappNumber = json['WhatsappNumber'];
    participateOrNOt = json['ParticipateOrNOt'];
    department = json['Department'];
    departmenrList = json['DepartmenrList'];
    days = json['Days'];
    suggestion = json['Suggestion'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FullName'] = fullName;
    data['Gender'] = gender;
    data['DateOfBirth'] = dateOfBirth;
    data['Trust'] = trust;
    data['Language'] = language;
    data['jobProfile'] = jobProfile;
    data['Image'] = Image;
    data['Address'] = address;
    data['Country'] = country;
    data['PinCode'] = pinCode;
    data['State'] = state;
    data['City'] = city;
    data['WhatsappNumber'] = whatsappNumber;
    data['ParticipateOrNOt'] = participateOrNOt;
    data['Department'] = department;
    data['DepartmenrList'] = departmenrList;
    data['Days'] = days;
    data['Suggestion'] = suggestion;
    //data["Skills"] = skills;
    return data;
  }
  static Future<void> storeModel(VolunteerRegistrationModel model) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("volunteerRegistrationModel",jsonEncode(model.toJson()));
  }
  static Future<Map<String,dynamic>> readModel() async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString("volunteerRegistrationModel")??'{"Language":null}');
  }
}
