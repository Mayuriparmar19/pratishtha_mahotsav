import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pratishtha_mahotsav/home_and_profile/btm_bar.dart';
import 'customwidgets/custom_text_form_field.dart';
import 'customwidgets/custom_text_form_label.dart';
import 'models/StatesModel.dart';
import 'models/countries_model.dart';
import 'models/food_preference_model.dart';
import 'models/user_registration_model.dart';
import 'api/api_helper.dart';
import 'customwidgets/custom_date_form_field.dart';
import 'customwidgets/custom_image_form_field.dart';
import 'form_validator.dart';

class RegisterForm3 extends StatefulWidget {
  const RegisterForm3({
    Key? key,
    this.onPressed,
    required this.model,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final UserRegistrationModel model;
  @override
  State<RegisterForm3> createState() => _RegisterForm3State();
}

enum Gender { male, female }

enum Bool { yes, no }

class _RegisterForm3State extends State<RegisterForm3> {
  ScrollController scrollCtrl = ScrollController();

  final GlobalKey<FormState> vehicalFormKey = GlobalKey<FormState>();
  TextEditingController driverDOBCtrl = TextEditingController();
  Gender? _driverGender = Gender.male;
  Bool? _awasDriver = Bool.yes;
  Bool? _vehical = Bool.yes;
  Bool? _driver = Bool.yes;
  String? vehicalType;
  TextEditingController vehicalNumberCtrl = TextEditingController();
  TextEditingController driverMobileNumber = TextEditingController();
  TextEditingController driverFirstName = TextEditingController();
  TextEditingController driverMiddleName = TextEditingController();
  TextEditingController driverLastName = TextEditingController();

  final GlobalKey<FormState> form2Keys = GlobalKey<FormState>();
  int? editId;
  bool inEditMode = false;
  bool memberFormVisible = false;
  @override
  void initState() {
    _vehical = widget.model.isVehicle == false ? Bool.no : Bool.yes;
    //TODO: vehicalType = widget.model.vehicalType;
    vehicalNumberCtrl.text = widget.model.vehicleNumber ?? "";
    _driver = widget.model.isDriver == false ? Bool.no : Bool.yes;
    driverMobileNumber.text = widget.model.driverMobile ?? "";
    driverFirstName.text = widget.model.driverFirstName ?? "";
    driverMiddleName.text = widget.model.driverMiddleName ?? "";
    driverLastName.text = widget.model.driverLastName ?? "";
    _driverGender =
        widget.model.driverGender == "Female" ? Gender.female : Gender.male;
    driverDOBCtrl.text = widget.model.driverBirthDate == null
        ? ""
        : DateFormat("dd-MM-yyyy").format(
            DateFormat("yyyy-MM-dd").parse(widget.model.driverBirthDate!));
    _awasDriver = widget.model.awasForDriver == false ? Bool.no : Bool.yes;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(top: 16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadiusDirectional.vertical(top: Radius.circular(20))),
      child: SingleChildScrollView(
        controller: scrollCtrl,
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextFormFieldLabel(
                      title: "Vehicle and Driver / Helper Information",
                      isRequired: false),
                  Row(
                    children: [
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(children: [
                          TextSpan(
                            text: "Vehicle",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF323232)),
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF0000)),
                          ),
                        ]),
                      ),
                      Radio(
                          value: Bool.yes,
                          groupValue: _vehical,
                          onChanged: (Bool? value) {
                            setState(() {
                              _vehical = value;
                            });
                          }),
                      const Text(
                        "Yes",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF323232)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Radio(
                          value: Bool.no,
                          groupValue: _vehical,
                          onChanged: (Bool? value) {
                            setState(() {
                              _vehical = value;
                            });
                          }),
                      const Text(
                        "No",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF323232)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Form(
                key: vehicalFormKey,
                child: _vehical == Bool.yes
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //TODO:implement after vihical type api
                          // CustomTextFormDropDown(
                          //     title: "Vehicle Type",
                          //     isRequired: true,
                          //     items: const ["Car", "Bike"],
                          //     hint: "Select Vehicle Type",
                          //     validator: (input) =>
                          //         Validator.notNullValidator(input),
                          //     onChanged: (value) => vehicalType = value,
                          //     value: vehicalType),
                          CustomTextFormField(
                            title: "Vehicle Number",
                            isRequired: true,
                            hint: "GJ 01 UD 4695",
                            validator: (input) =>
                                Validator.notNullValidator(input),
                            controller: vehicalNumberCtrl,
                          ),
                          Row(
                            children: [
                              RichText(
                                textAlign: TextAlign.start,
                                text: const TextSpan(children: [
                                  TextSpan(
                                    text: "Driver",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF323232)),
                                  ),
                                  TextSpan(
                                    text: "*",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFF0000)),
                                  ),
                                ]),
                              ),
                              Radio(
                                  value: Bool.yes,
                                  groupValue: _driver,
                                  onChanged: (Bool? value) {
                                    setState(() {
                                      _driver = value;
                                    });
                                  }),
                              const Text(
                                "Yes",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF323232)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Radio(
                                  value: Bool.no,
                                  groupValue: _driver,
                                  onChanged: (Bool? value) {
                                    setState(() {
                                      _driver = value;
                                    });
                                  }),
                              const Text(
                                "No",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF323232)),
                              )
                            ],
                          ),
                          // driver registration form
                          _driver == Bool.yes && _vehical == Bool.yes
                              ? Column(
                                  children: [
                                    CustomTextFormField(
                                      title: "Driver First Name",
                                      isRequired: true,
                                      hint: "Your First Name",
                                      validator: (input) =>
                                          Validator.notNullValidator(input),
                                      controller: driverFirstName,
                                    ),
                                    CustomTextFormField(
                                      title: "Middle Name",
                                      isRequired: false,
                                      hint: "Your Middle Name",
                                      controller: driverMiddleName,
                                    ),
                                    CustomTextFormField(
                                      title: "Last Name",
                                      isRequired: true,
                                      hint: "Your Last Name",
                                      validator: (input) =>
                                          Validator.notNullValidator(input),
                                      controller: driverLastName,
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                          textAlign: TextAlign.start,
                                          text: const TextSpan(children: [
                                            TextSpan(
                                              text: "Gender",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "Roboto",
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xFF323232)),
                                            ),
                                            TextSpan(
                                              text: "*",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFFF0000)),
                                            ),
                                          ]),
                                        ),
                                        Radio(
                                            value: Gender.male,
                                            groupValue: _driverGender,
                                            onChanged: (Gender? value) {
                                              setState(() {
                                                _driverGender = value;
                                              });
                                            }),
                                        const Text(
                                          "Male",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF323232)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Radio(
                                            value: Gender.female,
                                            groupValue: _driverGender,
                                            onChanged: (Gender? value) {
                                              setState(() {
                                                _driverGender = value;
                                              });
                                            }),
                                        const Text(
                                          "Female",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF323232)),
                                        )
                                      ],
                                    ),
                                    CustomDateFormField(
                                      title: "Date of Birth",
                                      isRequired: true,
                                      hint: "DD/MM/YYYY",
                                      controller: driverDOBCtrl,
                                      suffix_icon: const Icon(
                                          Icons.calendar_today_outlined,
                                          color: Color(0xFF8D4600),
                                          weight: 1),
                                      validator: (input) =>
                                          Validator.notNullValidator(input),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                          textAlign: TextAlign.start,
                                          text: const TextSpan(children: [
                                            TextSpan(
                                              text: "Awas for Driver",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "Roboto",
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xFF323232)),
                                            ),
                                            TextSpan(
                                              text: "*",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFFF0000)),
                                            ),
                                          ]),
                                        ),
                                        Radio(
                                            value: Bool.yes,
                                            groupValue: _awasDriver,
                                            onChanged: (Bool? value) {
                                              setState(() {
                                                _awasDriver = value;
                                              });
                                            }),
                                        const Text(
                                          "Yes",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF323232)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Radio(
                                            value: Bool.no,
                                            groupValue: _awasDriver,
                                            onChanged: (Bool? value) {
                                              setState(() {
                                                _awasDriver = value;
                                              });
                                            }),
                                        const Text(
                                          "No",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF323232)),
                                        ),
                                      ],
                                    ),
                                    CustomTextFormField(
                                      title: "Mobile Number",
                                      isRequired: true,
                                      hint: "Enter Mobile Number",
                                      validator: (input) =>
                                          Validator.phoneNumberValidator(input),
                                      maxLength: 10,
                                      inputType: TextInputType.number,
                                      controller: driverMobileNumber,
                                    ),
                                    CustomImageFormField(
                                        title: "Upload Driver Photo",
                                        initValue: widget.model.driverPhoto,
                                        onChanged: (path) {
                                          widget.model.driverPhoto = path;
                                          setState(() {});
                                        }),
                                  ],
                                )
                              : Container(),
                        ],
                      )
                    : Container(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    maximumSize: const Size.fromHeight(80)),
                onPressed: () async {
                  if ((vehicalFormKey.currentState!.validate())) {
                    widget.model.isVehicle =
                        _vehical == Bool.yes ? true : false;
                    widget.model.isDriver = _driver == Bool.yes ? true : false;
                    widget.model.vehicleNumber = vehicalNumberCtrl.text;
                    widget.model.driverMobile = driverMobileNumber.text;
                    widget.model.driverFirstName = driverLastName.text;
                    widget.model.driverMiddleName = driverMiddleName.text;
                    widget.model.driverLastName = driverLastName.text;
                    widget.model.driverGender =
                        _driverGender == Gender.male ? "male" : "female";
                    widget.model.driverBirthDate = driverDOBCtrl.text == ""
                        ? null
                        : DateFormat("yyyy-MM-dd").format(
                            DateFormat("dd-MM-yyyy").parse(driverDOBCtrl.text));
                    widget.model.awasForDriver =
                        _awasDriver == Bool.yes ? true : false;

                    // resetting vehical and driver info if they are not selected
                    if (_vehical == Bool.no) {
                      widget.model.vehicleNumber = null;
                      widget.model.isDriver = false;
                      _driver = Bool.no;
                    }
                    if (_driver == Bool.no) {
                      widget.model.driverMobile = null;
                      widget.model.driverFirstName = null;
                      widget.model.driverMiddleName = null;
                      widget.model.driverLastName = null;
                      widget.model.driverGender = null;
                      widget.model.driverBirthDate = null;
                      widget.model.awasForDriver = null;
                    }
                    //TODO: Implement responses if api fails to response
                    if (widget.model.driverPhoto != null ||
                        _driver == Bool.no) {
                      widget.onPressed!();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please Upload Image To Continue!")));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
                      content:
                          Text("Fill All Mandatory Fields with Valid Input!"),
                    )));
                    scrollCtrl.animateTo(scrollCtrl.initialScrollOffset,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linearToEaseOut);
                  }
                },
                child: SizedBox(
                  width: width,
                  height: width * 0.1,
                  child: const Center(
                    child: Text(
                      "SAVE & NEXT",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showUserRegistrationStatusMsg(bool status) {
    if (status) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User Registered successfully")));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => BottomBarScreen(selected: 0),
          ),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User Registration Failed!")));
    }
  }
}
