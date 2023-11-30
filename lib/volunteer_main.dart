import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'customwidgets/back_pressed_dialog.dart';
import 'models/volunteer_registration_model.dart';
import 'volunteer_form1.dart';
import 'volunteer_form2.dart';
import 'volunteer_form3.dart';
import 'api/api_helper.dart';

class VolunteerMain extends StatefulWidget {
  const VolunteerMain({super.key});

  @override
  State<VolunteerMain> createState() => _VolunteerMainState();
}

class _VolunteerMainState extends State<VolunteerMain> {
  Map<String, dynamic>? countries;
  Map<String, dynamic>? states;

  late VolunteerRegistrationModel model = VolunteerRegistrationModel();
  List<Widget> steps = [];
  int currentForm = 0;
  int filledForm = 0;
  bool isDataLoaded = false;
  Future<void> loadApiData() async {
    countries = await ApiHelper.getApiData(
        "http://13.126.120.16/pratishtha/rest/apiv1/countries", context);
    states = await ApiHelper.getApiData(
        "http://13.126.120.16/pratishtha/rest/apiv1/states", context);
    model = VolunteerRegistrationModel.fromJson(
        await VolunteerRegistrationModel.readModel());
    steps = [
      VolunteerForm1(
          model: model,
          onPressed: () {
            VolunteerRegistrationModel.storeModel(model);
            currentForm = 1;
            filledForm = currentForm < filledForm ? filledForm : currentForm;
            setState(() {});
          }),
      // VolunteerForm2(
      //   states: states!,
      //   countries: countries!,
      //   model: model,
      //   onPressed: () {
      //     VolunteerRegistrationModel.storeModel(model);
      //     currentForm = 2;
      //     filledForm = currentForm < filledForm ? filledForm : currentForm;
      //     setState(() {});
      //   },
      // ),
      VolunteerForm3(
        model: model,
        onPressed: () {
          VolunteerRegistrationModel.storeModel(model);
          filledForm = currentForm < filledForm ? filledForm : currentForm;
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Submitting Form...")));
        },
      )
    ];
    setState(() {
      isDataLoaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    loadApiData();
    super.initState();
  }

  Future<bool> getFutureBool(bool value) async {
    return value;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () {
        if (currentForm == 0) {
          return BackPressedDialog(
              "Do You Want To Leave Registration Form?", context);
        } else {
          currentForm--;
          setState(() {});
          return getFutureBool(false);
        }
      },
      child: Scaffold(
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
          title: const Text(
            "Volunteer Registration",
            style: TextStyle(
              fontSize: 19,
              fontFamily: "Droid-Bold",
              fontWeight: FontWeight.bold,
              color: Color(0xFF9E4F01),
            ),
          ),
        ),
        body: isDataLoaded
            ? Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/half_madala_mask.png"),
                            fit: BoxFit.fill),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFFFFFFFF), Color(0xFFFFE9B8)])),
                    height: height * 0.21 + 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.115),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    currentForm = 0;
                                    setState(() {});
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: currentForm == 0
                                        ? const Color(0xFF8D4600)
                                        : const Color(0xFF689540),
                                    radius: 20,
                                    child: const Center(
                                        child: Text(
                                      "1",
                                      style:
                                          TextStyle(color: Color(0xFFFFFFFF)),
                                    )),
                                  ),
                                ),
                                Container(
                                  color: const Color(0xffE1B041),
                                  height: 1,
                                  width: width * 0.25,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (filledForm >= 1) {
                                      currentForm = 1;
                                      setState(() {});
                                    }
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: currentForm == 1
                                        ? const Color(0xFF8D4600)
                                        : currentForm < 1
                                            ? const Color(0xFFFFE9B8)
                                            : const Color(0xFF689540),
                                    radius: 20,
                                    child: Center(
                                        child: Text(
                                      "2",
                                      style: TextStyle(
                                          color: Color(currentForm < 1
                                              ? 0xFF8D4600
                                              : 0xFFFFFFFF)),
                                    )),
                                  ),
                                ),
                                Container(
                                  color: const Color(0xffE1B041),
                                  height: 1,
                                  width: width * 0.25,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (filledForm >= 2) {
                                      // scrCtrl.jumpTo(scrCtrl.initialScrollOffset);
                                      currentForm = 2;
                                      setState(() {});
                                    }
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: currentForm == 2
                                        ? const Color(0xFF8D4600)
                                        : currentForm < 2
                                            ? const Color(0xFFFFE9B8)
                                            : const Color(0xFF689540),
                                    radius: 20,
                                    child: Center(
                                        child: Text(
                                      "3",
                                      style: TextStyle(
                                        color: Color(currentForm < 2
                                            ? 0xFF8D4600
                                            : 0xFFFFFFFF),
                                      ),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              //color: Color(0xffFFE9B8),
                              width: width * 0.9,
                              height: 30,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Personal Details",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF8D4600),
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    "Contact Details",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: currentForm < 1
                                            ? const Color(0xFF848484)
                                            : const Color(0xFF8D4600),
                                        fontFamily: currentForm < 1
                                            ? "Roboto-R"
                                            : "Roboto-M",
                                        fontWeight: currentForm < 1
                                            ? FontWeight.normal
                                            : FontWeight.bold),
                                  ),
                                  Text(
                                    "Other Details",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: currentForm < 2
                                            ? const Color(0xFF848484)
                                            : const Color(0xFF8D4600),
                                        fontFamily: currentForm < 2
                                            ? "Roboto-R"
                                            : "Roboto-M",
                                        fontWeight: currentForm < 2
                                            ? FontWeight.normal
                                            : FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            SvgPicture.asset(
                              "assets/icons/divider2.svg",
                              color: const Color(0xFFF6C024),
                              width: width * 0.9,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height * 0.2 + 60),
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              spreadRadius: 10,
                              blurRadius: 20,
                              color: Colors.grey),
                        ],
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16))),
                    child: steps[currentForm],
                  )
                ],
              )
            : const Center(
                child: CircularProgressIndicator(color: Color(0xFF8D4600)),
              ),
      ),
    );
  }
}
