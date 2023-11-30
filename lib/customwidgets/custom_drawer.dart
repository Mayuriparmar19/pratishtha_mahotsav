import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../about_us_page.dart';
import '../api/api_helper.dart';
import '../home_and_profile/btm_bar.dart';
import '../models/user_details_model.dart';
import '../sign_in.dart';
import '../volunteer_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_and_profile/customwidgets.dart';
import 'customColor.dart';


CustDrawer(
    {  required BuildContext context,required GlobalKey<ScaffoldState> scaffoldKey}) {
  Size size = MediaQuery.of(context).size;
  UserDetailsModel model = ApiHelper.detailsModel;
  return Drawer(
    child: Container(
      width: size.width * 0.55,
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          textColor.withOpacity(0.3),
          Colors.white60,
          Colors.white,
          Colors.white
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/middlebox-back.png",
            height: size.height * 0.2,
            width: size.width,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       const Center(
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 48,
                            backgroundImage: AssetImage("assets/images/image_place_holder.png"),
                            //foregroundImage: NetworkImage(ApiHelper.detailsModel.rows!.userImage.toString()),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "${model.rows?.firstName ?? "-"} ${model.rows?.middleName ?? " Guest"} ${model.rows?.lastName ?? "-"}",
                        style: customFonts(fSize: 18),
                      ),
                      SvgPicture.asset(
                        "assets/icons/divider2.svg",
                        fit: BoxFit.fitWidth,
                        height: 20,
                        width: size.width * 0.9,
                      ),
                    ],
                  ),
                ),
                CustomRow(
                    drawerText: "Profile",
                    icon: "assets/drawer-icons/profile.svg",
                    onTap: () {
                      scaffoldKey.currentState!.closeDrawer();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BottomBarScreen(selected: 4),), (route) => false);
                    }),
                CustomRow(
                    drawerText: "Upcoming events",
                    icon: "assets/drawer-icons/events.svg",
                    onTap: () {
                      scaffoldKey.currentState!.closeDrawer();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomBarScreen(selected: 1),), (route) => false);
                    }),
                CustomRow(
                    drawerText: "Contact Us",
                    icon: "assets/drawer-icons/call.svg",
                    onTap: () {
                      scaffoldKey.currentState!.closeDrawer();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const AboutUsPage()));
                    }),
                CustomRow(
                    drawerText: "Become a volunteer",
                    icon: "assets/drawer-icons/volunteer.svg",
                    onTap: () {
                      scaffoldKey.currentState!.closeDrawer();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const VolunteerMain(),));
                    }),
                CustomRow(
                    drawerText: "Request To Stay",
                    icon: "assets/drawer-icons/Stay.svg",
                    onTap: () {}),
                CustomRow(
                    drawerText: "Policy",
                    icon: "assets/drawer-icons/Policy.svg",
                    onTap: () {}),
                CustomRow(
                    drawerText: "Settings",
                    icon: "assets/drawer-icons/Settings.svg",
                    onTap: () {}),
                CustomRow(
                    drawerText: "Logout",
                    icon: "assets/drawer-icons/Logout.svg",
                    tril: false,
                    onTap: () async{
                      ApiHelper.resetUserDetailsModel();
                      SharedPreferences pref =await SharedPreferences.getInstance();
                      pref.remove("token");
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignInPage(),), (route) => false);
                    }),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child: Container()),
                      SvgPicture.asset(
                        "assets/drawer-icons/Twitter.svg",
                        width: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset(
                        "assets/drawer-icons/facebook.svg",
                        width: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset(
                        "assets/drawer-icons/youtube.svg",
                        width: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset(
                        "assets/drawer-icons/insta.svg",
                        width: 30,
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


CustomRow(
    {required String icon, required String drawerText, bool tril = true,required  onTap}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              icon,
              height: 18,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Text(
                  drawerText,
                  style:
                  customFonts(fSize: 14, color: drawerColor, family: "Droid-R"),
                )),
            tril
                ? const Icon(
              Icons.chevron_right,
              size: 20,
            )
                : Container()
          ],
        ),
        // SizedBox(
        //   height: 18,
        // ),
        tril?const Divider(
          height: 30,
          color: dividerColor,
          thickness: 2.5,
        ):Container(),
      ],
    ),
  );
}