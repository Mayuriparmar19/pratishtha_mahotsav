import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'customwidgets/back_pressed_dialog.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});
  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DraggableScrollableController dragCtrl = DraggableScrollableController();
  ScrollController? scrollCtrl;
  List<int> dates = [19, 20, 21, 22, 23, 24, 25, 26];
  List<String> days = ["Fr", "Sa", "Su", "Mo", "Tu", "We", "Th", "Fr"];
  int activeDate = 2;
  int currentTab = 0;
  final controller = PageController(
    viewportFraction: 1,
    keepPage: true,
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () => BackPressedDialog("Do You Want to Exit ?", context),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: false,
          surfaceTintColor: Colors.transparent,
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
          title: const Text("Schedual",
              style: TextStyle(
                  fontSize: 19,
                  fontFamily: "Droid-Serif",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9E4F01))),
        ),
        body: Stack(
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
              height: height * 0.25 + 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "JANUARY 2024",
                      style: TextStyle(
                          color: Color(0xFF8D4600),
                          fontSize: 18,
                          fontFamily: "Roboto-M"),
                    ),
                  ),
                ),
                Container(
                  width: width,
                  height: 90,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  child: Center(
                    child: ListView.builder(
                      itemCount: days.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            activeDate = index;
                            setState(() {});
                          },
                          child: Container(
                            height: 90,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(100),
                                  bottom: Radius.circular(100)),
                              color: activeDate == index
                                  ? const Color(0xFF8D4600)
                                  : Colors.transparent,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  days[index],
                                  style: activeDate == index
                                      ? const TextStyle(
                                          fontFamily: "Roboto-M",
                                          fontSize: 16,
                                          color: Color(0xFFFFFFFF))
                                      : const TextStyle(
                                          fontFamily: "Roboto-R",
                                          fontSize: 18,
                                          color: Color(0xFF323232)),
                                ),
                                Text(
                                  "${dates[index]}",
                                  style: activeDate == index
                                      ? const TextStyle(
                                          fontFamily: "Roboto-M",
                                          fontSize: 16,
                                          color: Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.bold)
                                      : const TextStyle(
                                          fontFamily: "Roboto-B",
                                          fontSize: 18,
                                          color: Color(0xFF8D4600),
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 16, right: 16, left: 16),
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
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                                onTap: () {
                                  currentTab = 0;
                                  setState(() {});
                                },
                                child: Text("Morning",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: currentTab == 0
                                            ? "Roboto-B"
                                            : "Roboto-M",
                                        fontWeight: currentTab == 0
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: const Color(0xFF323232)))),
                            Container(
                              width: 1,
                              height: 30,
                              color: const Color(0xFF707070),
                            ),
                            InkWell(
                                onTap: () {
                                  currentTab = 1;
                                  setState(() {});
                                },
                                child: Text("Evening",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: currentTab == 1
                                            ? "Roboto-B"
                                            : "Roboto-M",
                                        fontWeight: currentTab == 1
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: const Color(0xFF323232)))),
                            Container(
                              width: 1,
                              height: 30,
                              color: const Color(0xFF707070),
                            ),
                            InkWell(
                                onTap: () {
                                  currentTab = 2;
                                  setState(() {});
                                },
                                child: Text("Night",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: currentTab == 2
                                            ? "Roboto-B"
                                            : "Roboto-M",
                                        fontWeight: currentTab == 2
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: const Color(0xFF323232))))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Stack(
                          alignment: currentTab == 0
                              ? Alignment.centerLeft
                              : currentTab == 1
                                  ? Alignment.center
                                  : Alignment.centerRight,
                          children: [
                            Container(
                              height: 2,
                              width: double.infinity,
                              color: const Color(0xFF707070).withOpacity(0.2),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: currentTab == 1 ? 30 : 0),
                              child: Container(
                                height: 5,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF8D4600),
                                    borderRadius: BorderRadius.circular(43)),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: ListView.builder(
                            padding: const EdgeInsets.only(top: 16),
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 16,
                            itemBuilder: (context, index) {
                              return Card(
                                surfaceTintColor: Colors.white,
                                elevation: 2,
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  width: width,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 95,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/temp/${index % 7 + 1}.png"))),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Meditation and Prayers",
                                                style: TextStyle(
                                                    color: Color(0xFF323232),
                                                    fontFamily: "Roboto-M",
                                                    fontSize: 16,
                                                    overflow:
                                                        TextOverflow.ellipsis)),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    "assets/icons/clock.svg"),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                const Text(
                                                  "7:00 to 7:00 AM",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: "Roboto-R",
                                                      color: Color(0xFF646464)),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    "assets/icons/location.svg"),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                const Text(
                                                  "Community Garden",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: "Roboto-R",
                                                      color: Color(0xFF646464)),
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
                            },
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
