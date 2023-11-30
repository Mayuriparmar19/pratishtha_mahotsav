import 'package:flutter/material.dart';
import 'customwidgets/custom_date_form_field.dart';
import 'customwidgets/custom_image_form_field.dart';
import 'models/volunteer_registration_model.dart';
import 'form_validator.dart';

class VolunteerForm1 extends StatefulWidget {
  const VolunteerForm1({Key? key, this.onPressed, required this.model})
      : super(key: key);
  final VoidCallback? onPressed;
  final VolunteerRegistrationModel model;
  @override
  State<VolunteerForm1> createState() => _VolunteerForm1State();
}

enum Gender { male, female }

enum JobProfile { business, profession, service, retired, student, housewife }

class _VolunteerForm1State extends State<VolunteerForm1> {
  ScrollController scrollCtrl = ScrollController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController mandalCtrl = TextEditingController();
  TextEditingController dobController = TextEditingController();
  Gender _gender = Gender.male;
  JobProfile _profile = JobProfile.business;
  Map<String, bool> checkbox = {
    "gujarati": false,
    "hindi": false,
    "english": false,
    "marathi": false,
    "bengali": false,
    "other": false
  };

  @override
  void initState() {
    // TODO: implement initState
    fullNameCtrl.text = widget.model.fullName ?? "";
    _gender = widget.model.gender == "F" ? Gender.female : Gender.male;
    dobController.text = widget.model.dateOfBirth ?? "";
    mandalCtrl.text = widget.model.trust ?? "";
    widget.model.language?.forEach((element) {
      checkbox[element] = true;
    });
    setState(() {});
    _profile = JobProfile.values.byName(widget.model.jobProfile ?? "business");
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
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text("Full Name",style: TextStyle(color: Color(0xff323232),fontSize: 16),),
                    RichText(
                        text: const TextSpan(
                            text: "Full Name",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff323232),
                                fontFamily: "Roboto"),
                            children: [
                          TextSpan(
                              text: "*",
                              style: TextStyle(color: Color(0xffFF0000)))
                        ])),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: fullNameCtrl,
                      validator: (input) => Validator.notNullValidator(input),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          hintText: "Enter Full Name",
                          hintStyle: const TextStyle(
                            fontFamily: "Roboto",
                            color: Color(0xffC1C1C1),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        RichText(
                            text: const TextSpan(
                                text: "Gender",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff323232),
                                    fontFamily: "Roboto"),
                                children: [
                              TextSpan(
                                  text: "*",
                                  style: TextStyle(color: Color(0xffFF0000)))
                            ])),
                        Radio(
                            value: Gender.male,
                            groupValue: _gender,
                            onChanged: (Gender? value) {
                              setState(() {
                                _gender = value!;
                              });
                            }),
                        const Text(
                          "Male",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto",
                          ),
                        ),
                        Radio(
                            value: Gender.female,
                            groupValue: _gender,
                            onChanged: (Gender? value) {
                              setState(() {
                                _gender = value!;
                              });
                            }),
                        const Text(
                          "Female",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto",
                          ),
                        )
                      ],
                    ),

                    CustomDateFormField(
                        hint: "DD-MM-YY",
                        title: "Date of Birth",
                        isRequired: true,
                        validator: (input) => Validator.notNullValidator(input),
                        suffix_icon: const Icon(Icons.calendar_today_outlined,
                            color: Color(0xFF8D4600)),
                        controller: dobController),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                        text: const TextSpan(
                            text: "Jin Mandir/Trust/Manda",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff323232),
                                fontFamily: "Roboto"),
                            children: [
                          TextSpan(
                              text: "*",
                              style: TextStyle(color: Color(0xffFF0000)))
                        ])),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: mandalCtrl,
                      maxLines: 4,
                      validator: (input) => Validator.notNullValidator(input),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    const Text(
                      "(Full Name of Jin Mandir / Trust / Mandal you are associated along with address)",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff989898),
                          fontFamily: "Roboto"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Languages Known",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff323232),
                          fontFamily: "Roboto"),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: checkbox["gujarati"],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkbox["gujarati"] = value!;
                                    });
                                  },
                                  activeColor: const Color(0xff8D4600),
                                ),
                                const Text(
                                  "Gujarati",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff323232),
                                      fontFamily: "Roboto"),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: checkbox["english"],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkbox["english"] = value!;
                                    });
                                  },
                                  activeColor: const Color(0xff8D4600),
                                ),
                                const Text(
                                  "English",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff323232),
                                      fontFamily: "Roboto"),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: checkbox["bengali"],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkbox["bengali"] = value!;
                                    });
                                  },
                                  activeColor: const Color(0xff8D4600),
                                ),
                                const Text(
                                  "Bengali",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff323232),
                                      fontFamily: "Roboto"),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 45,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    value: checkbox["hindi"],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        checkbox["hindi"] = value!;
                                      });
                                    },
                                    activeColor: const Color(0xff8D4600)),
                                const Text(
                                  "Hindi",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff323232),
                                      fontFamily: "Roboto"),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: checkbox["marathi"],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkbox["marathi"] = value!;
                                    });
                                  },
                                  activeColor: const Color(0xff8D4600),
                                ),
                                const Text(
                                  "Marathi",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff323232),
                                      fontFamily: "Roboto"),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: checkbox["other"],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkbox["other"] = value!;
                                    });
                                  },
                                  activeColor: const Color(0xff8D4600),
                                ),
                                const Text(
                                  "Others",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff323232),
                                      fontFamily: "Roboto"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Job Profile",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff323232),
                          fontFamily: "Roboto"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio(
                                    value: JobProfile.business,
                                    groupValue: _profile,
                                    onChanged: (JobProfile? value) {
                                      setState(() {
                                        _profile = value!;
                                      });
                                    }),
                                const Text(
                                  "Business",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: JobProfile.service,
                                    groupValue: _profile,
                                    onChanged: (JobProfile? value) {
                                      setState(() {
                                        _profile = value!;
                                      });
                                    }),
                                const Text(
                                  "Service",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: JobProfile.student,
                                    groupValue: _profile,
                                    onChanged: (JobProfile? value) {
                                      setState(() {
                                        _profile = value!;
                                      });
                                    }),
                                const Text(
                                  "Student",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio(
                                    value: JobProfile.profession,
                                    groupValue: _profile,
                                    onChanged: (JobProfile? value) {
                                      setState(() {
                                        _profile = value!;
                                      });
                                    }),
                                const Text(
                                  "Profession",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: JobProfile.retired,
                                    groupValue: _profile,
                                    onChanged: (JobProfile? value) {
                                      setState(() {
                                        _profile = value!;
                                      });
                                    }),
                                const Text(
                                  "Retired",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: JobProfile.housewife,
                                    groupValue: _profile,
                                    onChanged: (JobProfile? value) {
                                      setState(() {
                                        _profile = value!;
                                      });
                                    }),
                                const Text(
                                  "Housewife",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
// const SizedBox(
//   width: 40,
// ),
                      ],
                    ),

                    CustomImageFormField(
                        title: "Upload Your Photo",
                        initValue: widget.model.Image,
                        onChanged: (path) {
                          widget.model.Image = path;
                        }),

                    SizedBox(
                      width: size.width,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            widget.model.fullName = fullNameCtrl.text;
                            widget.model.gender =
                                _gender == Gender.male ? "M" : "F";
                            widget.model.dateOfBirth = dobController.text;
                            widget.model.trust = mandalCtrl.text;
                            widget.model.language = [];
                            checkbox.forEach((key, value) {
                              if (value) {
                                widget.model.language?.add(key);
                              }
                            });
                            widget.model.jobProfile = _profile.name;
                            if (widget.model.Image != null) {
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
                        child: const Text('Save & Next',
                            style: TextStyle(
                                fontSize: 16, fontFamily: "Roboto-M")),
                      ),
                    )
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
