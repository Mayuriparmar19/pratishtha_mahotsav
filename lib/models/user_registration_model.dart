import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


// class UserRegistrationModel {
//   String? token;
//   String? mobile;
//   String? otp;
//   String? firstName;
//   String? middleName;
//   String? lastName;
//   String? gender;
//   String? birthDate;
//   int? age;
//   int? professionId;
//   bool? isDoctor;
//   String? email;
//   String? emergencyContact;
//   String? address;
//   String? pinCode;
//   int? countryId;
//   int? stateId;
//   String? stateName;
//   int? districtId;
//   String? districtName;
//   String? cityName;
//   String? mandal;
//   String? arrivalDate;
//   String? arrivalTime;
//   String? departureDate;
//   String? departureTime;
//   String? arrivalDateAwas;
//   String? arrivalTimeAwas;
//   String? departureDateAwas;
//   String? departureTimeAwas;
//   String? remarks;
//   bool? awasRequired;
//   String? awasType;
//   String? transportMode;
//   int? foodPreferenceId;
//   bool? isVehicle;
//   String? vehicleNumber;
//   bool? isDriver;
//   String? driverFirstName;
//   String? driverMiddleName;
//   String? driverLastName;
//   String? driverGender;
//   String? driverBirthDate;
//   bool? awasForDriver;
//   String? driverMobile;
//   List<MembersInfo>? membersInfo;
//   String? userPhoto;
//   String? driverPhoto;
//
//   UserRegistrationModel(
//       {
//         this.token,
//         this.mobile,
//         this.otp,
//         this.firstName,
//         this.middleName,
//         this.lastName,
//         this.gender,
//         this.birthDate,
//         this.age,
//         this.professionId,
//         this.isDoctor,
//         this.email,
//         this.emergencyContact,
//         this.address,
//         this.pinCode,
//         this.countryId,
//         this.stateId,
//         this.stateName,
//         this.districtId,
//         this.districtName,
//         this.cityName,
//         this.mandal,
//         this.arrivalDate,
//         this.arrivalTime,
//         this.departureDate,
//         this.departureTime,
//         this.arrivalDateAwas,
//         this.arrivalTimeAwas,
//         this.departureDateAwas,
//         this.departureTimeAwas,
//         this.remarks,
//         this.awasRequired,
//         this.awasType,
//         this.transportMode,
//         this.foodPreferenceId,
//         this.isVehicle,
//         this.vehicleNumber,
//         this.isDriver,
//         this.driverFirstName,
//         this.driverMiddleName,
//         this.driverLastName,
//         this.driverGender,
//         this.driverBirthDate,
//         this.awasForDriver,
//         this.driverMobile,
//         this.membersInfo,
//         this.userPhoto,
//         this.driverPhoto});
//
//   static Future<void> storeModel(UserRegistrationModel model) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString("userRegistrationModel",jsonEncode(model.toJson()));
//   }
//   static Future<Map<String,dynamic>> readModel() async {
//     final prefs = await SharedPreferences.getInstance();
//     return json.decode(prefs.getString("userRegistrationModel")??'{"firstName": ""}');
//   }
//
//   UserRegistrationModel.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     mobile = json['mobile'];
//     otp = json['otp'];
//     firstName = json['first_name'];
//     middleName = json['middle_name'];
//     lastName = json['last_name'];
//     gender = json['gender'];
//     birthDate = json['birth_date'];
//     age = json['age'];
//     professionId = json['profession_id'];
//     isDoctor = json['is_doctor'];
//     email = json['email'];
//     emergencyContact = json['emergency_contact'];
//     address = json['address'];
//     pinCode = json['pin_code'];
//     countryId = json['country_id'];
//     stateId = json['state_id'];
//     stateName = json['state_name'];
//     districtId = json['district_id'];
//     districtName = json['district_name'];
//     cityName = json['city_name'];
//     mandal = json['mandal'];
//     arrivalDate = json['arrival_date'];
//     arrivalTime = json['arrival_time'];
//     departureDate = json['departure_date'];
//     departureTime = json['departure_time'];
//     arrivalDateAwas = json['arrival_date_awas'];
//     arrivalTimeAwas = json['arrival_time_awas'];
//     departureDateAwas = json['departure_date_awas'];
//     departureTimeAwas = json['departure_time_awas'];
//     remarks = json['remarks'];
//     awasRequired = json['awas_required'];
//     awasType = json['awas_type'];
//     transportMode = json['transport_mode'];
//     foodPreferenceId = json['food_preference_id'];
//     isVehicle = json['is_vehicle'];
//     vehicleNumber = json['vehicle_number'];
//     isDriver = json['is_driver'];
//     driverFirstName = json['driver_first_name'];
//     driverMiddleName = json['driver_middle_name'];
//     driverLastName = json['driver_last_name'];
//     driverGender = json['driver_gender'];
//     driverBirthDate = json['driver_birth_date'];
//     awasForDriver = json['awas_for_driver'];
//     driverMobile = json['driver_mobile'];
//     if (json['members_info'] != null) {
//       membersInfo = <MembersInfo>[];
//       json['members_info'].forEach((v) {
//         membersInfo!.add(new MembersInfo.fromJson(v));
//       });
//     }
//     userPhoto = json['user_photo'];
//     driverPhoto = json['driver_photo'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['token'] = this.token;
//     data['mobile'] = this.mobile;
//     data['otp'] = this.otp;
//     data['first_name'] = this.firstName;
//     data['middle_name'] = this.middleName;
//     data['last_name'] = this.lastName;
//     data['gender'] = this.gender;
//     data['birth_date'] = this.birthDate;
//     data['age'] = this.age;
//     data['profession_id'] = this.professionId;
//     data['is_doctor'] = this.isDoctor;
//     data['email'] = this.email;
//     data['emergency_contact'] = this.emergencyContact;
//     data['address'] = this.address;
//     data['pin_code'] = this.pinCode;
//     data['country_id'] = this.countryId;
//     data['state_id'] = this.stateId;
//     data['state_name'] = this.stateName;
//     data['district_id'] = this.districtId;
//     data['district_name'] = this.districtName;
//     data['city_name'] = this.cityName;
//     data['mandal'] = this.mandal;
//     data['arrival_date'] = this.arrivalDate;
//     data['arrival_time'] = this.arrivalTime;
//     data['departure_date'] = this.departureDate;
//     data['departure_time'] = this.departureTime;
//     data['arrival_date_awas'] = this.arrivalDateAwas;
//     data['arrival_time_awas'] = this.arrivalTimeAwas;
//     data['departure_date_awas'] = this.departureDateAwas;
//     data['departure_time_awas'] = this.departureTimeAwas;
//     data['remarks'] = this.remarks;
//     data['awas_required'] = this.awasRequired;
//     data['awas_type'] = this.awasType;
//     data['transport_mode'] = this.transportMode;
//     data['food_preference_id'] = this.foodPreferenceId;
//     data['is_vehicle'] = this.isVehicle;
//     data['vehicle_number'] = this.vehicleNumber;
//     data['is_driver'] = this.isDriver;
//     data['driver_first_name'] = this.driverFirstName;
//     data['driver_middle_name'] = this.driverMiddleName;
//     data['driver_last_name'] = this.driverLastName;
//     data['driver_gender'] = this.driverGender;
//     data['driver_birth_date'] = this.driverBirthDate;
//     data['awas_for_driver'] = this.awasForDriver;
//     data['driver_mobile'] = this.driverMobile;
//     if (this.membersInfo != null) {
//       data['members_info'] = this.membersInfo!.map((v) => v.toJson()).toList();
//     }
//     data['user_photo'] = this.userPhoto;
//     data['driver_photo'] = this.driverPhoto;
//     return data;
//   }
// }
//
// class MembersInfo {
//   String? memberMobile;
//   String? memberFirstName;
//   String? memberMiddleName;
//   String? memberLastName;
//   String? memberGender;
//   String? memberBirthDate;
//   int? memberAge;
//   String? memberProfessionId;
//   bool? memberIsDoctor;
//   String? memberEmail;
//   String? memberEmergencyContact;
//   String? memberAddress;
//   String? memberPinCode;
//   int? memberCountryId;
//   int? memberStateId;
//   String? memberCityName;
//   String? memberMandal;
//   String? remark;
//   bool? awasForMember;
//   String? visitingDateFrom;
//   String? visitingDateTo;
//   String? awasType;
//   String? transportMode;
//   int? foodPreferenceId;
//   String? memberImage;
//
//   MembersInfo(
//       {this.memberMobile,
//         this.memberFirstName,
//         this.memberMiddleName,
//         this.memberLastName,
//         this.memberGender,
//         this.memberBirthDate,
//         this.memberAge,
//         this.memberProfessionId,
//         this.memberIsDoctor,
//         this.memberEmail,
//         this.memberEmergencyContact,
//         this.memberAddress,
//         this.memberPinCode,
//         this.memberCountryId,
//         this.memberStateId,
//         this.memberCityName,
//         this.memberMandal,
//         this.remark,
//         this.awasForMember,
//         this.visitingDateFrom,
//         this.visitingDateTo,
//         this.awasType,
//         this.transportMode,
//         this.foodPreferenceId,
//         this.memberImage});
//
//   MembersInfo.fromJson(Map<String, dynamic> json) {
//     memberMobile = json['member_mobile'];
//     memberFirstName = json['member_first_name'];
//     memberMiddleName = json['member_middle_name'];
//     memberLastName = json['member_last_name'];
//     memberGender = json['member_gender'];
//     memberBirthDate = json['member_birth_date'];
//     memberAge = json['member_age'];
//     memberProfessionId = json['member_profession_id'];
//     memberIsDoctor = json['member_is_doctor'];
//     memberEmail = json['member_email'];
//     memberEmergencyContact = json['member_emergency_contact'];
//     memberAddress = json['member_address'];
//     memberPinCode = json['member_pin_code'];
//     memberCountryId = json['member_country_id'];
//     memberStateId = json['member_state_id'];
//     memberCityName = json['member_city_name'];
//     memberMandal = json['member_mandal'];
//     remark = json['remark'];
//     awasForMember = json['awas_for_member'];
//     visitingDateFrom = json['visiting_date_from'];
//     visitingDateTo = json['visiting_date_to'];
//     awasType = json['awas_type'];
//     transportMode = json['transport_mode'];
//     foodPreferenceId = json['food_preference_id'];
//     memberImage = json['member_image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['member_mobile'] = this.memberMobile;
//     data['member_first_name'] = this.memberFirstName;
//     data['member_middle_name'] = this.memberMiddleName;
//     data['member_last_name'] = this.memberLastName;
//     data['member_gender'] = this.memberGender;
//     data['member_birth_date'] = this.memberBirthDate;
//     data['member_age'] = this.memberAge;
//     data['member_profession_id'] = this.memberProfessionId;
//     data['member_is_doctor'] = this.memberIsDoctor;
//     data['member_email'] = this.memberEmail;
//     data['member_emergency_contact'] = this.memberEmergencyContact;
//     data['member_address'] = this.memberAddress;
//     data['member_pin_code'] = this.memberPinCode;
//     data['member_country_id'] = this.memberCountryId;
//     data['member_state_id'] = this.memberStateId;
//     data['member_city_name'] = this.memberCityName;
//     data['member_mandal'] = this.memberMandal;
//     data['remark'] = this.remark;
//     data['awas_for_member'] = this.awasForMember;
//     data['visiting_date_from'] = this.visitingDateFrom;
//     data['visiting_date_to'] = this.visitingDateTo;
//     data['awas_type'] = this.awasType;
//     data['transport_mode'] = this.transportMode;
//     data['food_preference_id'] = this.foodPreferenceId;
//     data['member_image'] = this.memberImage;
//     return data;
//   }
// }

