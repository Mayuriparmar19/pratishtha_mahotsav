import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pratishtha_mahotsav/customwidgets/custom_text_form_label.dart';
import 'package:pratishtha_mahotsav/customwidgets/custom_time_form_field.dart';
import 'api/api_helper.dart';
import 'customwidgets/custom_image_form_field.dart';
import 'customwidgets/custom_text_form_dropdown.dart';
import 'customwidgets/custom_text_form_field.dart';
import 'form_validator.dart';
import 'models/DistrictsModel.dart';
import 'models/StatesModel.dart';
import 'models/countries_model.dart';
import 'models/user_registration_model.dart';
import 'customwidgets/custom_date_form_field.dart';
import 'models/professions_model.dart';

class RegisterForm1 extends StatefulWidget {
  const RegisterForm1(
      {Key? key,
      this.onPressed,
      required this.model,
      required this.professions,
      required this.countries,
      required this.states,
      required this.setLoadingOverLayVisiblity})
      : super(key: key);
  final VoidCallback? onPressed;
  final UserRegistrationModel model;
  final Map<String, dynamic> professions;
  final Map<String, dynamic> countries;
  final Map<String, dynamic> states;
  final ValueChanged<bool> setLoadingOverLayVisiblity;

  @override
  State<RegisterForm1> createState() => _RegisterForm1State();
}

enum Gender { male, female }

//TODO: initialize with model value in initState and store value in model in onSaved
//for isDoctor,arrivalDateCtrl,arrivalTimeCtrl,departureDateCtrl,departureTimeCtrl
enum Bool { yes, no }

class _RegisterForm1State extends State<RegisterForm1> {
  ScrollController scrollCtrl = ScrollController();
  ProfessionsModel? professions;
  final formKey = GlobalKey<FormState>();
  final TextEditingController mobileNumberCtrl = TextEditingController();
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController middleNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController dobCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();
  TextEditingController mandalMandirCtrl = TextEditingController();

  TextEditingController arrivalDateCtrl = TextEditingController();
  TextEditingController arrivalTimeCtrl = TextEditingController();
  TextEditingController departureDateCtrl = TextEditingController();
  TextEditingController departureTimeCtrl = TextEditingController();

  TextEditingController remarksCtrl = TextEditingController();

  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController emergencyContactCtrl = TextEditingController();
  final TextEditingController pinCodeCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController cityCtrl = TextEditingController();

  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();

  CountriesModel? countries;
  StatesModel? states;
  DistrictsModel? districts;
  bool isDataLoaded = true;
  bool isIndiaSelected = false;

  String? verifiedNumber;

  int? countryId;
  int? stateId;
  int? districtId;

