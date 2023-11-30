import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../customwidgets/custom_row_explore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../home_and_profile/customwidgets.dart';
import '../customwidgets/customColor.dart';

class PujyaGurudevScreen extends StatefulWidget {
  const PujyaGurudevScreen({Key? key}) : super(key: key);

  @override
  State<PujyaGurudevScreen> createState() => _PujyaGurudevScreenState();
}

class _PujyaGurudevScreenState extends State<PujyaGurudevScreen>
    with TickerProviderStateMixin {
  final carousalController = CarouselController();
  int activeIndex = 0;
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Pujya Gurudev & Mataji",
          style: customFonts(fSize: 18, color: aboutColor),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        color: gradientColor,
        child: Column(
          children: [
            Container(
              height: size.height * 0.4,
              width: size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.white,
                    Colors.white60,
                    gradientColor.withOpacity(0.1)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/half_madala_mask.png"),
                      fit: BoxFit.fill)),
              child: SafeArea(
                child: Column(children: [
                  CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        aspectRatio: 16 / 8,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                      ),
                      itemCount: 3,
                      carouselController: carousalController,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return Container(
                          width: size.width * 0.9,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/pujya_gurudev.png"),
                                  fit: BoxFit.fill)),
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedSmoothIndicator(
                      duration: Duration.zero,
                      activeIndex: activeIndex,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        radius: 10,
                        activeDotColor: const Color(0xFF8E0B0B),
                        dotColor: const Color(0xFF8E0B0B).withOpacity(0.3),
                        dotHeight: 8,
                        dotWidth: 8,
                      )),
                ]),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.02),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      TabBar(
                        padding: EdgeInsets.zero,
                        labelColor: aboutColor,
                        indicatorColor: textColor,
                        controller: _tabController,
                        dividerColor: labelColor.withOpacity(0.3),
                        indicatorWeight: 5,
                        unselectedLabelStyle: customFonts(
                            fSize: 18, family: "Roboto-R", color: aboutColor),
                        labelStyle: customFonts(
                            fSize: 18, family: "Roboto-B", color: aboutColor),
                        tabs: const [
                          Tab(
                            child: SizedBox(
                              height: 50,
                              child: Text("Pujya Gurudev",
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Tab(
                            child: SizedBox(
                              height: 50,
                              child: Text(
                                "Pujya Mataji",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const ExploreHeaderRow(headertext: "Early Life"),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.01),
                        child: Text(
                            "Gurudevshree Kanjiswami was born in Umrala, Gujarat, on 21st April 1890 (Vaishakh Sud 2, Vikram Samvat 1946) to mother Ujamba and father Motichandbhai. Kanji took basic education in Umrala but moved to Palej, near Vadodara, with his father since his mother passed away when he was only 11 years old. He joined his father’s grocery business at the age of 17. He was very sharp,",
                            maxLines: 9,
                            style: customFonts(
                                fSize: 16,
                                family: "Roboto-R",
                                color: botomTextColor),
                            overflow: TextOverflow.ellipsis),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                        width: size.width * 0.88,
                        child: SvgPicture.asset(
                          "assets/icons/divider2.svg",
                        ),
                      ),
                      const ExploreHeaderRow(headertext: "Leading the Path"),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.01),
                        child: Text(
                            "The teachings in Samaysara paved the way for self-realization (Samyak Darshan) and opened the right path for the devotees. He was able to bring out the basic principles of life as depicted in the Scriptures and gave the right method of practicing these texts.",
                            maxLines: 6,
                            style: customFonts(
                                fSize: 16,
                                family: "Roboto-R",
                                color: botomTextColor),
                            overflow: TextOverflow.ellipsis),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                        width: size.width * 0.88,
                        child: SvgPicture.asset(
                          "assets/icons/divider2.svg",
                        ),
                      ),
                      const ExploreHeaderRow(headertext: "Inspiration"),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.01),
                        child: Text(
                            "Gurudevshree Kanjiswami's life inspires us to always be active in the direction of Salvation. Gurudevshree's sole purpose was to find a remedy for the end of all future lives in the present life itself. This was the path and the objective he set for his followers. If Gurudevshree had not explained to us the true principles, we would have probably never understood the steadfast",
                            maxLines: 9,
                            style: customFonts(
                                fSize: 16,
                                family: "Roboto-R",
                                color: botomTextColor),
                            overflow: TextOverflow.ellipsis),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                        width: size.width * 0.88,
                        child: SvgPicture.asset(
                          "assets/icons/divider2.svg",
                        ),
                      ),
                      const ExploreHeaderRow(headertext: "Illuminating satsang on mobile and TV")
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
