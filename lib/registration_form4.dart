import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pratishtha_mahotsav/home_and_profile/btm_bar.dart';
import 'customwidgets/back_pressed_dialog.dart';
import 'customwidgets/custom_text_form_dropdown.dart';
import 'customwidgets/custom_text_form_field.dart';
import 'customwidgets/custom_text_form_label.dart';

import 'models/StatesModel.dart';
import 'models/countries_model.dart';
import 'models/food_preference_model.dart';
import 'models/professions_model.dart';
import 'models/user_registration_model.dart';
import 'api/api_helper.dart';
import 'customwidgets/custom_date_form_field.dart';
import 'customwidgets/custom_image_form_field.dart';
import 'form_validator.dart';

class RegisterForm4 extends StatefulWidget {
  const RegisterForm4(
      {Key? key,
      this.onPressed,
      required this.model,
      required this.countries,
      required this.states,
      required this.foodPreferences,
      required this.setLoadingOverLayVisibility,
      required this.professions})
      : super(key: key);
  final VoidCallback? onPressed;
  final ValueChanged<bool> setLoadingOverLayVisibility;
  final UserRegistrationModel model;
  final Map<String, dynamic> professions;
  final Map<String, dynamic> countries;
  final Map<String, dynamic> states;

  final Map<String, dynamic> foodPreferences;
  @override
  State<RegisterForm4> createState() => _RegisterForm4State();
}

enum Gender { male, female }

enum Bool { yes, no }

enum AwasType { dharamshala, star3, star4 }

enum TransportType { train, road, self, flight }

int expandedIndex = -1;

class _RegisterForm4State extends State<RegisterForm4> {
  ScrollController scrollCtrl = ScrollController();
  CountriesModel? countries;
  StatesModel? states;
  FoodPreferenceModel? foodPreferences;
  bool isIndiaSelected = false;

  int? foodId;
  Bool? _needAwas = Bool.yes;
  AwasType? _awasType = AwasType.dharamshala;
  TransportType? _transportType = TransportType.train;

  final GlobalKey<FormState> vehicalFormKey = GlobalKey<FormState>();
  Gender? _memberGender = Gender.male;
  Bool? _isDoctor = Bool.no;
  Bool? _awas = Bool.yes;
  Bool? _additionalMember = Bool.yes;
  bool sameAsPrimary = false;

  ProfessionsModel? professions;
  int? professionId;
  int? countryId;
  int? stateId;
  String? memberImage;

