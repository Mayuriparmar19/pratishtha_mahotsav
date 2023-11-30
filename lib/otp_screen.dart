import 'package:flutter/material.dart';
import 'package:pratishtha_mahotsav/registration_form1.dart';

import 'home_and_profile/btm_bar.dart';

import 'api/api_helper.dart';
import 'customwidgets/customColor.dart';
import 'home_and_profile/customwidgets.dart';
import 'models/signup_model.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required this.model}) : super(key: key);
  final SignUpModel model;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    _fieldOne.text = " ";
    _fieldTwo.text = " ";
    _fieldThree.text = " ";
    _fieldFour.text = " ";
    _fieldFive.text = " ";
    _fieldSix.text = " ";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, gradientColor.withOpacity(0.3)]),
        ),
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "OTP Verification",
                style: customFonts(
                    fSize: 18, family: "Roboto-R", color: aboutColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Verification",
                style: customFonts(
                    fSize: 24, family: "Roboto-B", color: aboutColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                "Enter the OTP sent to ${widget.model.mobile}",
                style: customFonts(
                    fSize: 14, family: "Roboto-R", color: aboutColor),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                height: size.height * 0.25,
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.02),
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: gradientColor.withOpacity(0.2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OtpInput(_fieldOne, false,
                            canGoPrev: false, canGoNext: true), // auto focus
                        OtpInput(_fieldTwo, false,
                            canGoPrev: true, canGoNext: true),
                        OtpInput(_fieldThree, false,
                            canGoPrev: true, canGoNext: true),
                        OtpInput(_fieldFour, false,
                            canGoPrev: true, canGoNext: true),
                        OtpInput(_fieldFive, false,
                            canGoPrev: true, canGoNext: true),
                        OtpInput(_fieldSix, false,
                            canGoPrev: true, canGoNext: true),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Didn't receive code?  ",
                            style: customFonts(
                                fSize: 14,
                                color: botomTextColor,
                                family: "Roboto-R")),
                        GestureDetector(
                          onTap: () {},
                          child: Text("Resend OTP",
                              style:
                                  customFonts(fSize: 14, family: "Roboto-B")),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        String otp = _fieldOne.text +
                            _fieldTwo.text +
                            _fieldThree.text +
                            _fieldFour.text +
                            _fieldFive.text +
                            _fieldSix.text;

                        bool success = await ApiHelper.verifyOtpCall(
                            mobile: widget.model.mobile,
                            otp: otp,
                            model: widget.model);
                        if (success == true) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomBarScreen()),
                              (route) => false);
                        }
                      },
                      color: textColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      minWidth: size.width,
                      height: 50,
                      child: Text("Submit",
                          style: customFonts(
                              color: Colors.white,
                              fSize: 18,
                              family: "Roboto-M")),
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
