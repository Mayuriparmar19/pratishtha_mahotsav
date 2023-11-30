import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'bhojanalay_page.dart';
import 'pujya_gurudev_page.dart';

import 'jinmandir_page.dart';
import 'near_by_places_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(18.0),
          child: InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: SvgPicture.asset(
              "assets/images/drawer_logo.svg",
              height: 5,
              width: 5,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        title: const Text("Explore",
            style: TextStyle(
                fontSize: 20,
                fontFamily: "Droid-Bold",
                fontWeight: FontWeight.bold,
                color: Color(0xFF9E4F01))),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: GridView(
          physics: const ClampingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const JinMandirPage(),
                  ));
                },
                child: Container(
                  height: size.height * .12,
                  width: size.height * .12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF6C024).withOpacity(0.15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/Jinmandir.svg",
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      const Text(
                        'Jinmandir',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const PujyaGurudevScreen()));
                },
                child: Container(
                  height: size.height * .12,
                  width: size.height * .12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF6C024).withOpacity(0.15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/PujyaGurudev.svg",
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      const Text(
                        'Pujya Gurudev \n& Mataji',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BhojnalayPage(),
                  ));
                },
                child: Container(
                  height: size.height * .12,
                  width: size.height * .12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF6C024).withOpacity(0.15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/Bhojanalay.svg",
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      const Text(
                        'Bhojanalay',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NearByPlacesPage(),
                  ));
                },
                child: Container(
                  height: size.height * .12,
                  width: size.height * .12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF6C024).withOpacity(0.15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/Near By Places.svg",
                        height: size.height * 0.05,
                        width: size.width * 0.05,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      const Text(
                        'Near By Places',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: size.height * .12,
                  width: size.height * .12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF6C024).withOpacity(0.15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/Request To Stay.svg",
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      const Text(
                        'Request To Stay',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: size.height * .12,
                  width: size.height * .12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF6C024).withOpacity(0.15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/Travel Guide.svg",
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      const Text(
                        'Travel Guide',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: size.height * .12,
                  width: size.height * .12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF6C024).withOpacity(0.15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/Suvarnapuri Guide Map.svg",
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      const Text(
                        'Suvarnapuri \n  Guide Map',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: size.height * .12,
                  width: size.height * .12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF6C024).withOpacity(0.15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/Donation.svg",
                        height: size.height * 0.05,
                        width: size.height * 0.05,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      const Text(
                        'Donation',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
