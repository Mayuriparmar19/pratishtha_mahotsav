import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'api/api_helper.dart';
import 'home_and_profile/btm_bar.dart';
import 'home_and_profile/customwidgets.dart';
import 'sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'customwidgets/customColor.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final number = TextEditingController();
  final password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool remember = false;

  @override
  void initState() {
    remembered();
    super.initState();
  }

  void remembered() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    final data = prefer.getStringList("remember") ?? [];

    //print("${data!.isEmpty} hello");
    if (data.isEmpty == true) {
    } else {
      remember = true;
      number.text = data[0];
      password.text = data[1];
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          height: size.height * 1.06,
          width: size.width,
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.3,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/half_madala_mask.png'),
                          fit: BoxFit.fill),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFFFFFFF),
                          Color(0xFFFFE9B8),
                        ],
                      )),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: const Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xff9E4F01),
                                  fontFamily: 'Droid-Bold'),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.08, left: size.width * 0.06),
                        child: const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Welcome to,',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xff646464),
                                  fontFamily: 'Droid-R'),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.01, left: size.width * 0.06),
                        child: const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Mahamangal Panchkalyanak Pratishtha Mahotsav',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Color(0xff323232),
                                  fontFamily: 'Droid-Bold'),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.3),
                  child: Container(
                    width: size.width * double.maxFinite,
                    height: size.height * double.maxFinite,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.05,
                          top: size.height * 0.04,
                          right: size.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.035,
                            child: const Text(
                              'Mobile Number',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff323232),
                                  fontFamily: 'Roboto-R'),
                            ),
                          ),
                          Form(
                            key: formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: number,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Mobile Number',
                                    hintStyle: customFonts(
                                        fSize: 14,
                                        color: labelColor,
                                        family: "Roboto-R"),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(13.0),
                                      child: SvgPicture.asset(
                                          'assets/icons/icon_mobile.svg'),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter Mobile Number";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                SizedBox(
                                  height: size.height * 0.035,
                                  child: const Text(
                                    'Password',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff323232),
                                        fontFamily: 'Roboto'),
                                  ),
                                ),
                                TextFormField(
                                  controller: password,
                                  obscureText: !_passwordVisible,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Password',
                                    hintStyle: customFonts(
                                        fSize: 14,
                                        color: labelColor,
                                        family: "Roboto-R"),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(13.0),
                                      child: SvgPicture.asset(
                                          'assets/icons/icon_unlock.svg'),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _passwordVisible
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: const Color(0xffCCCCCC),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your password";
                                      // } else if (!regex.hasMatch(value)) {
                                      //   return "Please enter valid password";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          activeColor: const Color(0xff8D4600),
                                          value: remember,
                                          onChanged: (value) {
                                            setState(() {
                                              remember = value!;
                                            });
                                          },
                                        ),
                                        const Text(
                                          'Remember Me',
                                          style: TextStyle(
                                              fontFamily: 'Roboto-M',
                                              color: Color(0xff323232),
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          color: Color(0xff8D4600),
                                          fontSize: 14,
                                          fontFamily: 'Roboto-M'),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () async {
                                      SharedPreferences prefer =
                                          await SharedPreferences.getInstance();
                                      if (formkey.currentState!.validate()) {
                                        if (remember == true) {
                                          prefer.setStringList("remember",
                                              [number.text, password.text]);
                                        } else {
                                          prefer.remove("remember");
                                        }

                                        var token = await ApiHelper.loginCall(
                                            mobile: number.text,
                                            password: password.text);
                                        print("$token is here");
                                        if (token.isNotEmpty) {
                                          // ignore: use_build_context_synchronously
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BottomBarScreen(
                                                        token: token,
                                                      )));
                                        } else {
                                          var data = jsonDecode(prefer
                                              .getString("user_details")
                                              .toString());
                                          Fluttertoast.showToast(
                                              msg: data.error.toString());
                                        }
                                      }
                                    },
                                    child: Container(
                                      height: size.height * 0.075,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: const Color(0xff8D4600)),
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Sign In',
                                            style: TextStyle(
                                                fontFamily: 'Roboto-M',
                                                fontSize: 18,
                                                color: Color(0xffFFFFFF)),
                                          )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.08,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Don't have an account?",
                                      style: TextStyle(
                                          color: Color(0xff646464),
                                          fontSize: 16,
                                          fontFamily: 'Roboto-R'),
                                    ),
                                    TextButton(
                                      child: const Text("Sign Up",
                                          style: TextStyle(
                                              color: Color(0xff8D4600),
                                              fontSize: 16,
                                              fontFamily: 'Roboto-B')),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUpScreen(),
                                                ),
                                                (route) => false);
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.05,
                                ),
                                //const Align(alignment: Alignment.center,child: Text("SKIP",style: TextStyle(color: Color(0xff8D4600),fontSize: 14,fontFamily: 'RobotoMedium',))),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      bottom:
                                          2, // Space between underline and text
                                    ),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: Color(0xff8D4600),
                                      width: 1.0, // Underline thickness
                                    ))),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushReplacement(
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                    secondaryAnimation) =>
                                                BottomBarScreen(),
                                            transitionDuration: const Duration(
                                                milliseconds: 200),
                                            transitionsBuilder: (context,
                                                animation,
                                                secondaryAnimation,
                                                child) {
                                              // Define your desired transition animation here
                                              return SlideTransition(
                                                position: Tween<Offset>(
                                                        begin: const Offset(
                                                            1.0, 0.0),
                                                        end: Offset.zero)
                                                    .animate(animation),
                                                child: child,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "SKIP",
                                        style: TextStyle(
                                            color: Color(0xff8D4600),
                                            fontFamily: 'Roboto-M',
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
