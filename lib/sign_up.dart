// ignore_for_file: nonant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'customwidgets/customColor.dart';
import 'home_and_profile/customwidgets.dart';
import 'otp_screen.dart';
import 'sign_in.dart';
import 'api/api_helper.dart';
import 'models/signup_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final fName = TextEditingController();
  final mName = TextEditingController();
  final lName = TextEditingController();
  final mobileT = TextEditingController();
  final pass = TextEditingController();
  final cPass = TextEditingController();
  String? fname, mname, lname, mobile, pwd;
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: gradientColor,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/half_madala_mask.png"),
                      fit: BoxFit.cover),
                  gradient: LinearGradient(
                      colors: [Colors.white, gradientColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                padding: EdgeInsets.only(
                    top: size.height * 0.05, left: size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(
                      "Sign Up",
                      style: customFonts(fSize: 16),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Welcome to",
                      style: customFonts(
                          fSize: 22, family: "Droid-R", color: botomTextColor),
                    ),
                    Text(
                      "Mahamangal Panchkalyanak Pratishtha Mahotsav",
                      style: customFonts(fSize: 22, color: aboutColor),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.02),
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16))),
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "First Name",
                            style: customFonts(
                                fSize: 16,
                                color: aboutColor,
                                family: "Roboto-R"),
                          ),
                        ),
                        customTextFormField(
                          controller: fName,
                          hint: "First Name",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your first name";
                            }
                          },
                          prefix: const Icon(
                            Icons.person,
                            size: 18,
                            color: labelColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "Middle Name",
                            style: customFonts(
                                fSize: 16,
                                color: aboutColor,
                                family: "Roboto-R"),
                          ),
                        ),
                        customTextFormField(
                          controller: mName,
                          hint: "Middle Name",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your middle name";
                            }
                          },
                          prefix: const Icon(Icons.person,
                              size: 18, color: labelColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "Last Name",
                            style: customFonts(
                                fSize: 16,
                                color: aboutColor,
                                family: "Roboto-R"),
                          ),
                        ),
                        customTextFormField(
                          controller: lName,
                          hint: "Last Name",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your last name";
                            }
                          },
                          prefix: const Icon(
                            Icons.person,
                            size: 18,
                            color: labelColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "Mobile Number",
                            style: customFonts(
                                fSize: 16,
                                color: aboutColor,
                                family: "Roboto-R"),
                          ),
                        ),
                        customTextFormField(
                          controller: mobileT,
                          hint: "Mobile Number",
                          type: TextInputType.number,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your mobile number";
                            } else if (value.length != 10) {
                              return "Please enter valid mobile number";
                            }
                          },
                          prefix: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: SvgPicture.asset(
                                'assets/icons/icon_mobile.svg'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "Password",
                            style: customFonts(
                                fSize: 16,
                                color: aboutColor,
                                family: "Roboto-R"),
                          ),
                        ),
                        customTextFormField(
                          controller: pass,
                          hint: "Password",
                          validate: (value) {
                            RegExp regex = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#$&*~]).{6,}$');
                            if (value!.isEmpty) {
                              return "Please enter your password";
                            } else if (!regex.hasMatch(value)) {
                              return "Please enter valid password";
                            }
                          },
                          prefix: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: SvgPicture.asset(
                                'assets/icons/icon_unlock.svg'),
                          ),
                          suffix: IconButton(
                            icon: Icon(
                              _obscureText1
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: labelColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText1 = !_obscureText1;
                              });
                            },
                          ),
                          visible: _obscureText1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "Confirm Password",
                            style: customFonts(
                                fSize: 16,
                                color: aboutColor,
                                family: "Roboto-R"),
                          ),
                        ),
                        customTextFormField(
                          controller: cPass,
                          hint: "Confirm Password",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your confirm password";
                            } else if (value != pass.text) {
                              return "Password does not match";
                            }
                          },
                          prefix: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: SvgPicture.asset(
                                'assets/icons/icon_unlock.svg'),
                          ),
                          suffix: IconButton(
                            icon: Icon(
                              _obscureText2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: labelColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText2 = !_obscureText2;
                              });
                            },
                          ),
                          visible: _obscureText2,
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: size.height * 0.03),
                            child: MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  fname = fName.text;
                                  mname = mName.text;
                                  lname = lName.text;
                                  mobile = mobileT.text;
                                  pwd = pass.text;

                                  ApiHelper.sendOtpCall(
                                      mobile: mobile.toString());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OtpScreen(
                                                  model: SignUpModel(
                                                first_name: fname!,
                                                middle_name: mname!,
                                                last_name: lname!,
                                                mobile: mobile!,
                                                password: pwd!,
                                              ))));
                                }
                                fName.clear();
                                mName.clear();
                                lName.clear();
                                mobileT.clear();
                                pass.clear();
                                cPass.clear();
                                setState(() {
                                  _obscureText1 = true;
                                  _obscureText2 = true;
                                });
                              },
                              color: textColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              minWidth: size.width,
                              height: 50,
                              child: Text("Sign Up",
                                  style: customFonts(
                                      color: Colors.white,
                                      fSize: 18,
                                      family: "Roboto-M")),
                            )),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?",
                                style: customFonts(
                                    fSize: 16,
                                    color: botomTextColor,
                                    family: "Roboto-R")),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => const SignInPage(),
                                ));
                              },
                              child: Text("Sign In",
                                  style: customFonts(
                                      fSize: 16, family: "Roboto-B")),
                            )
                          ],
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
