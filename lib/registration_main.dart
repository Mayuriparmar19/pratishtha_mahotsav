import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pratishtha_mahotsav/registration_form4.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'customwidgets/back_pressed_dialog.dart';
import 'customwidgets/custom_drawer.dart';
import 'models/user_registration_model.dart';
import 'registration_form1.dart';
import 'registration_form2.dart';
import 'registration_form3.dart';

import 'api/api_helper.dart';

class RegistrationMain extends StatefulWidget {
  const RegistrationMain({super.key});

  @override
  State<RegistrationMain> createState() => _RegistrationMainState();
}

class _RegistrationMainState extends State<RegistrationMain> {
  late UserRegistrationModel model = UserRegistrationModel();
  Map<String, dynamic>? professions;
  Map<String, dynamic>? countries;
  Map<String, dynamic>? states;
  Map<String, dynamic>? foodPreferences;
  Map<String, dynamic>? districts;

  // form controllers
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final form2Key = GlobalKey<FormState>();
  final form3Key = GlobalKey<FormState>();
  final ScrollController scrCtrl = ScrollController();

  // stepper controllers
  List<Widget> steps = [];
  int currentForm = 0;
  int filledForm = 0;
  bool isDataLoaded = false;
  setDataLoaded(bool status) {
    isDataLoaded = status;
    setState(() {});
  }

  void setLoadingOverLayVisibility(bool status) {
    if (status) {
      context.loaderOverlay.show();
    } else {
      context.loaderOverlay.hide();
    }
  }

  //data loader
  Future<void> loadApiData() async {
    setDataLoaded(false);
    SharedPreferences prefer = await SharedPreferences.getInstance();

    professions = await ApiHelper.getApiData(
        "http://13.126.120.16/pratishtha/rest/apiv1/professions", context);
    countries = await ApiHelper.getApiData(
        "http://13.126.120.16/pratishtha/rest/apiv1/countries", context);
    states = await ApiHelper.getApiData(
        "http://13.126.120.16/pratishtha/rest/apiv1/states", context);
    foodPreferences = await ApiHelper.getApiData(
        "http://13.126.120.16/pratishtha/rest/apiv1/food-preferences", context);

    model =
        UserRegistrationModel.fromJson(await UserRegistrationModel.readModel());
    model.token = prefer.getString("token");
    print(model.token);
    steps = [
      RegisterForm1(
          professions: professions!,
          model: model,
          states: states!,
          countries: countries!,
          setLoadingOverLayVisiblity: setLoadingOverLayVisibility,
          onPressed: () {
            UserRegistrationModel.storeModel(model);
            currentForm = 1;
            filledForm = currentForm < filledForm ? filledForm : currentForm;
            // scrCtrl.jumpTo(scrCtrl.initialScrollOffset);
            setState(() {});
          }),
      RegisterForm2(
        foodPreferences: foodPreferences!,
        model: model,
        onPressed: () {
          UserRegistrationModel.storeModel(model);
          currentForm = 2;
          filledForm = currentForm < filledForm ? filledForm : currentForm;
          // scrCtrl.jumpTo(scrCtrl.initialScrollOffset);
          setState(() {});
        },
      ),
      RegisterForm3(
        model: model,
        onPressed: () {
          UserRegistrationModel.storeModel(model);
          filledForm = currentForm < filledForm ? filledForm : currentForm;
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RegisterForm4(
                model: model,
                countries: countries!,
                states: states!,
                foodPreferences: foodPreferences!,
                setLoadingOverLayVisibility: setLoadingOverLayVisibility,
                professions: professions!),
          ));
        },
      )
    ];
    setDataLoaded(true);
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
        key: _scaffoldKey,
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
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body: isDataLoaded
            ? LoaderOverlay(
                closeOnBackButton: false,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/half_madala_mask.png"),
                        fit: BoxFit.fill,
                      )),
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
                                        style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontFamily: "Roboto-R"),
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
                                            color: Color(0xff323232),
                                            fontFamily: "Roboto-M",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "Awas Details   ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: const Color(0xff323232),
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
                                          color: const Color(0xff323232),
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
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16))),
                      child: steps[currentForm],
                    )
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(color: Color(0xFF8D4600)),
              ),
      ),
    );
  }
}
