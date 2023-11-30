import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../customwidgets/customColor.dart';
import '../home_and_profile/customwidgets.dart';


class JinMandirPage extends StatefulWidget {
  const JinMandirPage({Key? key}) : super(key: key);

  @override
  State<JinMandirPage> createState() => _JinMandirPageState();
}

class _JinMandirPageState extends State<JinMandirPage> {
  final controller = PageController(
    viewportFraction: 1,
    keepPage: true,
  );
  List<bool> isClicked = [false,false,false];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF323232)),
        elevation: 0,
        title: Text(
          "Jinmandir",
          style: customFonts(fSize: 18,color: aboutColor),
        ),
      ),
      body: SingleChildScrollView(

        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFFFFFF),Color(0xFFFFE9B8)]
                ),
                image:DecorationImage(
                  image: AssetImage("assets/images/half_madala_mask.png"),
                  fit: BoxFit.cover,
                )
              ),
              child: Padding(
                padding: EdgeInsets.only(top: size.height*0.11),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      height: size.height * 0.27,
                      child: PageView.builder(
                        //scrollDirection: Axis.horizontal,
                        controller: controller,
                        itemCount: 3,
                        itemBuilder: (_, index) {
                          return Container(
                            height: size.height * 0.25,
                            width: size.width,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/jinmandir_swipe.png"),
                                  fit: BoxFit.fill,
                                )),
                          );
                        },
                      ),
                    ),

                    SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: const ExpandingDotsEffect(
                          radius: 20,
                          activeDotColor: Color(0xff8E0B0B),
                          dotHeight: 10,
                          dotWidth: 9,
                        )),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                  ],
                ),
              ),
            ),

            Container(
              width: size.width,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 55)
              ], borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Puja at the JinMandir",
                    style: customFonts(
                        fSize: 23,
                        family: "Roboto-B",
                        color: const Color(0xff323232)),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: CircleAvatar(
                          radius: size.width * .01,
                          backgroundColor: const Color(0xff8E0B0B),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Morning Puja',
                            style: TextStyle(
                                color: Color(0xff032323), fontSize: 18,fontFamily: "Roboto-M"),
                          ),
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          const Text(
                            'Timing : Start 6:30 AM',
                            style: TextStyle(
                                color: Color(0xff646464), fontSize: 16,fontFamily: "Roboto-R"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: CircleAvatar(
                          radius: size.width * .01,
                          backgroundColor: const Color(0xff8E0B0B),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Evening Puja',
                            style: TextStyle(
                                color: Color(0xff032323), fontSize: 18,fontFamily: "Roboto-M"),
                          ),
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          const Text(
                            'Timing : Start 7:00 PM',
                            style: TextStyle(
                                color: Color(0xff646464), fontSize: 16,
                            fontFamily: "Roboto-R"
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                    width: size.width * 0.88,
                    child: SvgPicture.asset(
                      "assets/icons/divider2.svg",
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jinmandir facilities",
                        style: customFonts(
                            fSize: 23, family: "Roboto-B", color: const Color(0xff323232)),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      ExpansionTile(
                        collapsedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: const Color(0xff8D4600),
                        collapsedBackgroundColor: const Color(0xff8D4600),
                        leading: Wrap(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/lockers.svg",
                              height: size.height * 0.03,
                              width: size.width * 0.03,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, bottom: 5),
                              child: Text(
                                '|',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: const Color(0xffFFFFFF)
                                        .withOpacity(0.30)),
                              ),
                            ),
                            const Text(
                              'Lockers',
                              style: TextStyle(
                                fontFamily: "Roboto-M",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        trailing: Icon(
                          isClicked[0]
                              ? Icons.remove_outlined
                              : Icons.add_outlined,
                          color: Colors.white,
                        ),
                        onExpansionChanged: (bool expanded) {
                          setState(() {
                            isClicked[0] = expanded;
                          });
                        },
                        title: const Text(''),
                        children: <Widget>[
                          Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                //borderRadius: BorderRadius.circular(10)
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Jinmandir has started a facility to allow devotees to deposit their luggage with the administrative staff for a hassle-free visit. Temple staff will tag the luggage and give visitors Coupons. The temple management committee has said it can cater to 4,000 devotees at a time. This is the first time such a system has been introduced.',

                                  style: TextStyle(fontSize: 16,fontFamily: "Roboto-R"),

                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      ExpansionTile(
                        collapsedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: const Color(0xff8D4600),
                        collapsedBackgroundColor: const Color(0xff8D4600),
                        leading: Wrap(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/shower.svg",
                              height: size.height * 0.03,
                              width: size.width * 0.03,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, bottom: 5),
                              child: Text(
                                '|',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: const Color(0xffFFFFFF)
                                        .withOpacity(0.30)),
                              ),
                            ),
                            const Text(
                              'Bathing',
                              style: TextStyle(
                                fontFamily: "Robot-M",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        trailing: Icon(
                          isClicked[1]
                              ? Icons.remove_outlined
                              : Icons.add_outlined,
                          color: Colors.white,
                        ),
                        onExpansionChanged: (bool expanded) {
                          setState(() {
                            isClicked[1] = expanded;
                          });
                        },
                        title: const Text(''),
                        children: <Widget>[
                          Container(
                              color: Colors.white,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Jinmandir has started a facility to allow devotees to deposit their luggage with the administrative staff for a hassle-free visit. Temple staff will tag the luggage and give visitors Coupons. The temple management committee has said it can cater to 4,000 devotees at a time. This is the first time such a system has been introduced.',
                                  style: TextStyle(fontSize: 16,fontFamily: "Roboto-R"),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      ExpansionTile(
                        collapsedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: const Color(0xff8D4600),
                        collapsedBackgroundColor: const Color(0xff8D4600),
                        leading: Wrap(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/elevator.svg",
                              height: size.height * 0.03,
                              width: size.width * 0.03,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, bottom: 5),
                              child: Text(
                                '|',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: const Color(0xffFFFFFF)
                                        .withOpacity(0.30)),
                              ),
                            ),
                            const Text(
                              'Elevator',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                              fontFamily: "Roboto-M"
                              ),
                            )
                          ],
                        ),
                        trailing: Icon(
                          isClicked[2]
                              ? Icons.remove_outlined
                              : Icons.add_outlined,
                          color: Colors.white,
                        ),
                        onExpansionChanged: (bool expanded) {
                          setState(() {
                            isClicked[2] = expanded;
                          });
                        },
                        title: const Text(''),
                        children: <Widget>[
                          Container(
                              color: Colors.white,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Jinmandir has started a facility to allow devotees to deposit their luggage with the administrative staff for a hassle-free visit. Temple staff will tag the luggage and give visitors Coupons. The temple management committee has said it can cater to 4,000 devotees at a time. This is the first time such a system has been introduced.',
                                  style: TextStyle(fontSize: 16,
                                  fontFamily: "Roboto-R"),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                        width: size.width * 0.88,
                        child: SvgPicture.asset(
                          color: const Color(0xffC66D63),
                          "assets/icons/divider2.svg",
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jinmandir Culture ",
                            style: customFonts(
                                fSize: 23,
                                family: "Roboto-B",
                                color: aboutColor),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          const Text(
                            'Iconography is a branch of art history which studies the images of deities. It consists of identification of image based on certain symbols and mythology associated with them. Even though the fundamental myth and meaning of the deity may remain the same for centuries, its specific usage at a spot can be a response to its local or immediate social, political or geographical context.',
                            style: TextStyle(
                              fontFamily: "Roboto-R",
                                color: Color(0xff646464), fontSize: 17),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
