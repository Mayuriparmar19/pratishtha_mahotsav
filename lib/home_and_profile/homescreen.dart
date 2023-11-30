import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../about_us_page.dart';
import '../customwidgets/custom_drawer.dart';
import 'btm_bar.dart';
import '../registration_main.dart';
import '../video_gallery_page.dart';
import '../volunteer_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../customwidgets/customColor.dart';
import '../photo_gallery_page.dart';
import 'customwidgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int activeIndex = 0;
  int activeIndex2 = 0;
  final carousalController = CarouselController();
  final Stream _myStream = Stream.periodic(
    const Duration(seconds: 1),
    (computationCount) => computationCount,
  );
  late StreamSubscription _sub;
  Duration? myDuration;
  String? days; // <-- SEE HERE
  String? hours;
  String? minutes;
  String? seconds;
  @override
  void initState() {
    _sub = _myStream.listen((event) {
      myDuration =
          DateTime(2024, DateTime.january, 19).difference(DateTime.now());
      setState(() {
        days = strDigits(myDuration!.inDays); // <-- SEE HERE
        hours = strDigits(myDuration!.inHours.remainder(24));
        minutes = strDigits(myDuration!.inMinutes.remainder(60));
        seconds = strDigits(myDuration!.inSeconds.remainder(60));
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _sub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustDrawer(context: context, scaffoldKey: _scaffoldKey),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.black.withOpacity(0.2),
        elevation: 0,
        title: Text(
          "Home",
          style: customFonts(fSize: 18, color: Colors.white),
        ),
        leading: Container(
            padding: EdgeInsets.only(
                left: size.width * 0.035, right: size.width * 0.035),
            child: InkWell(
              onTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: SvgPicture.asset(
                "assets/icons/leading.svg",
                height: 14,
              ),
            )),
        actions: [
          SvgPicture.asset(
            "assets/icons/trailing.svg",
          ),
          SizedBox(
            width: size.width * 0.04,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.59,
              child: Stack(children: [
                SizedBox(
                  height: size.height * 0.4,
                  width: double.infinity,
                  // width: double.maxFinite,
                  child: SvgPicture.asset("assets/images/back.svg",
                      fit: BoxFit.cover, allowDrawingOutsideViewBox: true),
                ),
                Positioned(
                  top: size.height * 0.07,
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.28,
                    child: Image.asset(
                      "assets/images/Toran-Animation.gif",
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.14,
                  right: 5,
                  left: 0,
                  child: Container(
                    height: size.height * 0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/centerimage.png"),
                            fit: BoxFit.fitHeight)),
                  ),
                ),
                Positioned(
                  top: size.height * 0.515,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.035),
                    height: 50,
                    width: size.width,
                    child: SvgPicture.asset(
                      "assets/icons/bottom.svg",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: size.height * 0.55,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.43,
                    decoration: BoxDecoration(
                        color: const Color(0xffF6C024).withOpacity(0.95),
                        image: const DecorationImage(
                            image:
                                AssetImage("assets/images/middlebox-back.png"),
                            fit: BoxFit.fill)),
                    margin: EdgeInsets.only(top: size.height * 0.1, bottom: 15),
                    child: Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.15,
                        ),
                        Text(
                          "Event Begin",
                          style: customFonts(fSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "19-26 January, 2024",
                          style: customFonts(fSize: 28),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: size.width * 0.035,
                              right: size.width * 0.035,
                              top: 15),
                          height: 80,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/timer-box.png"),
                                  fit: BoxFit.fill)),
                          width: size.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              timerCols(head: days ?? "", subtitle: "days"),
                              SvgPicture.asset(
                                "assets/icons/divider.svg",
                                height: 50,
                              ),
                              timerCols(head: hours ?? "", subtitle: "hours"),
                              SvgPicture.asset(
                                "assets/icons/divider.svg",
                                height: 50,
                              ),
                              timerCols(head: minutes ?? "", subtitle: "mins"),
                              SvgPicture.asset(
                                "assets/icons/divider.svg",
                                height: 50,
                              ),
                              timerCols(head: seconds ?? "", subtitle: "secs"),
                            ],
                          ),
                        ),
                      ],
                    )),
                  ),
                  Positioned(
                    child: Container(
                      height: size.height * 0.25,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: size.width * 0),
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * 0.2,
                            width: size.width,
                            child: CarouselSlider.builder(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  enableInfiniteScroll: true,
                                  viewportFraction: 1.0,
                                  onPageChanged: (index, reason) =>
                                      setState(() => activeIndex = index),
                                ),
                                itemCount: 3,
                                carouselController: carousalController,
                                itemBuilder: (BuildContext context,
                                    int itemIndex, int pageViewIndex) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Stack(
                                      children: [
                                        Image(
                                          image: const AssetImage(
                                              "assets/images/slider-image.png"),
                                          height: size.height * 0.22,
                                          width: size.width,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AnimatedSmoothIndicator(
                              duration: Duration.zero,
                              activeIndex: activeIndex,
                              count: 3,
                              effect: ExpandingDotsEffect(
                                radius: 10,
                                activeDotColor: swiperColor,
                                dotColor: swiperColor.withOpacity(0.5),
                                dotHeight: 5,
                                dotWidth: 5,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => BottomBarScreen(selected: 1),
                        ));
                      },
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.7,
                        margin:
                            EdgeInsets.symmetric(horizontal: size.width * 0.15),
                        decoration: BoxDecoration(
                          color: textColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "Pratishtha Program Schedule",
                            style: customFonts(
                                fSize: 16,
                                color: Colors.white,
                                family: "Droid-Bold"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.47,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customGrid(
                            size: size,
                            icon: "assets/icons/user.svg",
                            title: "User Registration",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const RegistrationMain(),
                              ));
                            }),
                        customGrid(
                            size: size,
                            icon: "assets/icons/volunteer.svg",
                            title: "Volunteer Registration",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const VolunteerMain(),
                              ));
                            }),
                        customGrid(
                            size: size,
                            icon: "assets/icons/awas.svg",
                            title: "Awas Registration",
                            onTap: () {}),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customGrid(
                            size: size,
                            icon: "assets/icons/photo.svg",
                            title: "Photo Gallery",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const PhotoGalleryPage(),
                              ));
                            }),
                        customGrid(
                            size: size,
                            icon: "assets/icons/video.svg",
                            title: "Video Gallery",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const VideoPlayer(),
                              ));
                            }),
                        customGrid(
                            size: size,
                            icon: "assets/icons/livecast.svg",
                            title: "Live Telecast",
                            onTap: () {}),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: size.width,
                      child: SvgPicture.asset(
                        "assets/icons/bottom.svg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ]),
            ),
            Container(
              height: size.height * 0.3,
              width: double.infinity,
              color: containerBackColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.23,
                    width: size.width*0.8,
                    child: CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) =>
                              setState(() => activeIndex2 = index),
                        ),
                        itemCount: 3,
                        carouselController: carousalController,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Stack(
                              children: [
                                Image(
                                  image: const AssetImage(
                                      "assets/images/sweeper.png"),
                                  height: size.height * 0.22,
                                  width: size.width,
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                    top: 10,
                                    right: 10,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 12,
                                      child: SvgPicture.asset(
                                        "assets/icons/share.svg",
                                        fit: BoxFit.fitWidth,
                                        height: 12,
                                        width: 12,
                                      ),
                                    ))
                              ],
                            ),
                          );
                        }),
                  ),
                  AnimatedSmoothIndicator(
                      duration: Duration.zero,
                      activeIndex: activeIndex2,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        radius: 10,
                        activeDotColor: swiperColor,
                        dotHeight: 5,
                        dotWidth: 5,
                        dotColor: swiperColor.withOpacity(0.5),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 10, horizontal: size.width * 0.035),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "About Mahotsav",
                      style: customFonts(fSize: 18, color: aboutColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "In the holy tradition of Vetraagi Sarvagya Bhagwant, Shrimad Bhagwat Kundkund Acharya Adi Sarva Acharya, the secret initiator of the Jinmarg, the supreme savior,... Pujya Gurudevshri Kanjiswami and Dharmaratna Bhagwati, Pujya Behinshri Champabahen, under the auspiciousness of their Sadhanabhoomi Songgarh Suvarnapuri Madhya newly built Bahubalinindra Bhagwan and Jan. Panchakalyanak Pratishta Mohotsav of Budweep's Shasvat Jinbimbo January 2024 is defined in Along with that On 26-01-2024 there is a program of Mahamastak Abhishek of Shri Bahubali Munindra Bhagwan.",
                          style: customFonts(
                              fSize: 16, family: "Roboto-R", color: aboutColor),
                          textAlign: TextAlign.center,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AboutUsPage(),
                            ));
                          },
                          child: const Text(
                            "Know More",
                            style: TextStyle(
                                color: Colors.transparent,
                                fontFamily: "Droid-Bold",
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.solid,
                                decorationColor: Color(0xFF8D4600),
                                decorationThickness: 3,
                                shadows: [
                                  Shadow(
                                      color: Color(
                                        0xFF8D4600,
                                      ),
                                      offset: Offset(0, -2))
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.035),
                    height: 50,
                    width: size.width,
                    child: SvgPicture.asset(
                      "assets/icons/bottom.svg",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Downloads",
                      style: customFonts(fSize: 18, color: aboutColor),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: containerBackColor)),
                    child: ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: downloadIconColor,
                            image: const DecorationImage(
                                image:
                                    AssetImage("assets/icons/download1.png")),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      title: Text(
                        "Partishtha Mahotsav Logo",
                        style: customFonts(fSize: 16, family: "Roboto-R"),
                      ),
                      trailing: SvgPicture.asset(
                        "assets/icons/download.svg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: containerBackColor)),
                    child: ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: downloadIconColor),
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              "assets/icons/music.svg",
                              height: 20,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        "Partishtha Song",
                        style: customFonts(fSize: 16, family: "Roboto-R"),
                      ),
                      trailing: SvgPicture.asset(
                        "assets/icons/download.svg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String strDigits(int n) => n.toString().padLeft(2, '0');
}
