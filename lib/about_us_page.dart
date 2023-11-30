import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'customwidgets/customColor.dart';
import 'home_and_profile/customwidgets.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final controller = PageController(
    viewportFraction: 1,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: textColor),
        elevation: 0,
        title: Text(
          "About Us",
          style: customFonts(fSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
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
                          image: AssetImage("assets/images/about-us.png"),
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
                  activeDotColor: swiperColor,
                  dotHeight: 10,
                  dotWidth: 10,
                )),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              width: size.width,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 55)
              ], borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.05),
              child: Column(
                children: [
                  Text(
                    "Bahubali Pratishta Mahotsav, Songadh",
                    style: customFonts(
                        fSize: 23, family: "Roboto-B", color: aboutColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "In the holy tradition of Vetraagi Sarvagya Shrim Bhagwat Kundkund Acharya Adi Sarva Achary, the secret initiator of the Jinmarg, the supreme savior, Pujya Gurudevshri Kanjiswami and Pujya Behinshri Champabahen, under the of their Sadhanabhoomi Songgarh Suvarnapuri Madhya newly built Bahubalinindra Bhagwan and Jan. Pratishta Mohotsav of Budweep's Shasvat Jinbimbo January 2024 is defined in Along with that On 26-01-2024 there is a program of Mahamastak Abhishek of Shri Bahubali Munindra Bhagwan.\n\nSonggarh Swadhyaya Mandir Trust and Prestige Committee are organizing this Bhagirath work with great effort.\n\n Various committees will be constituted for the success and proper management of Pratistha Mohotsav.",
                    style: customFonts(
                        fSize: 16, family: "Roboto-R", color: aboutColor),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.05),
                    height: 60,
                    width: size.width,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(textColor),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)))),
                      child: Text(
                        "Register Now",
                        style: customFonts(
                            fSize: 18, family: "Roboto-R", color: Colors.white),
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
}
