import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pratishtha_mahotsav/customwidgets/custom_text_form_label.dart';
import 'customwidgets/custom_date_form_field.dart';
import 'customwidgets/custom_text_form_dropdown.dart';
import 'customwidgets/custom_time_form_field.dart';
import 'form_validator.dart';
import 'models/food_preference_model.dart';
import 'models/user_registration_model.dart';

enum Bool { yes, no }

enum AwasType { dharamshala, star3, star4 }

enum TransportType { train, road, self, flight }

class RegisterForm2 extends StatefulWidget {
  const RegisterForm2({
    Key? key,
    this.onPressed,
    required this.model,
    required this.foodPreferences,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final UserRegistrationModel model;
  final Map<String, dynamic> foodPreferences;

  @override
  State<RegisterForm2> createState() => _RegisterForm2State();
}

class _RegisterForm2State extends State<RegisterForm2> {
  ScrollController scrollCtrl = ScrollController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController arrivalDateCtrl = TextEditingController();
  TextEditingController arrivalTimeCtrl = TextEditingController();
  TextEditingController departureDateCtrl = TextEditingController();
  TextEditingController departureTimeCtrl = TextEditingController();

  FoodPreferenceModel? foodPreferences;
  int? foodId;
  Bool? _needAwas = Bool.yes;
  AwasType? _awasType = AwasType.dharamshala;
  TransportType? _transportType = TransportType.train;

  @override
  void initState() {
    // TODO: implement initState
    foodPreferences = FoodPreferenceModel.fromJson(widget.foodPreferences);
    _needAwas = widget.model.awasRequired == false ? Bool.no : Bool.yes;
    arrivalDateCtrl.text = widget.model.arrivalDateAwas == null
        ? ""
        : DateFormat("dd-MM-yyyy").format(
            DateFormat("yyyy-MM-dd").parse(widget.model.arrivalDateAwas!));
    arrivalTimeCtrl.text = widget.model.arrivalTimeAwas ?? "";
    departureDateCtrl.text = widget.model.departureDateAwas == null
        ? ""
        : DateFormat("dd-MM-yyyy").format(
            DateFormat("yyyy-MM-dd").parse(widget.model.departureDateAwas!));
    departureTimeCtrl.text = widget.model.departureTimeAwas ?? "";
    _awasType = widget.model.awasType == "3 Star"
        ? AwasType.star3
        : widget.model.awasType == "4 Star"
            ? AwasType.star4
            : AwasType.dharamshala;
    _transportType = widget.model.transportMode == "By Road"
        ? TransportType.road
        : widget.model.transportMode == "Self Drive"
            ? TransportType.self
            : widget.model.transportMode == "By Flight"
                ? TransportType.flight
                : TransportType.train;
    foodId = widget.model.foodPreferenceId;
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
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // write content of form here
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 18,
                          ),
                          Row(
                            children: [
                              RichText(
                                textAlign: TextAlign.start,
                                text: const TextSpan(children: [
                                  TextSpan(
                                    text: "Awas Required ",
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
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF323232)),
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
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF323232)),
                              )
                            ],
                          ),
                          _needAwas == Bool.yes
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                            hint: "-- : -- --",
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
                                            hint: "-- : -- --",
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
                                    const CustomTextFormFieldLabel(
                                      isRequired: true,
                                      title:
                                          "Awas Type(The price listed below is per person per day) ",
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                            value: AwasType.dharamshala,
                                            groupValue: _awasType,
                                            onChanged: (AwasType? value) {
                                              setState(() {
                                                _awasType = value;
                                              });
                                            }),
                                        const Text(
                                          "Dharamshala - INR: ₹ 250/- (Refundable)",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF323232)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                            value: AwasType.star3,
                                            groupValue: _awasType,
                                            onChanged: (AwasType? value) {
                                              setState(() {
                                                _awasType = value;
                                              });
                                            }),
                                        const Text(
                                          "3 Star - INR: ₹ 750/- (Non-Refundable)",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF323232)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                            value: AwasType.star4,
                                            groupValue: _awasType,
                                            onChanged: (AwasType? value) {
                                              setState(() {
                                                _awasType = value;
                                              });
                                            }),
                                        const Text(
                                          "4 Star - INR: ₹ 1500/- (Non-Refundable)",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF323232)),
                                        ),
                                      ],
                                    ),
                                    const CustomTextFormFieldLabel(
                                        title: "Mode of Transport",
                                        isRequired: true),
                                    Row(
                                      children: [
                                        Radio(
                                            value: TransportType.train,
                                            groupValue: _transportType,
                                            onChanged: (TransportType? value) {
                                              setState(() {
                                                _transportType = value;
                                              });
                                            }),
                                        const Text(
                                          "By Rail",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF323232)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                            value: TransportType.road,
                                            groupValue: _transportType,
                                            onChanged: (TransportType? value) {
                                              setState(() {
                                                _transportType = value;
                                              });
                                            }),
                                        const Text(
                                          "By Road",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF323232)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                            value: TransportType.self,
                                            groupValue: _transportType,
                                            onChanged: (TransportType? value) {
                                              setState(() {
                                                _transportType = value;
                                              });
                                            }),
                                        const Text(
                                          "Self Drive",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF323232)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                            value: TransportType.flight,
                                            groupValue: _transportType,
                                            onChanged: (TransportType? value) {
                                              setState(() {
                                                _transportType = value;
                                              });
                                            }),
                                        const Text(
                                          "By Flight",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF323232)),
                                        ),
                                      ],
                                    ),
                                    CustomTextFormDropDown(
                                      title: "Food Preference",
                                      isRequired: true,
                                      value: foodId,
                                      items: foodPreferences!.rows!
                                          .map(
                                            (e) => DropdownMenuItem<int>(
                                              value: e.foodPreferenceId,
                                              child: Text(
                                                e.title ?? "",
                                                style: const TextStyle(
                                                    fontSize: 16,
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
                                          Validator.intNotNullValidator(input),
                                      onChanged: (value) => foodId = value,
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 32,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                maximumSize: const Size.fromHeight(80)),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                widget.model.awasRequired =
                                    _needAwas == Bool.yes ? true : false;
                                if (_needAwas == Bool.yes) {
                                  widget.model.arrivalDateAwas =
                                      arrivalDateCtrl.text == ""
                                          ? null
                                          : DateFormat("yyyy-MM-dd").format(
                                              DateFormat("dd-MM-yyyy")
                                                  .parse(arrivalDateCtrl.text));
                                  widget.model.arrivalTimeAwas =
                                      arrivalTimeCtrl.text;
                                  widget.model.departureDateAwas =
                                      departureDateCtrl.text == ""
                                          ? null
                                          : DateFormat("yyyy-MM-dd").format(
                                              DateFormat("dd-MM-yyyy").parse(
                                                  departureDateCtrl.text));
                                  widget.model.departureTimeAwas =
                                      departureTimeCtrl.text;
                                  widget.model.awasType =
                                      _awasType == AwasType.dharamshala
                                          ? "Dharamshala"
                                          : _awasType == AwasType.star3
                                              ? "3 Star"
                                              : _awasType == AwasType.star4
                                                  ? "4 Star"
                                                  : "";
                                  widget.model.transportMode = _transportType ==
                                          TransportType.train
                                      ? "By Rail"
                                      : _transportType == TransportType.road
                                          ? "By Road"
                                          : _transportType == TransportType.self
                                              ? "Self Drive"
                                              : _transportType ==
                                                      TransportType.flight
                                                  ? "By Flight"
                                                  : "";
                                  widget.model.foodPreferenceId = foodId;
                                } else {
                                  widget.model.arrivalDateAwas = null;
                                  widget.model.arrivalTimeAwas = null;
                                  widget.model.departureDateAwas = null;
                                  widget.model.departureTimeAwas = null;
                                  widget.model.awasType = null;
                                  widget.model.transportMode = null;
                                  widget.model.foodPreferenceId = null;
                                }
                                widget.onPressed!();
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar((const SnackBar(
                                  content: Text(
                                      "Fill All Mandatory Fields with Valid Input!"),
                                )));
                                scrollCtrl.animateTo(
                                    scrollCtrl.initialScrollOffset,
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
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
