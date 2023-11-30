import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../api/api_helper.dart';
import '../customwidgets/customColor.dart';
import '../models/user_details_model.dart';
import 'customwidgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserDetailsModel model = ApiHelper.detailsModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text(
            "Profile",
            style: customFonts(fSize: 18),
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  "Edit",
                  style: customFonts(fSize: 16, family: "Roboto-M"),
                ))
          ],
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.black.withOpacity(0.2),
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            height: double.maxFinite,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, downloadIconColor, gradientColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: size.height * 0.4,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/middlebox-back.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            const CircleAvatar(
                              radius: 85,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 75,
                                backgroundImage:
                                    AssetImage("assets/images/profile.png"),
                              ),
                            ),
                            Positioned(
                                bottom: 10,
                                right: 5,
                                child: CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Colors.white,
                                  child: SvgPicture.asset(
                                    "assets/icons/Camera.svg",
                                    fit: BoxFit.fitHeight,
                                  ),
                                ))
                          ],
                        ),
                        // SizedBox(height: size.height*0.08,),

                        Text(
                          "${model.rows?.firstName ?? "-"} ${model.rows?.middleName ?? " Guest"} ${model.rows?.lastName ?? "-"}",
                          style: customFonts(fSize: 18),
                        ),
                        Text(
                          "Business owner",
                          style: customFonts(
                              fSize: 16, family: "Roboto-R", color: aboutColor),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.04),
                          height: 50,
                          width: size.width,
                          child: SvgPicture.asset(
                            "assets/icons/bottom.svg",
                            fit: BoxFit.fitWidth,
                            color: borderColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                                backgroundColor:
                                    containerBackColor.withOpacity(0.3),
                                radius: 40,
                                child: const Icon(
                                  Icons.cake,
                                  color: textColor,
                                  size: 35,
                                )),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "BirthDate",
                              style: customFonts(fSize: 14, family: "Roboto-R"),
                            ),
                            Text(
                              model.rows?.birthDate ?? "--",
                              style: customFonts(fSize: 15, family: "Roboto-M"),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                                backgroundColor:
                                    containerBackColor.withOpacity(0.3),
                                radius: 40,
                                child: const Icon(
                                  Icons.location_on_outlined,
                                  color: textColor,
                                  size: 35,
                                )),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Live In",
                              style: customFonts(fSize: 14, family: "Roboto-R"),
                            ),
                            Text(
                              model.rows?.liveIn ?? "--",
                              style: customFonts(fSize: 15, family: "Roboto-M"),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.035,
                        vertical: size.height * 0.03),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(35))),
                    child: Column(
                      children: [
                        customTextField(
                            label: "Email ID",
                            mainText: model.rows?.email ?? "--"),
                        customTextField(
                            label: "What'sapp Number",
                            mainText: model.rows?.mobile ?? "--"),
                        customTextField(
                            label: "Gender",
                            mainText: model.rows?.gender ?? "--"),
                        customTextField(
                            label: "Languages Know",
                            mainText: model.rows?.language ?? "--"),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Flexible(
                                child: customTextField(
                                    label: "State , Country",
                                    mainText: (model.rows?.stateName) ?? "--"),
                              ),
                              Flexible(
                                child: customTextField(
                                    label: "City",
                                    mainText: model.rows?.cityName ?? "--"),
                              )
                            ],
                          ),
                        ),
                        customTextField(
                            label: "Associated With",
                            mainText: model.rows?.address ?? "--"),
                        customTextField(
                            label: "PinCode",
                            mainText: model.rows?.postalCode ?? "--"),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          height: 50,
                          decoration: BoxDecoration(
                            color: textColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "View Your Digital Id",
                                style: customFonts(
                                    fSize: 16,
                                    color: Colors.white,
                                    family: "Roboto-M"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.chevron_right,
                                size: 22,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