class UserRegistrationModel {
  String? token;
  String? mobile;
  String? otp;
  String? firstName;
  String? middleName;
  String? lastName;
  String? gender;
  String? birthDate;
  int? age;
  int? professionId;
  bool? isDoctor;
  String? email;
  String? emergencyContact;
  String? address;
  String? pinCode;
  int? countryId;
  int? stateId;
  String? stateName;
  int? districtId;
  String? districtName;
  String? cityName;
  String? mandal;
  String? arrivalDate;
  String? arrivalTime;
  String? departureDate;
  String? departureTime;
  String? arrivalDateAwas;
  String? arrivalTimeAwas;
  String? departureDateAwas;
  String? departureTimeAwas;
  String? remarks;
  bool? awasRequired;
  String? awasType;
  String? transportMode;
  int? foodPreferenceId;
  bool? isVehicle;
  String? vehicleNumber;
  bool? isDriver;
  String? driverFirstName;
  String? driverMiddleName;
  String? driverLastName;
  String? driverGender;
  String? driverBirthDate;
  bool? awasForDriver;
  String? driverMobile;
  List<MembersInfo>? membersInfo;
  String? userPhoto;
  String? driverPhoto;

  UserRegistrationModel(
      {this.token,
        this.mobile,
        this.otp,
        this.firstName,
        this.middleName,
        this.lastName,
        this.gender,
        this.birthDate,
        this.age,
        this.professionId,
        this.isDoctor,
        this.email,
        this.emergencyContact,
        this.address,
        this.pinCode,
        this.countryId,
        this.stateId,
        this.stateName,
        this.districtId,
        this.districtName,
        this.cityName,
        this.mandal,
        this.arrivalDate,
        this.arrivalTime,
        this.departureDate,
        this.departureTime,
        this.arrivalDateAwas,
        this.arrivalTimeAwas,
        this.departureDateAwas,
        this.departureTimeAwas,
        this.remarks,
        this.awasRequired,
        this.awasType,
        this.transportMode,
        this.foodPreferenceId,
        this.isVehicle,
        this.vehicleNumber,
        this.isDriver,
        this.driverFirstName,
        this.driverMiddleName,
        this.driverLastName,
        this.driverGender,
        this.driverBirthDate,
        this.awasForDriver,
        this.driverMobile,
        this.membersInfo,
        this.userPhoto,
        this.driverPhoto});
  static Future<void> storeModel(UserRegistrationModel model) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("userRegistrationModel",jsonEncode(model.toJson()));
  }
  static Future<Map<String,dynamic>> readModel() async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString("userRegistrationModel")??'{"firstName": ""}');
  }

  UserRegistrationModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    mobile = json['mobile'];
    otp = json['otp'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    age = json['age'];
    professionId = json['profession_id'];
    isDoctor = json['is_doctor'];
    email = json['email'];
    emergencyContact = json['emergency_contact'];
    address = json['address'];
    pinCode = json['pin_code'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    stateName = json['state_name'];
    districtId = json['district_id'];
    districtName = json['district_name'];
    cityName = json['city_name'];
    mandal = json['mandal'];
    arrivalDate = json['arrival_date'];
    arrivalTime = json['arrival_time'];
    departureDate = json['departure_date'];
    departureTime = json['departure_time'];
    arrivalDateAwas = json['arrival_date_awas'];
    arrivalTimeAwas = json['arrival_time_awas'];
    departureDateAwas = json['departure_date_awas'];
    departureTimeAwas = json['departure_time_awas'];
    remarks = json['remarks'];
    awasRequired = json['awas_required'];
    awasType = json['awas_type'];
    transportMode = json['transport_mode'];
    foodPreferenceId = json['food_preference_id'];
    isVehicle = json['is_vehicle'];
    vehicleNumber = json['vehicle_number'];
    isDriver = json['is_driver'];
    driverFirstName = json['driver_first_name'];
    driverMiddleName = json['driver_middle_name'];
    driverLastName = json['driver_last_name'];
    driverGender = json['driver_gender'];
    driverBirthDate = json['driver_birth_date'];
    awasForDriver = json['awas_for_driver'];
    driverMobile = json['driver_mobile'];
    if (json['members_info'] != null) {
      membersInfo = <MembersInfo>[];
      json['members_info'].forEach((v) {
        membersInfo!.add(new MembersInfo.fromJson(v));
      });
    }
    userPhoto = json['user_photo'];
    driverPhoto = json['driver_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['mobile'] = this.mobile;
    data['otp'] = this.otp;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['birth_date'] = this.birthDate;
    data['age'] = this.age;
    data['profession_id'] = this.professionId;
    data['is_doctor'] = this.isDoctor;
    data['email'] = this.email;
    data['emergency_contact'] = this.emergencyContact;
    data['address'] = this.address;
    data['pin_code'] = this.pinCode;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['state_name'] = this.stateName;
    data['district_id'] = this.districtId;
    data['district_name'] = this.districtName;
    data['city_name'] = this.cityName;
    data['mandal'] = this.mandal;
    data['arrival_date'] = this.arrivalDate;
    data['arrival_time'] = this.arrivalTime;
    data['departure_date'] = this.departureDate;
    data['departure_time'] = this.departureTime;
    data['arrival_date_awas'] = this.arrivalDateAwas;
    data['arrival_time_awas'] = this.arrivalTimeAwas;
    data['departure_date_awas'] = this.departureDateAwas;
    data['departure_time_awas'] = this.departureTimeAwas;
    data['remarks'] = this.remarks;
    data['awas_required'] = this.awasRequired;
    data['awas_type'] = this.awasType;
    data['transport_mode'] = this.transportMode;
    data['food_preference_id'] = this.foodPreferenceId;
    data['is_vehicle'] = this.isVehicle;
    data['vehicle_number'] = this.vehicleNumber;
    data['is_driver'] = this.isDriver;
    data['driver_first_name'] = this.driverFirstName;
    data['driver_middle_name'] = this.driverMiddleName;
    data['driver_last_name'] = this.driverLastName;
    data['driver_gender'] = this.driverGender;
    data['driver_birth_date'] = this.driverBirthDate;
    data['awas_for_driver'] = this.awasForDriver;
    data['driver_mobile'] = this.driverMobile;
    if (this.membersInfo != null) {
      data['members_info'] = this.membersInfo!.map((v) => v.toJson()).toList();
    }
    data['user_photo'] = this.userPhoto;
    data['driver_photo'] = this.driverPhoto;
    return data;
  }
}

class MembersInfo {
  String? memberMobile;
  String? memberFirstName;
  String? memberMiddleName;
  String? memberLastName;
  String? memberGender;
  String? memberBirthDate;
  int? memberAge;
  String? memberProfessionId;
  bool? memberIsDoctor;
  String? memberEmail;
  String? memberEmergencyContact;
  String? memberAddress;
  String? memberPinCode;
  int? memberCountryId;
  int? memberStateId;
  String? memberCityName;
  String? memberMandal;
  String? remark;
  bool? awasForMember;
  String? visitingDateFrom;
  String? visitingDateTo;
  String? awasType;
  String? transportMode;
  int? foodPreferenceId;
  String? memberImage;

  MembersInfo(
      {this.memberMobile,
        this.memberFirstName,
        this.memberMiddleName,
        this.memberLastName,
        this.memberGender,
        this.memberBirthDate,
        this.memberAge,
        this.memberProfessionId,
        this.memberIsDoctor,
        this.memberEmail,
        this.memberEmergencyContact,
        this.memberAddress,
        this.memberPinCode,
        this.memberCountryId,
        this.memberStateId,
        this.memberCityName,
        this.memberMandal,
        this.remark,
        this.awasForMember,
        this.visitingDateFrom,
        this.visitingDateTo,
        this.awasType,
        this.transportMode,
        this.foodPreferenceId,
        this.memberImage});

  MembersInfo.fromJson(Map<String, dynamic> json) {
    memberMobile = json['member_mobile'];
    memberFirstName = json['member_first_name'];
    memberMiddleName = json['member_middle_name'];
    memberLastName = json['member_last_name'];
    memberGender = json['member_gender'];
    memberBirthDate = json['member_birth_date'];
    memberAge = json['member_age'];
    memberProfessionId = json['member_profession_id'];
    memberIsDoctor = json['member_is_doctor'];
    memberEmail = json['member_email'];
    memberEmergencyContact = json['member_emergency_contact'];
    memberAddress = json['member_address'];
    memberPinCode = json['member_pin_code'];
    memberCountryId = json['member_country_id'];
    memberStateId = json['member_state_id'];
    memberCityName = json['member_city_name'];
    memberMandal = json['member_mandal'];
    remark = json['remark'];
    awasForMember = json['awas_for_member'];
    visitingDateFrom = json['visiting_date_from'];
    visitingDateTo = json['visiting_date_to'];
    awasType = json['awas_type'];
    transportMode = json['transport_mode'];
    foodPreferenceId = json['food_preference_id'];
    memberImage = json['member_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member_mobile'] = this.memberMobile;
    data['member_first_name'] = this.memberFirstName;
    data['member_middle_name'] = this.memberMiddleName;
    data['member_last_name'] = this.memberLastName;
    data['member_gender'] = this.memberGender;
    data['member_birth_date'] = this.memberBirthDate;
    data['member_age'] = this.memberAge;
    data['member_profession_id'] = this.memberProfessionId;
    data['member_is_doctor'] = this.memberIsDoctor;
    data['member_email'] = this.memberEmail;
    data['member_emergency_contact'] = this.memberEmergencyContact;
    data['member_address'] = this.memberAddress;
    data['member_pin_code'] = this.memberPinCode;
    data['member_country_id'] = this.memberCountryId;
    data['member_state_id'] = this.memberStateId;
    data['member_city_name'] = this.memberCityName;
    data['member_mandal'] = this.memberMandal;
    data['remark'] = this.remark;
    data['awas_for_member'] = this.awasForMember;
    data['visiting_date_from'] = this.visitingDateFrom;
    data['visiting_date_to'] = this.visitingDateTo;
    data['awas_type'] = this.awasType;
    data['transport_mode'] = this.transportMode;
    data['food_preference_id'] = this.foodPreferenceId;
    data['member_image'] = this.memberImage;
    return data;
  }
}