  TextEditingController memberMobileCtrl = TextEditingController();
  TextEditingController memberEmailCtrl = TextEditingController();
  TextEditingController memberFNameCtrl = TextEditingController();
  TextEditingController memberMNameCtrl = TextEditingController();
  TextEditingController memberLNameCtrl = TextEditingController();
  final TextEditingController emergencyContactCtrl = TextEditingController();
  TextEditingController memberAddressCtrl = TextEditingController();
  TextEditingController memberPinCodeCtrl = TextEditingController();
  TextEditingController memberCityCtrl = TextEditingController();
  TextEditingController memberMandalCtrl = TextEditingController();
  TextEditingController memberRemarkCtrl = TextEditingController();
  TextEditingController memberDOBCtrl = TextEditingController();
  TextEditingController memberAgeCtrl = TextEditingController();
  TextEditingController memberFromDateCtrl = TextEditingController();
  TextEditingController memberTillDateCtrl = TextEditingController();
  final GlobalKey<FormState> form2Keys = GlobalKey<FormState>();
  int? editId;
  bool inEditMode = false;
  bool memberFormVisible = false;
  bool isDataLoaded = true;
  @override
  void initState() {
    expandedIndex = -1;
    professions = ProfessionsModel.fromJson(widget.professions);
    countries = CountriesModel.fromJson(widget.countries);
    states = StatesModel.fromJson(widget.states);
    foodPreferences = FoodPreferenceModel.fromJson(widget.foodPreferences);
    widget.model.membersInfo = widget.model.membersInfo ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        leading: InkWell(
            onTap: () async {
              if (await BackPressedDialog(
                  "Do You Want To Leave Registration Form?", context)) {
                Navigator.pop(context);
              }
            },
            child: SvgPicture.asset("assets/icons/back_arrow.svg")),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const Text("User Registration",
            style: TextStyle(
                fontSize: 19,
                fontFamily: "Droid-Bold",
                fontWeight: FontWeight.bold,
                color: Color(0xFF9E4F01))),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/half_madala_mask.png"),
                    fit: BoxFit.fill)),
            width: double.maxFinite,
            height: height * 0.1,
          ),
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(top: 16),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.vertical(
                      top: Radius.circular(20))),
              child: SingleChildScrollView(
                controller: scrollCtrl,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.start,
                            text: const TextSpan(children: [
                              TextSpan(
                                text:
                                    "Do you want to register for Additional Member? ",
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
                          Row(
                            children: [
                              Radio(
                                  value: Bool.yes,
                                  groupValue: _additionalMember,
                                  onChanged: (Bool? value) {
                                    setState(() {
                                      _additionalMember = value;
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
                                  groupValue: _additionalMember,
                                  onChanged: (Bool? value) {
                                    setState(() {
                                      _additionalMember = value;
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
                          )
                        ],
                      ),
                    ),
                    _additionalMember == Bool.yes
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, bottom: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Member Information",
                                      style: TextStyle(
                                          fontFamily: "Roboto-M",
                                          color: Color(0xFF323232),
                                          fontSize: 16),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        expandedIndex = -1;
                                        inEditMode = false;
                                        memberFormVisible = true;
                                        form2Keys.currentState?.reset();
                                        memberMobileCtrl.clear();
                                        memberFNameCtrl.clear();
                                        memberMNameCtrl.clear();
                                        memberLNameCtrl.clear();
                                        _memberGender = Gender.male;
                                        memberDOBCtrl.clear();
                                        memberAgeCtrl.clear();
                                        professionId = null;
                                        _isDoctor = Bool.no;
                                        memberEmailCtrl.clear();
                                        emergencyContactCtrl.clear();
                                        memberPinCodeCtrl.clear();
                                        countryId = null;
                                        stateId = null;
                                        memberCityCtrl.clear();
                                        memberAddressCtrl.clear();
                                        memberMandalCtrl.clear();
                                        memberRemarkCtrl.clear();

                                        _awas = Bool.yes;
                                        memberFromDateCtrl.clear();
                                        memberTillDateCtrl.clear();
                                        _awasType = AwasType.dharamshala;
                                        _transportType = TransportType.train;
                                        foodId = null;
                                        memberImage = null;

                                        setState(() {});
                                      },
                                      style: ElevatedButton.styleFrom(),
                                      child: const Text("Add Member"),
                                    )
                                  ],
                                ),
                              ),
                              ListView.separated(
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      color: expandedIndex == index
                                          ? const Color(0xFF8D4600)
                                          : const Color(0xFFFFE9B8),
                                      child: ListTile(
                                        title: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "${widget.model.membersInfo![index].memberFirstName} ${widget.model.membersInfo![index].memberMiddleName} ${widget.model.membersInfo![index].memberLastName}",
                                                style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 16,
                                                  color: expandedIndex == index
                                                      ? const Color(0xFFFFFFFF)
                                                      : const Color(0xFF323232),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "( Member ${index + 1} )",
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 10,
                                                color: expandedIndex == index
                                                    ? const Color(0xFFFFFFFF)
                                                    : const Color(0xFF9E4F01),
                                              ),
                                            )
                                          ],
                                        ),
                                        textColor: const Color(0xFFFFFFFF),
                                        iconColor: const Color(0xFFFFFFFF),
                                        trailing: InkWell(
                                          onTap: () {
                                            form2Keys.currentState?.reset();
                                            if (expandedIndex == -1 ||
                                                expandedIndex != index) {
                                              expandedIndex = index;
                                              inEditMode = true;
                                              editId = index;
                                              memberFormVisible = true;
                                              memberMobileCtrl.text = widget
                                                      .model
                                                      .membersInfo![index]
                                                      .memberMobile ??
                                                  "";
                                              memberFNameCtrl.text = widget
                                                      .model
                                                      .membersInfo![index]
                                                      .memberFirstName ??
                                                  "";
                                              memberMNameCtrl.text = widget
                                                      .model
                                                      .membersInfo![index]
                                                      .memberMiddleName ??
                                                  "";
                                              memberLNameCtrl.text = widget
                                                      .model
                                                      .membersInfo![index]
                                                      .memberLastName ??
                                                  "";
                                              _memberGender = widget
                                                          .model
                                                          .membersInfo![index]
                                                          .memberGender ==
                                                      "Female"
                                                  ? Gender.female
                                                  : Gender.male;
                                              memberDOBCtrl.text = widget
                                                          .model
                                                          .membersInfo![index]
                                                          .memberBirthDate ==
                                                      null
                                                  ? ""
                                                  : DateFormat("dd-MM-yyyy")
                                                      .format(DateTime.parse(
                                                          widget
                                                              .model
                                                              .membersInfo![
                                                                  index]
                                                              .memberBirthDate!));
                                              memberAgeCtrl.text = widget
                                                          .model
                                                          .membersInfo![index]
                                                          .memberAge ==
                                                      null
                                                  ? ""
                                                  : widget
                                                      .model
                                                      .membersInfo![index]
                                                      .memberAge
                                                      .toString();
                                              professionId = widget
                                                          .model
                                                          .membersInfo![index]
                                                          .memberProfessionId ==
                                                      null
                                                  ? null
                                                  : int.parse(widget
                                                      .model
                                                      .membersInfo![index]
                                                      .memberProfessionId!);
                                              _isDoctor = widget
                                                          .model
                                                          .membersInfo![index]
                                                          .memberIsDoctor ==
                                                      false
                                                  ? Bool.no
                                                  : Bool.yes;
                                              memberEmailCtrl.text = widget
                                                      .model
                                                      .membersInfo![index]
                                                      .memberEmail ??
                                                  "";
                                              emergencyContactCtrl.text = widget
                                                      .model
                                                      .membersInfo![index]
                                                      .memberEmergencyContact ??
                                                  "";
                                              memberPinCodeCtrl.text = widget
                                                      .model
                                                      .membersInfo![index]
                                                      .memberPinCode ??
                                                  "";
                                              countryId = widget
                                                  .model
                                                  .membersInfo![index]
                                                  .memberCountryId;
                                              setState(() {
                                                isIndiaSelected = countryId ==
                                                    countries?.rows
                                                        ?.firstWhere((element) =>
                                                            element.countryName
                                                                ?.trim()
                                                                .toLowerCase() ==
                                                            "india")
                                                        .countryId;
                                              });
                                              stateId = widget
                                                  .model
                                                  .membersInfo![index]
                                                  .memberStateId;
                                              memberCityCtrl.text = widget
                                                      .model
                                                      .membersInfo![index]
                                                      .memberCityName ??
                                                  "";
                                              memberAddressCtrl.text = widget
                                                      .model
                                                      .membersInfo![index]
                                                      .memberAddress ??
                                                  "";
                                              memberMandalCtrl.text = widget
                                                      .model
                                                      .membersInfo![index]
                                                      .memberMandal ??
                                                  "";
                                              memberRemarkCtrl.text = widget
                                                      .model
                                                      .membersInfo![index]
                                                      .remark ??
                                                  "";
                                              _awas = widget
                                                          .model
                                                          .membersInfo![index]
                                                          .awasForMember ==
                                                      false
                                                  ? Bool.no
                                                  : Bool.yes;
                                              memberFromDateCtrl.text = widget
                                                          .model
                                                          .membersInfo![index]
                                                          .visitingDateFrom ==
                                                      null
                                                  ? ""
                                                  : DateFormat("dd-MM-yyyy")
                                                      .format(DateFormat(
                                                              "yyyy-MM-dd")
                                                          .parse(widget
                                                              .model
                                                              .membersInfo![
                                                                  index]
                                                              .visitingDateFrom!));
                                              memberTillDateCtrl.text = widget
                                                          .model
                                                          .membersInfo![index]
                                                          .visitingDateTo ==
                                                      null
                                                  ? ""
                                                  : DateFormat("dd-MM-yyyy")
                                                      .format(DateFormat(
                                                              "yyyy-MM-dd")
                                                          .parse(widget
                                                              .model
                                                              .membersInfo![
                                                                  index]
                                                              .visitingDateTo!));
                                              _awasType = widget
                                                          .model
                                                          .membersInfo![index]
                                                          .awasType ==
                                                      "Dharamshala"
                                                  ? AwasType.dharamshala
                                                  : widget
                                                              .model
                                                              .membersInfo![
                                                                  index]
                                                              .awasType ==
                                                          "3 Star"
                                                      ? AwasType.star3
                                                      : AwasType.star4;
                                              _transportType = widget
                                                          .model
                                                          .membersInfo![index]
                                                          .transportMode ==
                                                      "By Rail"
                                                  ? TransportType.train
                                                  : widget
                                                              .model
                                                              .membersInfo![
                                                                  index]
                                                              .transportMode ==
                                                          "By Road"
                                                      ? TransportType.road
                                                      : widget
                                                                  .model
                                                                  .membersInfo![
                                                                      index]
                                                                  .transportMode ==
                                                              "Self Drive"
                                                          ? TransportType.self
                                                          : TransportType
                                                              .flight;
                                              foodId = widget
                                                  .model
                                                  .membersInfo![index]
                                                  .foodPreferenceId;
                                              memberImage = widget
                                                  .model
                                                  .membersInfo![index]
                                                  .memberImage;
                                              print(widget
                                                  .model
                                                  .membersInfo![index]
                                                  .memberFirstName);
                                              setState(() {});
                                            } else {
                                              expandedIndex = -1;
                                              memberFormVisible = false;
                                            }
                                            setState(() {});
                                          },
                                          child: Icon(
                                            expandedIndex == index
                                                ? Icons.close
                                                : Icons.edit_outlined,
                                            color: expandedIndex == index
                                                ? const Color(0xFFFFFFFF)
                                                : const Color(0xFF848484),
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemCount: widget.model.membersInfo!.length),
                              memberFormVisible
                                  ? Form(
                                      key: form2Keys,
                                      child: Container(
                                        color: const Color(0xFFF5F5F5),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16.0,
                                              right: 16,
                                              bottom: 16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomTextFormField(
                                                title: "Mobile Number",
                                                isRequired: true,
                                                hint: "Enter Mobile Number",
                                                validator: (input) => Validator
                                                    .phoneNumberValidator(
                                                        input),
                                                inputType: TextInputType.number,
                                                maxLength: 10,
                                                controller: memberMobileCtrl,
                                              ),
                                              CustomTextFormField(
                                                title: "First Name",
                                                isRequired: true,
                                                hint: "Your First Name",
                                                validator: (input) =>
                                                    Validator.notNullValidator(
                                                        input),
                                                controller: memberFNameCtrl,
                                              ),
                                              CustomTextFormField(
                                                title: "Middle Name",
                                                isRequired: true,
                                                hint: "Your Middle Name",
                                                validator: (input) =>
                                                    Validator.notNullValidator(
                                                        input),
                                                controller: memberMNameCtrl,
                                              ),
                                              CustomTextFormField(
                                                title: "Last Name",
                                                isRequired: true,
                                                hint: "Your Last Name",
                                                validator: (input) =>
                                                    Validator.notNullValidator(
                                                        input),
                                                controller: memberLNameCtrl,
                                              ),
                                              const SizedBox(
                                                height: 26,
                                              ),
                                              Row(
                                                children: [
                                                  RichText(
                                                    textAlign: TextAlign.start,
                                                    text: const TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: "Gender",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    "Roboto",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Color(
                                                                    0xFF323232)),
                                                          ),
                                                          TextSpan(
                                                            text: "*",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xFFFF0000)),
                                                          ),
                                                        ]),
                                                  ),
                                                  Radio(
                                                      value: Gender.male,
                                                      groupValue: _memberGender,
                                                      onChanged:
                                                          (Gender? value) {
                                                        setState(() {
                                                          _memberGender = value;
                                                        });
                                                      }),
                                                  const Text(
                                                    "Male",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "Roboto",
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xFF323232)),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Radio(
                                                      value: Gender.female,
                                                      groupValue: _memberGender,
                                                      onChanged:
                                                          (Gender? value) {
                                                        setState(() {
                                                          _memberGender = value;
                                                        });
                                                      }),
                                                  const Text(
                                                    "Female",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "Roboto",
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xFF323232)),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: CustomDateFormField(
                                                        title: "Date of Birth",
                                                        isRequired: true,
                                                        hint: "DD/MM/YYYY",
                                                        controller:
                                                            memberDOBCtrl,
                                                        suffix_icon: const Icon(
                                                            Icons
                                                                .calendar_today_outlined,
                                                            color: Color(
                                                                0xFF8D4600),
                                                            weight: 1),
                                                        validator: (input) =>
                                                            Validator
                                                                .notNullValidator(
                                                                    input)),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                    flex: 1,
                                                    child: CustomTextFormField(
                                                      title: "Age",
                                                      controller: memberAgeCtrl,
                                                      isRequired: false,
                                                      maxLength: 3,
                                                      inputType:
                                                          TextInputType.number,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              CustomTextFormDropDown(
                                                hint: "Select Profession",
                                                title: "Profession",
                                                isRequired: false,
                                                items: professions!.rows!
                                                    .map(
                                                      (e) =>
                                                          DropdownMenuItem<int>(
                                                        value: e.professionId,
                                                        child: Text(
                                                          e.title ?? "",
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: Color(
                                                                  0xFF323232),
                                                              fontFamily:
                                                                  "Roboto"),
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                                value: professionId,
                                                onChanged: (input) =>
                                                    professionId = input,
                                              ),
                                              const SizedBox(
                                                height: 18,
                                              ),
                                              Row(
                                                children: [
                                                  RichText(
                                                    textAlign: TextAlign.start,
                                                    text: const TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                "Are You Doctror? ",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    "Roboto",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Color(
                                                                    0xFF323232)),
                                                          ),
                                                          TextSpan(
                                                            text: "*",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    "Roboto",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Color(
                                                                    0xFFFF0000)),
                                                          ),
                                                        ]),
                                                  ),
                                                  Radio(
                                                      value: Bool.yes,
                                                      groupValue: _isDoctor,
                                                      onChanged: (Bool? value) {
                                                        setState(() {
                                                          _isDoctor = value;
                                                        });
                                                      }),
                                                  const Text(
                                                    "Yes",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "Roboto",
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xFF323232)),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Radio(
                                                      value: Bool.no,
                                                      groupValue: _isDoctor,
                                                      onChanged: (Bool? value) {
                                                        setState(() {
                                                          _isDoctor = value;
                                                        });
                                                      }),
                                                  const Text(
                                                    "No",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "Roboto",
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xFF323232)),
                                                  )
                                                ],
                                              ),
                                              CustomTextFormField(
                                                title: "Email ID",
                                                isRequired: false,
                                                inputType:
                                                    TextInputType.emailAddress,
                                                hint: "xyz@gmail.com",
                                                controller: memberEmailCtrl,
                                              ),
                                              CustomTextFormField(
                                                  title: "Emergency Contact",
                                                  isRequired: true,
                                                  hint:
                                                      "Select Mandal / Mandir",
                                                  validator: (input) =>
                                                      Validator
                                                          .phoneNumberValidator(
                                                              input),
                                                  inputType:
                                                      TextInputType.number,
                                                  maxLength: 10,
                                                  controller:
                                                      emergencyContactCtrl),
                                              const SizedBox(
                                                height: 18,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Checkbox(
                                                      fillColor: MaterialStateColor
                                                          .resolveWith((states) =>
                                                              const Color(
                                                                  0xFF8D4600)),
                                                      value: sameAsPrimary,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          sameAsPrimary =
                                                              value!;
                                                          if (value) {
                                                            memberPinCodeCtrl
                                                                .text = widget
                                                                    .model
                                                                    .pinCode ??
                                                                "";
                                                            countryId = widget
                                                                .model
                                                                .countryId;
                                                            if (widget.model
                                                                    .countryId ==
                                                                countries?.rows
                                                                    ?.firstWhere((element) =>
                                                                        element
                                                                            .countryName
                                                                            ?.toLowerCase() ==
                                                                        "india")
                                                                    .countryId) {
                                                              isIndiaSelected =
                                                                  true;
                                                              stateId = widget
                                                                  .model
                                                                  .stateId;
                                                              setState(() {});
                                                            } else {
                                                              isIndiaSelected =
                                                                  false;
                                                              stateId = null;
                                                              setState(() {});
                                                            }
                                                            memberCityCtrl
                                                                .text = widget
                                                                    .model
                                                                    .cityName ??
                                                                "";
                                                            memberAddressCtrl
                                                                .text = widget
                                                                    .model
                                                                    .address ??
                                                                "";
                                                            memberMandalCtrl
                                                                .text = widget
                                                                    .model
                                                                    .mandal ??
                                                                "";
                                                            memberRemarkCtrl
                                                                .text = widget
                                                                    .model
                                                                    .remarks ??
                                                                "";
                                                          }
                                                        });
                                                      }),
                                                  const Text(
                                                      "Same as Primary Member",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: "Roboto",
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Color(
                                                              0xFF323232))),
                                                ],
                                              ),
                                              CustomTextFormField(
                                                  title: "Pin Code",
                                                  isRequired: false,
                                                  hint: "Enter Pin Code",
                                                  maxLength: 6,
                                                  inputType:
                                                      TextInputType.number,
                                                  controller:
                                                      memberPinCodeCtrl),
                                              CustomTextFormDropDown(
                                                title: "Country",
                                                isRequired: true,
                                                items: countries!.rows!
                                                    .map(
                                                      (e) =>
                                                          DropdownMenuItem<int>(
                                                        value: e.countryId,
                                                        child: Text(
                                                          e.countryName ?? "",
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: Color(
                                                                  0xFF323232),
                                                              fontFamily:
                                                                  "Roboto"),
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                                hint: "Select Country",
                                                value: countryId,
                                                onChanged: (value) {
                                                  countryId = value;
                                                  isIndiaSelected = countryId ==
                                                      countries?.rows
                                                          ?.firstWhere((element) =>
                                                              element
                                                                  .countryName
                                                                  ?.trim()
                                                                  .toLowerCase() ==
                                                              "india")
                                                          .countryId;
                                                  if (isIndiaSelected) {
                                                    stateId = null;
                                                  }
                                                  setState(() {});
                                                },
                                                validator: (input) => Validator
                                                    .intNotNullValidator(input),
                                              ),
                                              isIndiaSelected
                                                  ? Column(
                                                      children: [
                                                        CustomTextFormDropDown(
                                                          title: "State",
                                                          isRequired: true,
                                                          items: states!.rows!
                                                              .map(
                                                                (e) =>
                                                                    DropdownMenuItem<
                                                                        int>(
                                                                  value:
                                                                      e.stateId,
                                                                  child: Text(
                                                                    e.stateName ??
                                                                        "",
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        color: Color(
                                                                            0xFF323232),
                                                                        fontFamily:
                                                                            "Roboto"),
                                                                  ),
                                                                ),
                                                              )
                                                              .toList(),
                                                          hint: "Select State",
                                                          value: stateId,
                                                          onChanged: (value) {
                                                            stateId = value;
                                                          },
                                                          validator: (input) =>
                                                              Validator
                                                                  .intNotNullValidator(
                                                                      input),
                                                        ),
                                                      ],
                                                    )
                                                  : Container(),
                                              CustomTextFormField(
                                                  title: "City",
                                                  isRequired: true,
                                                  hint: "Enter City Name",
                                                  max_line: 1,
                                                  validator: (input) =>
                                                      Validator
                                                          .notNullValidator(
                                                              input),
                                                  controller: memberCityCtrl),
                                              CustomTextFormField(
                                                  title: "Address",
                                                  isRequired: true,
                                                  max_line: 4,
                                                  validator: (input) =>
                                                      Validator
                                                          .notNullValidator(
                                                              input),
                                                  controller:
                                                      memberAddressCtrl),
                                              CustomTextFormField(
                                                title: "Mandal / Mandir",
                                                isRequired: false,
                                                controller: memberMandalCtrl,
                                              ),
                                              CustomTextFormField(
                                                controller: memberRemarkCtrl,
                                                title: "Remarks",
                                                isRequired: false,
                                                max_line: 3,
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 28.0),
                                                child: Text(
                                                  "Awas Details for Member",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Color(0xFF323232),
                                                      fontFamily: "Roboto-B"),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 18,
                                              ),
                                              Row(
                                                children: [
                                                  RichText(
                                                    textAlign: TextAlign.start,
                                                    text: const TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                "Awas Required ",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    "Roboto",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Color(
                                                                    0xFF323232)),
                                                          ),
                                                          TextSpan(
                                                            text: "*",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    "Roboto",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Color(
                                                                    0xFFFF0000)),
                                                          ),
                                                        ]),
                                                  ),
                                                  Radio(
                                                      value: Bool.yes,
                                                      groupValue: _needAwas,
                                                      onChanged: (Bool? value) {
                                                        setState(() {
                                                          _needAwas = value;
                                                        });
                                                      }),
                                                  const Text(
                                                    "Yes",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "Roboto",
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xFF323232)),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Radio(
                                                      value: Bool.no,
                                                      groupValue: _needAwas,
                                                      onChanged: (Bool? value) {
                                                        setState(() {
                                                          _needAwas = value;
                                                        });
                                                      }),
                                                  const Text(
                                                    "No",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "Roboto",
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xFF323232)),
                                                  )
                                                ],
                                              ),
                                              _needAwas == Bool.yes
                                                  ? Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomDateFormField(
                                                          title:
                                                              "Date of Arrival",
                                                          isRequired: false,
                                                          hint: "Check in date",
                                                          suffix_icon:
                                                              const Icon(
                                                            Icons
                                                                .calendar_today_outlined,
                                                            color: Color(
                                                                0xFF8D4600),
                                                            weight: 1,
                                                          ),
                                                          controller:
                                                              memberFromDateCtrl,
                                                        ),
                                                        CustomDateFormField(
                                                          title:
                                                              "Date of Departure",
                                                          isRequired: false,
                                                          hint:
                                                              "Date of Departure",
                                                          suffix_icon:
                                                              const Icon(
                                                            Icons
                                                                .calendar_today_outlined,
                                                            color: Color(
                                                                0xFF8D4600),
                                                            weight: 1,
                                                          ),
                                                          controller:
                                                              memberTillDateCtrl,
                                                        ),
                                                        const CustomTextFormFieldLabel(
                                                          isRequired: true,
                                                          title:
                                                              "Awas Type(The price listed below is per person per day) ",
                                                        ),
                                                        Row(
                                                          children: [
                                                            Radio(
                                                                value: AwasType
                                                                    .dharamshala,
                                                                groupValue:
                                                                    _awasType,
                                                                onChanged:
                                                                    (AwasType?
                                                                        value) {
                                                                  setState(() {
                                                                    _awasType =
                                                                        value;
                                                                  });
                                                                }),
                                                            const Text(
                                                              "Dharamshala - INR: ₹ 250/- (Refundable)",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      "Roboto",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Color(
                                                                      0xFF323232)),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Radio(
                                                                value: AwasType
                                                                    .star3,
                                                                groupValue:
                                                                    _awasType,
                                                                onChanged:
                                                                    (AwasType?
                                                                        value) {
                                                                  setState(() {
                                                                    _awasType =
                                                                        value;
                                                                  });
                                                                }),
                                                            const Text(
                                                              "3 Star - INR: ₹ 750/- (Non-Refundable)",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      "Roboto",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Color(
                                                                      0xFF323232)),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Radio(
                                                                value: AwasType
                                                                    .star4,
                                                                groupValue:
                                                                    _awasType,
                                                                onChanged:
                                                                    (AwasType?
                                                                        value) {
                                                                  setState(() {
                                                                    _awasType =
                                                                        value;
                                                                  });
                                                                }),
                                                            const Text(
                                                              "4 Star - INR: ₹ 1500/- (Non-Refundable)",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      "Roboto",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Color(
                                                                      0xFF323232)),
                                                            ),
                                                          ],
                                                        ),
                                                        const CustomTextFormFieldLabel(
                                                            title:
                                                                "Mode of Transport",
                                                            isRequired: true),
                                                        Row(
                                                          children: [
                                                            Radio(
                                                                value:
                                                                    TransportType
                                                                        .train,
                                                                groupValue:
                                                                    _transportType,
                                                                onChanged:
                                                                    (TransportType?
                                                                        value) {
                                                                  setState(() {
                                                                    _transportType =
                                                                        value;
                                                                  });
                                                                }),
                                                            const Text(
                                                              "By Rail",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      "Roboto",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Color(
                                                                      0xFF323232)),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Radio(
                                                                value:
                                                                    TransportType
                                                                        .road,
                                                                groupValue:
                                                                    _transportType,
                                                                onChanged:
                                                                    (TransportType?
                                                                        value) {
                                                                  setState(() {
                                                                    _transportType =
                                                                        value;
                                                                  });
                                                                }),
                                                            const Text(
                                                              "By Road",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      "Roboto",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Color(
                                                                      0xFF323232)),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Radio(
                                                                value:
                                                                    TransportType
                                                                        .self,
                                                                groupValue:
                                                                    _transportType,
                                                                onChanged:
                                                                    (TransportType?
                                                                        value) {
                                                                  setState(() {
                                                                    _transportType =
                                                                        value;
                                                                  });
                                                                }),
                                                            const Text(
                                                              "Self Drive",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      "Roboto",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Color(
                                                                      0xFF323232)),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Radio(
                                                                value:
                                                                    TransportType
                                                                        .flight,
                                                                groupValue:
                                                                    _transportType,
                                                                onChanged:
                                                                    (TransportType?
                                                                        value) {
                                                                  setState(() {
                                                                    _transportType =
                                                                        value;
                                                                  });
                                                                }),
                                                            const Text(
                                                              "By Flight",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      "Roboto",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Color(
                                                                      0xFF323232)),
                                                            ),
                                                          ],
                                                        ),
                                                        CustomTextFormDropDown(
                                                          title:
                                                              "Food Preference",
                                                          isRequired: true,
                                                          value: foodId,
                                                          items:
                                                              foodPreferences!
                                                                  .rows!
                                                                  .map(
                                                                    (e) =>
                                                                        DropdownMenuItem<
                                                                            int>(
                                                                      value: e
                                                                          .foodPreferenceId,
                                                                      child:
                                                                          Text(
                                                                        e.title ??
                                                                            "",
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            color: Color(0xFF323232),
                                                                            fontFamily: "Roboto"),
                                                                      ),
                                                                    ),
                                                                  )
                                                                  .toList(),
                                                          hint: "Select Food",
                                                          validator: (input) =>
                                                              Validator
                                                                  .intNotNullValidator(
                                                                      input),
                                                          onChanged: (value) =>
                                                              foodId = value,
                                                        ),
                                                      ],
                                                    )
                                                  : const SizedBox(),
                                              CustomImageFormField(
                                                  title: "Upload Your Photo",
                                                  initValue: memberImage,
                                                  onChanged: (path) {
                                                    setState(() {
                                                      memberImage = path;
                                                    });
                                                  }),
                                              const SizedBox(
                                                height: 26,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      if (inEditMode) {
                                                        if (await BackPressedDialog(
                                                            "Are You Sure You Want to Remove Member ${widget.model.membersInfo![editId!].memberFirstName} ${widget.model.membersInfo![editId!].memberMiddleName} ${widget.model.membersInfo![editId!].memberLastName} ?",
                                                            context)) {
                                                          memberFormVisible =
                                                              false;
                                                          widget
                                                              .model.membersInfo
                                                              ?.removeAt(
                                                                  editId!);
                                                          expandedIndex = -1;
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  const SnackBar(
                                                                      content: Text(
                                                                          "Member Removed!")));
                                                          scrollCtrl.animateTo(
                                                              scrollCtrl
                                                                  .initialScrollOffset,
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          300),
                                                              curve: Curves
                                                                  .linearToEaseOut);
                                                          expandedIndex = -1;
                                                        }
                                                      } else {
                                                        memberFormVisible =
                                                            false;
                                                        scrollCtrl.animateTo(
                                                            scrollCtrl
                                                                .initialScrollOffset,
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        300),
                                                            curve: Curves
                                                                .linearToEaseOut);
                                                        expandedIndex = -1;
                                                      }
                                                      setState(() {});
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      maximumSize:
                                                          const Size.fromHeight(
                                                              80),
                                                      backgroundColor:
                                                          const Color(
                                                              0xFFBBBBBB),
                                                      foregroundColor:
                                                          const Color(
                                                              0xFF646464),
                                                    ),
                                                    child: SizedBox(
                                                        width: width * 0.32,
                                                        height: width * 0.1,
                                                        child: Center(
                                                          child: Text(
                                                            inEditMode
                                                                ? "REMOVE"
                                                                : "Close",
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        16),
                                                          ),
                                                        )),
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            maximumSize: const Size
                                                                    .fromHeight(
                                                                80)),
                                                    onPressed: () {
                                                      String? transportMode = _transportType ==
                                                              TransportType.road
                                                          ? "By Road"
                                                          : _transportType ==
                                                                  TransportType
                                                                      .self
                                                              ? "Self Drive"
                                                              : _transportType ==
                                                                      TransportType
                                                                          .flight
                                                                  ? "By Flight"
                                                                  : _transportType ==
                                                                          TransportType
                                                                              .train
                                                                      ? "By Rail"
                                                                      : null;
                                                      if (form2Keys
                                                          .currentState!
                                                          .validate()) {
                                                        if (memberImage !=
                                                            null) {
                                                          if (_needAwas ==
                                                              Bool.no) {
                                                            memberFromDateCtrl
                                                                .text = "";
                                                            memberTillDateCtrl
                                                                .text = "";
                                                            _awasType = null;
                                                            _transportType =
                                                                null;
                                                          }
                                                          if (inEditMode) {
                                                            widget.model.membersInfo![
                                                                    editId!] =
                                                                MembersInfo(
                                                              memberMobile:
                                                                  memberMobileCtrl
                                                                      .text,
                                                              memberFirstName:
                                                                  memberFNameCtrl
                                                                      .text,
                                                              memberMiddleName:
                                                                  memberMNameCtrl
                                                                      .text,
                                                              memberLastName:
                                                                  memberLNameCtrl
                                                                      .text,
                                                              memberGender:
                                                                  _memberGender ==
                                                                          Gender
                                                                              .male
                                                                      ? "Male"
                                                                      : "Female",
                                                              memberBirthDate: memberDOBCtrl
                                                                          .text ==
                                                                      ""
                                                                  ? null
                                                                  : DateFormat(
                                                                          "yyyy-MM-dd")
                                                                      .format(DateFormat(
                                                                              "dd-MM-yyyy")
                                                                          .parse(
                                                                              memberDOBCtrl.text)),
                                                              memberAge: memberAgeCtrl
                                                                          .text ==
                                                                      ""
                                                                  ? null
                                                                  : int.parse(
                                                                      memberAgeCtrl
                                                                          .text),
                                                              memberProfessionId:
                                                                  professionId ==
                                                                          null
                                                                      ? null
                                                                      : professionId
                                                                          .toString(),
                                                              memberIsDoctor:
                                                                  _isDoctor ==
                                                                          Bool.yes
                                                                      ? true
                                                                      : false,
                                                              memberEmail:
                                                                  memberEmailCtrl
                                                                      .text,
                                                              memberEmergencyContact:
                                                                  emergencyContactCtrl
                                                                      .text,
                                                              memberPinCode:
                                                                  memberPinCodeCtrl
                                                                      .text,
                                                              memberCountryId:
                                                                  countryId,
                                                              memberStateId:
                                                                  isIndiaSelected
                                                                      ? stateId
                                                                      : null,
                                                              memberCityName:
                                                                  memberCityCtrl
                                                                      .text,
                                                              memberAddress:
                                                                  memberAddressCtrl
                                                                      .text,
                                                              memberMandal:
                                                                  memberMandalCtrl
                                                                      .text,
                                                              remark:
                                                                  memberRemarkCtrl
                                                                      .text,
                                                              awasForMember:
                                                                  _awas ==
                                                                          Bool.yes
                                                                      ? true
                                                                      : false,
                                                              visitingDateFrom: memberFromDateCtrl
                                                                          .text ==
                                                                      ""
                                                                  ? null
                                                                  : DateFormat(
                                                                          "yyyy-MM-dd")
                                                                      .format(DateFormat(
                                                                              "dd-MM-yyyy")
                                                                          .parse(
                                                                              memberFromDateCtrl.text)),
                                                              visitingDateTo: memberTillDateCtrl
                                                                          .text ==
                                                                      ""
                                                                  ? null
                                                                  : DateFormat(
                                                                          "yyyy-MM-dd")
                                                                      .format(DateFormat(
                                                                              "dd-MM-yyyy")
                                                                          .parse(
                                                                              memberTillDateCtrl.text)),
                                                              awasType: _awasType ==
                                                                      AwasType
                                                                          .dharamshala
                                                                  ? "Dharamshala"
                                                                  : _awasType ==
                                                                          AwasType
                                                                              .star3
                                                                      ? "3 Star"
                                                                      : _awasType ==
                                                                              AwasType.star4
                                                                          ? "4 Star"
                                                                          : null,
                                                              transportMode:
                                                                  transportMode,
                                                              foodPreferenceId:
                                                                  foodId,
                                                              memberImage:
                                                                  memberImage,
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    const SnackBar(
                                                                        content:
                                                                            Text("Member Updated Successfully")));
                                                            inEditMode = false;
                                                            memberFormVisible =
                                                                false;
                                                            setState(() {});
                                                          } else {
                                                            widget.model
                                                                .membersInfo
                                                                ?.add(
                                                                    MembersInfo(
                                                              memberMobile:
                                                                  memberMobileCtrl
                                                                      .text,
                                                              memberFirstName:
                                                                  memberFNameCtrl
                                                                      .text,
                                                              memberMiddleName:
                                                                  memberMNameCtrl
                                                                      .text,
                                                              memberLastName:
                                                                  memberLNameCtrl
                                                                      .text,
                                                              memberGender:
                                                                  _memberGender ==
                                                                          Gender
                                                                              .male
                                                                      ? "Male"
                                                                      : "Female",
                                                              memberBirthDate: memberDOBCtrl
                                                                          .text ==
                                                                      ""
                                                                  ? null
                                                                  : DateFormat(
                                                                          "yyyy-MM-dd")
                                                                      .format(DateFormat(
                                                                              "dd-MM-yyyy")
                                                                          .parse(
                                                                              memberDOBCtrl.text)),
                                                              memberAge: memberAgeCtrl
                                                                          .text ==
                                                                      ""
                                                                  ? null
                                                                  : int.parse(
                                                                      memberAgeCtrl
                                                                          .text),
                                                              memberProfessionId:
                                                                  professionId ==
                                                                          null
                                                                      ? null
                                                                      : professionId
                                                                          .toString(),
                                                              memberIsDoctor:
                                                                  _isDoctor ==
                                                                          Bool.yes
                                                                      ? true
                                                                      : false,
                                                              memberEmail:
                                                                  memberEmailCtrl
                                                                      .text,
                                                              memberEmergencyContact:
                                                                  emergencyContactCtrl
                                                                      .text,
                                                              memberPinCode:
                                                                  memberPinCodeCtrl
                                                                      .text,
                                                              memberCountryId:
                                                                  countryId,
                                                              memberStateId:
                                                                  isIndiaSelected
                                                                      ? stateId
                                                                      : null,
                                                              memberCityName:
                                                                  memberCityCtrl
                                                                      .text,
                                                              memberAddress:
                                                                  memberAddressCtrl
                                                                      .text,
                                                              memberMandal:
                                                                  memberMandalCtrl
                                                                      .text,
                                                              remark:
                                                                  memberRemarkCtrl
                                                                      .text,
                                                              awasForMember:
                                                                  _awas ==
                                                                          Bool.yes
                                                                      ? true
                                                                      : false,
                                                              visitingDateFrom: memberFromDateCtrl
                                                                          .text ==
                                                                      ""
                                                                  ? null
                                                                  : DateFormat(
                                                                          "yyyy-MM-dd")
                                                                      .format(DateFormat(
                                                                              "dd-MM-yyyy")
                                                                          .parse(
                                                                              memberFromDateCtrl.text)),
                                                              visitingDateTo: memberTillDateCtrl
                                                                          .text ==
                                                                      ""
                                                                  ? null
                                                                  : DateFormat(
                                                                          "yyyy-MM-dd")
                                                                      .format(DateFormat(
                                                                              "dd-MM-yyyy")
                                                                          .parse(
                                                                              memberTillDateCtrl.text)),
                                                              awasType: _awasType ==
                                                                      AwasType
                                                                          .dharamshala
                                                                  ? "Dharamshala"
                                                                  : _awasType ==
                                                                          AwasType
                                                                              .star3
                                                                      ? "3 Star"
                                                                      : _awasType ==
                                                                              AwasType.star4
                                                                          ? "4 Star"
                                                                          : "",
                                                              transportMode:
                                                                  transportMode,
                                                              foodPreferenceId:
                                                                  foodId,
                                                              memberImage:
                                                                  memberImage,
                                                            ));
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              const SnackBar(
                                                                content: Text(
                                                                    "Member Added Successfully"),
                                                              ),
                                                            );
                                                            memberFormVisible =
                                                                false;
                                                            setState(() {});
                                                          }
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  (const SnackBar(
                                                            content: Text(
                                                                "Upload Member Image to Add Member!"),
                                                          )));
                                                        }
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                (const SnackBar(
                                                          content: Text(
                                                              "Fill All Mandatory Fields with Valid Input!"),
                                                        )));
                                                      }
                                                      expandedIndex = -1;
                                                    },
                                                    child: SizedBox(
                                                      width: width * 0.32,
                                                      height: width * 0.1,
                                                      child: const Center(
                                                        child: Text(
                                                          "SAVE MEMBER",
                                                          style: TextStyle(
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          )
                        : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            maximumSize: const Size.fromHeight(80)),
                        onPressed: () async {
                          if (_additionalMember == Bool.no) {
                            widget.model.membersInfo?.clear();
                          }
                          UserRegistrationModel.storeModel(widget.model);
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: SingleChildScrollView(
                                    child: SelectableText(
                                  "${jsonEncode(widget.model.toJson())}",
                                  style: const TextStyle(fontSize: 18),
                                )),
                              );
                            },
                          );
                          ApiHelper.postUserRegistrationData(
                            model: widget.model,
                          ).then(
                              (value) => showUserRegistrationStatusMsg(value));
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
            ),
          ),
        ],
      ),
    );
  }

  void showUserRegistrationStatusMsg(bool status) {
    if (status) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User Registered successfully")));
      Navigator.of(context).pushAndRemoveUntil(
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