  int? professionId;
  Gender? _gender = Gender.male;
  Bool? _isDoctor = Bool.no;
  @override
  void initState() {
    countries = CountriesModel.fromJson(widget.countries);
    states = StatesModel.fromJson(widget.states);
    setState(() {});
    mobileNumberCtrl.text = widget.model.mobile ?? "";
    verifiedNumber = widget.model.mobile == null ? null : widget.model.mobile;
    firstNameCtrl.text = widget.model.firstName ?? "";
    middleNameCtrl.text = widget.model.middleName ?? "";
    lastNameCtrl.text = widget.model.lastName ?? "";
    _gender = widget.model.gender == "Female" ? Gender.female : Gender.male;
    dobCtrl.text = widget.model.birthDate == null
        ? ""
        : DateFormat("dd-MM-yyyy")
            .format(DateFormat("yyyy-MM-dd").parse(widget.model.birthDate!));
    ageCtrl.text = widget.model.age == null ? "" : widget.model.age.toString();
    professions = ProfessionsModel.fromJson(widget.professions);
    professionId = widget.model.professionId;
    _isDoctor = widget.model.isDoctor == false ? Bool.yes : Bool.no;
    // _isBhramchari = widget.model.isBhramchari == true ? Bool.yes : Bool.no;
    emailCtrl.text = widget.model.email ?? "";
    emergencyContactCtrl.text = widget.model.emergencyContact ?? "";

    pinCodeCtrl.text = widget.model.pinCode ?? "";
    countryId = widget.model.countryId;
    cityCtrl.text = widget.model.cityName ?? "";
    if (countryId ==
        countries?.rows
            ?.firstWhere((element) =>
                element.countryName?.trim().toLowerCase() == "india")
            .countryId) {
      setState(() {
        isIndiaSelected = true;
      });
    }
    stateId = widget.model.stateId;
    if (stateId != null) {
      loadDistricts();
    }
    districtId = widget.model.districtId;
    addressCtrl.text = widget.model.address ?? "";

    mandalMandirCtrl.text = widget.model.mandal ?? "";
    arrivalDateCtrl.text = widget.model.arrivalDate == null
        ? ""
        : DateFormat("dd-MM-yyyy")
            .format(DateFormat("yyyy-MM-dd").parse(widget.model.arrivalDate!));
    arrivalTimeCtrl.text = widget.model.arrivalTime ?? "";
    departureDateCtrl.text = widget.model.departureDate == null
        ? ""
        : DateFormat("dd-MM-yyyy").format(
            DateFormat("yyyy-MM-dd").parse(widget.model.departureDate!));
    departureTimeCtrl.text = widget.model.departureTime ?? "";
    remarksCtrl.text = widget.model.remarks ?? "";

    // if (widget.model.otp != null) {
    //   _fieldOne.text = widget.model.otp![0];
    //   _fieldTwo.text = widget.model.otp![1];
    //   _fieldThree.text = widget.model.otp![2];
    //   _fieldFour.text = widget.model.otp![3];
    //   _fieldFive.text = widget.model.otp![4];
    //   _fieldSix.text = widget.model.otp![5];
    // } else {
    _fieldOne.text = '\u00A0';
    _fieldTwo.text = '\u00A0';
    _fieldThree.text = '\u00A0';
    _fieldFour.text = '\u00A0';
    _fieldFive.text = '\u00A0';
    _fieldSix.text = '\u00A0';
    // }
    _fieldOne.selection = TextSelection.collapsed(
      offset: _fieldOne.text.length,
    );
    _fieldTwo.selection = TextSelection.collapsed(
      offset: _fieldTwo.text.length,
    );
    _fieldThree.selection = TextSelection.collapsed(
      offset: _fieldThree.text.length,
    );
    _fieldFour.selection = TextSelection.collapsed(
      offset: _fieldFour.text.length,
    );
    _fieldFive.selection = TextSelection.collapsed(
      offset: _fieldFive.text.length,
    );
    _fieldSix.selection = TextSelection.collapsed(
      offset: _fieldSix.text.length,
    );
    super.initState();
  }

