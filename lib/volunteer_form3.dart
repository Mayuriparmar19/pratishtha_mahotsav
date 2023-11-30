import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'form_validator.dart';
import 'models/volunteer_registration_model.dart';
import 'customwidgets/custom_text_form_field.dart';
import 'customwidgets/custom_text_form_label.dart';

class VolunteerForm3 extends StatefulWidget {
  const VolunteerForm3({Key? key, this.onPressed, required this.model})
      : super(key: key);
  final VolunteerRegistrationModel model;
  final VoidCallback? onPressed;

  @override
  State<VolunteerForm3> createState() => _VolunteerForm3State();
}

enum YesNo { yes, no }

class _VolunteerForm3State extends State<VolunteerForm3> {
  ScrollController scrollCtrl = ScrollController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController departmentCtrl = TextEditingController();
  TextEditingController dayCtrl = TextEditingController();
  TextEditingController suggestionCtrl = TextEditingController();
  YesNo _participant = YesNo.yes;
  List<String> skills = [];
  String? cat;
  @override
  void initState() {
    _participant = widget.model.participateOrNOt == "N" ? YesNo.no : YesNo.yes;
    departmentCtrl.text = widget.model.department ?? "";
    skills =
        widget.model.departmenrList?.map((e) => e as String).toList() ?? [];
    setState(() {});

    dayCtrl.text = widget.model.days ?? "";
    suggestionCtrl.text = widget.model.suggestion ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadiusDirectional.vertical(top: Radius.circular(20))),
      child: SingleChildScrollView(
        controller: scrollCtrl,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
              child: Form(
                key: formKey,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xffFFFFFF),
                  ),
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextFormFieldLabel(
                        title:
                            'Have You ever participated in any such event as Swayam Sevak in the past?',
                        isRequired: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                              activeColor: const Color(0xff8D4600),
                              value: YesNo.yes,
                              groupValue: _participant,
                              onChanged: (YesNo? value) {
                                _participant = value!;
                                setState(() {});
                              }),
                          const Text(
                            "Yes",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF323232),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Radio(
                              activeColor: const Color(0xff8D4600),
                              value: YesNo.no,
                              groupValue: _participant,
                              onChanged: (YesNo? value) {
                                _participant = value!;
                                setState(() {});
                              }),
                          const Text(
                            "No",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF323232),
                            ),
                          )
                        ],
                      ),
                      CustomTextFormField(
                        title: 'Department you have worked as Swayam Sevak',
                        isRequired: true,
                        hint: 'Enter Here',
                        validator: (input) => Validator.notNullValidator(input),
                        controller: departmentCtrl,
                      ),
                      const CustomTextFormFieldLabel(
                          title:
                              'Please select any 3 Departments / Committees as per your interest & skill set from the list given below',
                          isRequired: true),
                      MultiSelectDialogField(
                          initialValue: skills,
                          validator: (values) {
                            if (values!.length == 3) {
                              return null;
                            } else if (values.length < 3) {
                              return "Select Any 3 Department or Skill";
                            } else if (values.length > 3) {
                              return "You Can Choose Only 3 Departments";
                            }
                            return null;
                          },
                          buttonText: const Text(
                            '  Select Skill',
                            style: TextStyle(
                                height: 2,
                                fontSize: 16,
                                color: Color(0xFFC1C1C1),
                                fontFamily: "Roboto"),
                          ),
                          selectedColor: const Color(0xFF8D4600),
                          checkColor: const Color(0xFFFFFFFF),
                          separateSelectedItems: false,
                          dialogHeight: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: const Color(0xFFCCCCCC), width: 1)),
                          buttonIcon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Color(0xFF848484),
                              size: 30),
                          items: [
                            "Department 1",
                            "Department 2",
                            "Department 3",
                            "Department 4",
                            "Department 5",
                            "Department 6"
                          ].map((e) => MultiSelectItem(e, e)).toList(),
                          onConfirm: (values) {
                            skills = values;
                          }),
                      CustomTextFormField(
                        controller: dayCtrl,
                        title:
                            'How many days can you devote during the event? like 30 / 15 / 7 days etc',
                        isRequired: true,
                        inputType: TextInputType.number,
                        maxLength: 3,
                        validator: (input) => Validator.notNullValidator(input),
                        hint: 'Enter Here',
                        suffix_icon: Container(
                            height: size.height * 0.08,
                            width: size.width * 0.2,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(4)),
                              color: Color(0xff8D4600),
                            ),
                            child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Days',
                                  style: TextStyle(
                                      fontFamily: 'RobotoRegular',
                                      fontSize: 14,
                                      color: Colors.white),
                                ))),
                      ),
                      CustomTextFormField(
                        title: 'Remarks / Suggestions',
                        isRequired: false,
                        max_line: 4,
                        controller: suggestionCtrl,
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: size.width,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              widget.model.participateOrNOt =
                                  _participant == YesNo.yes ? "Y" : "N";
                              widget.model.department = departmentCtrl.text;
                              widget.model.departmenrList = skills;
                              widget.model.days = dayCtrl.text;
                              widget.model.suggestion = suggestionCtrl.text;
                              widget.onPressed!();
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text("${widget.model.toJson()}",
                                        style: const TextStyle(fontSize: 18)),
                                  );
                                },
                              );
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
                          child: const Text('Submit',
                              style: TextStyle(
                                  fontSize: 16, fontFamily: "Roboto-M")),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
