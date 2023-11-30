import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BhojnalayPage extends StatefulWidget {
  const BhojnalayPage({Key? key}) : super(key: key);

  @override
  State<BhojnalayPage> createState() => _BhojnalayPageState();
}

class _BhojnalayPageState extends State<BhojnalayPage>
    with TickerProviderStateMixin {
  String? place = "Bhavnagar";
  final carousalController = CarouselController();
  int activeIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            "assets/icons/back_arrow.svg",
            height: 5,
            width: 5,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          "Bhojanalay",
          style: TextStyle(
            fontSize: 19,
            fontFamily: "Droid-Serif",
            fontWeight: FontWeight.bold,
            color: Color(0xFF9E4F01),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFFFFF), Color(0xFFFFE9B8)],
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/half_madala_mask.png"),
                fit: BoxFit.fill,
              ),
            ),
            width: double.maxFinite,
            height: height * 0.5,
          ),
          Column(
            children: [
              SafeArea(
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
                  itemBuilder: (BuildContext context, int itemIndex,
                      int pageViewIndex) {
                    return Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Image(
                        image: AssetImage(
                            "assets/images/bhojnalay_swipe.png"),
                        width: double.maxFinite,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8,),
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
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 16,right: 16,left: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                        blurRadius: 20,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Meal service available on specific time",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF646464),
                            fontFamily: "Roboto-R",
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Row(
                          children: [
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: Color(0xFF8E0B0B),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Meal Instruction",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Roboto-M",
                                color: Color(0xFF032323),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                        const Text(
                          "• Before every meal, you are required to show your ePass/coupon at the entrance of the Dining Hall. \n\n• Please refrain from eating after sunset in the Ashram. Kindly observe complete silence in the Dining Hall.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF646464),
                            fontFamily: "Roboto-R",
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Breakfast",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFF323232),
                                    fontFamily: "Roboto-B",
                                    fontSize: 20,
                                  ),
                                ),
                                Container(width: 2, height: 20, color: Colors.grey),
                                const Text(
                                  "   Lunch  ",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFF323232),
                                    fontFamily: "Roboto-B",
                                    fontSize: 20,
                                  ),
                                ),
                                Container(width: 2, height: 20, color: Colors.grey),
                                const Text(
                                  "  Dinner  ",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFF323232),
                                    fontFamily: "Roboto-B",
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            TabBar(
                              padding: EdgeInsets.zero,
                              labelColor: Colors.red,
                              indicatorColor: const Color(0xFF8D4600),
                              controller: _tabController,
                              tabs: const [
                                Tab(
                                  child: SizedBox(
                                    height: 1,
                                    child: Text(
                                      "Breakfast",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.transparent,
                                        fontFamily: "Roboto-B",
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: SizedBox(
                                    height: 1,
                                    child: Text(
                                      "   Lunch  ",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.transparent,
                                        fontFamily: "Roboto-B",
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: SizedBox(
                                    height: 1,
                                    child: Text(
                                      "  Dinner  ",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.transparent,
                                        fontFamily: "Roboto-B",
                                        fontSize: 20,
                                      ),
                                    ),

                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: const DecorationImage(

                                  image: AssetImage(
                                      "assets/images/lunch_image.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),

                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Timing:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Roboto-M",
                                    color: Color(0xFF032323),
                                  ),
                                ),
                                Text(
                                  "7:00 To 9:30 AM",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Roboto-R",
                                    color: Color(0xFF848484),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Pricing",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Roboto-M",
                                    color: Color(0xFF032323),
                                  ),
                                ),
                                Text(
                                  "60/- per person",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Roboto-R",
                                    color: Color(0xFF848484),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8D4600),
                            padding: const EdgeInsets.all(16),
                          ),
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Buy e-pass",
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontFamily: "Roboto-R",
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Note:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Roboto-B",
                                  color: Color(0xFF8D4600),
                                ),
                              ),
                              TextSpan(text: " No need to pay for babies aged between 0-5 year",style: TextStyle(fontSize: 16,fontFamily: "Roboto-R",color: Color(0xFF323232)))
                            ],
                          ),
                        ),
                        const SizedBox(height: 16,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