  Future<void> loadDistricts() async {
    widget.setLoadingOverLayVisiblity(true);
    setState(() {
      isDataLoaded = false;
    });
    String stateCode = states!.rows!
        .firstWhere((element) => element.stateId == stateId)
        .stateCode!;
    districts = DistrictsModel.fromJson(await ApiHelper.getApiData(
        "http://13.126.120.16/pratishtha/rest/apiv1/districts/?state_code=$stateCode",
        context));
    setState(() {
      isDataLoaded = true;
    });
    widget.setLoadingOverLayVisiblity(false);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(top: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        controller: scrollCtrl,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // write content of form here
                    const CustomTextFormFieldLabel(
                      title: "Mobile Number",
                      isRequired: true,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 16,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {});
                            },
                            controller: mobileNumberCtrl,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            validator: (input) =>
                                Validator.phoneNumberValidator(input),
                            decoration: InputDecoration(
                                counterText: "",
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/images/whatsapp_logo.png",
                                    fit: BoxFit.fill,
                                    height: 5,
                                    width: 5,
                                  ),
                                )),
                          ),
                        ),
                        verifiedNumber == mobileNumberCtrl.text
                            ? const SizedBox()
                            : const Flexible(flex: 1, child: SizedBox()),
                        verifiedNumber == mobileNumberCtrl.text
                            ? const SizedBox()
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 20),
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF8D4600),
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.normal),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      side: const BorderSide(
                                          color: Color(0xFF8D4600))),
                                ),
                                onPressed: () async {
                                  if (mobileNumberCtrl.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Please enter mobile number")));
                                    return;
                                  } else if (mobileNumberCtrl.text.length !=
                                          10 &&
                                      !RegExp(r'[0-9]')
                                          .hasMatch(mobileNumberCtrl.text)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Please enter valid mobile number")));
                                    return;
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Sending OTP")));
                                    if (await ApiHelper.sendOtpCall(
                                      mobile: mobileNumberCtrl.text,
                                    )) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "OTP sent successfully")));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text("Failed to send OTP")));
                                    }
                                  }
                                },
                                child: const FittedBox(
                                    child: Text(
                                  "Send OTP",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.normal),
                                )),
                              )
                      ],
                    ),
                    verifiedNumber == mobileNumberCtrl.text
                        ? const SizedBox()
                        : const CustomTextFormFieldLabel(
                            title: "Enter OTP", isRequired: true),
                    verifiedNumber == mobileNumberCtrl.text
                        ? const SizedBox()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OtpInput(_fieldOne, false,
                                  canGoNext: true, canGoPrev: false),
                              OtpInput(_fieldTwo, false,
                                  canGoPrev: true, canGoNext: true),
                              OtpInput(_fieldThree, false,
                                  canGoPrev: true, canGoNext: true),
                              OtpInput(_fieldFour, false,
                                  canGoPrev: true, canGoNext: true),
                              OtpInput(_fieldFive, false,
                                  canGoPrev: true, canGoNext: true),
                              OtpInput(_fieldSix, false,
                                  canGoPrev: true, canGoNext: false),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 16),
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF8D4600),
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.normal),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      side: const BorderSide(
                                          color: Color(0xFF8D4600))),
                                ),
                                onPressed: () async {
                                  if (_fieldOne.text.isEmpty ||
                                      _fieldTwo.text.isEmpty ||
                                      _fieldThree.text.isEmpty ||
                                      _fieldFour.text.isEmpty ||
                                      _fieldFive.text.isEmpty ||
                                      _fieldSix.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Please enter OTP")));
                                    return;
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Verifying OTP")));
                                    if (await ApiHelper.verifyOtp(
                                        mobile: mobileNumberCtrl.text,
                                        otp: _fieldOne.text +
                                            _fieldTwo.text +
                                            _fieldThree.text +
                                            _fieldFour.text +
                                            _fieldFive.text +
                                            _fieldSix.text.trim())) {
                                      verifiedNumber = mobileNumberCtrl.text;
                                      setState(() {});
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "OTP verified successfully")));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text("Enter Valid OTP")));
                                    }
                                  }
                                },
                                child: const FittedBox(
                                    child: Text(
                                  "Verify",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.normal),
                                )),
                              )
                            ],
                          ),
                    CustomTextFormField(
                      title: "First Name",
                      isRequired: true,
                      hint: "Your First Name",
                      controller: firstNameCtrl,
                      validator: (input) => (Validator.notNullValidator(input)),
                    ),
                    CustomTextFormField(
                      title: "Middle Name",
                      isRequired: true,
                      hint: "Your Middle Name",
                      controller: middleNameCtrl,
                      validator: (input) => Validator.notNullValidator(input),
                    ),
                    CustomTextFormField(
                      title: "Last Name",
                      isRequired: true,
                      hint: "Your Last Name",
                      controller: lastNameCtrl,
                      validator: (input) => Validator.notNullValidator(input),
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
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFFFF0000)),
                            ),
                          ]),
                        ),
                        Radio(
                            value: Gender.male,
                            groupValue: _gender,
                            onChanged: (Gender? value) {
                              setState(() {
                                _gender = value;
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
                            groupValue: _gender,
                            onChanged: (Gender? value) {
                              setState(() {
                                _gender = value;
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: CustomDateFormField(
                            title: "Date of Birth",
                            isRequired: true,
                            hint: "DD/MM/YYYY",
                            validator: (input) =>
                                Validator.notNullValidator(input),
                            suffix_icon: const Icon(
                              Icons.calendar_today_outlined,
                              color: Color(0xFF8D4600),
                              weight: 1,
                            ),
                            controller: dobCtrl,
                            lastDate: DateTime.now(),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: CustomTextFormField(
                            controller: ageCtrl,
                            title: "Age",
                            inputType: TextInputType.number,
                            isRequired: false,
                            maxLength: 3,
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
                            (e) => DropdownMenuItem<int>(
                              value: e.professionId,
                              child: Text(
                                e.title ?? "",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF323232),
                                    fontFamily: "Roboto"),
                              ),
                            ),
                          )
                          .toList(),
                      value: professionId,
                      onChanged: (input) => professionId = input,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            RichText(
                              textAlign: TextAlign.start,
                              text: const TextSpan(children: [
                                TextSpan(
                                  text: "Are You Doctor? ",
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
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFFF0000)),
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
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF323232)),
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
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF323232)),
                            ),


                          ],
                        ),
                        SizedBox()
                      ],
                    ),

                    CustomTextFormField(
                        title: "Email ID",
                        isRequired: true,
                        hint: "xyz@gmail.com",
                        validator: (input) => Validator.emailValidator(input),
                        controller: emailCtrl,
                        inputType: TextInputType.emailAddress),
                    CustomTextFormField(
                        title: "Emergency Contact",
                        isRequired: true,
                        hint: "Select Mandal / Mandir",
                        validator: (input) =>
                            Validator.phoneNumberValidator(input),
                        inputType: TextInputType.number,
                        maxLength: 10,
                        controller: emergencyContactCtrl),
                    CustomTextFormField(
                        title: "Pin Code",
                        isRequired: false,
                        hint: "Enter Pin Code",
                        maxLength: 6,
                        inputType: TextInputType.number,
                        controller: pinCodeCtrl),
                    CustomTextFormDropDown(
                      title: "Country",
                      isRequired: true,
                      items: countries!.rows!
                          .map(
                            (e) => DropdownMenuItem<int>(
                              value: e.countryId,
                              child: Text(
                                e.countryName ?? "",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF323232),
                                    fontFamily: "Roboto"),
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
                                    element.countryName?.trim().toLowerCase() ==
                                    "india")
                                .countryId;
                        if (isIndiaSelected) {
                          stateId = null;
                          districtId = null;
                        }
                        setState(() {});
                      },
                      validator: (input) =>
                          Validator.intNotNullValidator(input),
                    ),
                    isIndiaSelected
                        ? Column(
                            children: [
                              CustomTextFormDropDown(
                                title: "State",
                                isRequired: true,
                                items: states!.rows!
                                    .map(
                                      (e) => DropdownMenuItem<int>(
                                        value: e.stateId,
                                        child: Text(
                                          e.stateName ?? "",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF323232),
                                              fontFamily: "Roboto"),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                hint: "Select State",
                                value: stateId,
                                onChanged: (value) {
                                  stateId = value;
                                  districtId = null;
                                  loadDistricts();
                                },
                                validator: (input) =>
                                    Validator.intNotNullValidator(input),
                              ),
                              isDataLoaded
                                  ? CustomTextFormDropDown(
                                      title: "District",
                                      isRequired: true,
                                      items: districts?.rows!
                                              .map(
                                                (e) => DropdownMenuItem<int>(
                                                  value: e.districtId,
                                                  child: Text(
                                                    e.districtName ?? "",
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xFF323232),
                                                        fontFamily: "Roboto"),
                                                  ),
                                                ),
                                              )
                                              .toList() ??
                                          [],
                                      hint: "Select District",
                                      value: districtId,
                                      onChanged: (value) => districtId = value,
                                      validator: (input) =>
                                          Validator.intNotNullValidator(input),
                                    )
                                  : Container(),
                            ],
                          )
                        : Container(),
                    CustomTextFormField(
                        title: "City",
                        isRequired: true,
                        hint: "Enter City Name",
                        max_line: 1,
                        validator: (input) => Validator.notNullValidator(input),
                        controller: cityCtrl),
                    CustomTextFormField(
                        title: "Address",
                        isRequired: true,
                        max_line: 4,
                        validator: (input) => Validator.notNullValidator(input),
                        controller: addressCtrl),
                    CustomTextFormField(
                      title: "Mandal / Mandir",
                      isRequired: false,
                      controller: mandalMandirCtrl,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: CustomDateFormField(
                            title: "Date of Arrival",
                            isRequired: false,
                            hint: "Check in date",
                            suffix_icon: const Icon(
                              Icons.calendar_today_outlined,
                              color: Color(0xFF8D4600),
                              weight: 1,
                            ),
                            controller: arrivalDateCtrl,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: CustomTimeFormField(
                            title: "Time",
                            isRequired: false,
                            controller: arrivalTimeCtrl,
                            suffix_icon: const Icon(
                              Icons.access_time,
                              color: Color(0xFF8D4600),
                              weight: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: CustomDateFormField(
                            title: "Date of Departure",
                            isRequired: false,
                            hint: "Date of Departure",
                            suffix_icon: const Icon(
                              Icons.calendar_today_outlined,
                              color: Color(0xFF8D4600),
                              weight: 1,
                            ),
                            controller: departureDateCtrl,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: CustomTimeFormField(
                            title: "Time",
                            isRequired: false,
                            controller: departureTimeCtrl,
                            suffix_icon: const Icon(
                              Icons.access_time,
                              color: Color(0xFF8D4600),
                              weight: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                    CustomTextFormField(
                        title: "Remarks",
                        isRequired: false,
                        max_line: 4,
                        controller: remarksCtrl),

                    CustomImageFormField(
                        title: "Upload Your Photo",
                        initValue: widget.model.userPhoto,
                        onChanged: (value) {
                          widget.model.userPhoto = value;
                          setState(() {});
                        }),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          maximumSize: const Size.fromHeight(80)),
                      onPressed: () {
                        if (mobileNumberCtrl.text != verifiedNumber) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Please verify your mobile number.")));
                          return;
                        }
                        if (formKey.currentState!.validate()) {
                          widget.model.mobile = mobileNumberCtrl.text;
                          widget.model.otp =
                              "${_fieldOne.text.trim()}${_fieldTwo.text.trim()}${_fieldThree.text.trim()}${_fieldFour.text.trim()}${_fieldFive.text.trim()}${_fieldSix.text.trim()}";

                          widget.model.firstName = firstNameCtrl.text;
                          widget.model.middleName = middleNameCtrl.text;
                          widget.model.lastName = lastNameCtrl.text;
                          widget.model.gender =
                              _gender == Gender.female ? "Female" : "Male";
                          widget.model.birthDate = DateFormat("yyyy-MM-dd")
                              .format(
                                  DateFormat("dd-MM-yyyy").parse(dobCtrl.text));
                          widget.model.age = ageCtrl.text == ""
                              ? null
                              : int.parse(ageCtrl.text);
                          widget.model.professionId = professionId;
                          widget.model.isDoctor =
                              _isDoctor == Bool.yes ? true : false;
                          widget.model.email = emailCtrl.text;
                          widget.model.emergencyContact =
                              emergencyContactCtrl.text;

                          widget.model.pinCode = pinCodeCtrl.text;
                          widget.model.countryId = countryId;
                          widget.model.stateName = isIndiaSelected
                              ? states?.rows
                                  ?.firstWhere(
                                      (element) => element.stateId == stateId)
                                  .stateName
                              : null;
                          widget.model.stateId =
                              isIndiaSelected ? stateId : null;
                          widget.model.districtName = isIndiaSelected
                              ? districts?.rows
                                  ?.firstWhere((element) =>
                                      element.districtId == districtId)
                                  .districtName
                              : null;
                          widget.model.districtId =
                              isIndiaSelected ? districtId : null;
                          widget.model.cityName = cityCtrl.text;
                          widget.model.address = addressCtrl.text;

                          widget.model.mandal = mandalMandirCtrl.text;
                          widget.model.arrivalDate = arrivalDateCtrl.text == ""
                              ? null
                              : DateFormat("yyyy-MM-dd").format(
                                  DateFormat("dd-MM-yyyy")
                                      .parse(arrivalDateCtrl.text));
                          widget.model.arrivalTime = arrivalTimeCtrl.text;
                          widget.model.departureDate =
                              departureDateCtrl.text == ""
                                  ? null
                                  : DateFormat("yyyy-MM-dd").format(
                                      DateFormat("dd-MM-yyyy")
                                          .parse(departureDateCtrl.text));
                          widget.model.departureTime = departureTimeCtrl.text;
                          widget.model.remarks = remarksCtrl.text;

                          if (widget.model.userPhoto != null) {
                            widget.onPressed!();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Please Upload Image To Continue!")));
                          }
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar((const SnackBar(
                            content: Text(
                                "Fill All Mandatory Fields with Valid Input!"),
                          )));
                          scrollCtrl.animateTo(scrollCtrl.initialScrollOffset,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final bool canGoPrev;
  final bool canGoNext;

  const OtpInput(
    this.controller,
    this.autoFocus, {
    Key? key,
    required this.canGoPrev,
    required this.canGoNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.1,
      child: TextFormField(
        onTap: () {
          final TextSelection newSelection = TextSelection.collapsed(
            offset: controller.text.length,
          );
          controller.selection = newSelection;
        },
        validator: (input) => Validator.notNullValidator(input),
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 2,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            errorStyle: TextStyle(
              height: 0,
              fontSize: 0,
            ),
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 2) {
            if (canGoNext) {
              controller.text = value[value.length - 1];
            }
            if (canGoNext) {
              FocusScope.of(context).nextFocus();
            } else {
              controller.selection = TextSelection.collapsed(
                offset: controller.text.length,
              );
            }
          } else if (value.isEmpty) {
            controller.text = " ";
            if (canGoPrev) {
              FocusScope.of(context).previousFocus();
            } else {
              controller.selection = TextSelection.collapsed(
                offset: controller.text.length,
              );
            }
          }
        },
      ),
    );
  }
}
