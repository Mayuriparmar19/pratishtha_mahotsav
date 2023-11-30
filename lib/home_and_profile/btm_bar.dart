import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../customwidgets/back_pressed_dialog.dart';
import '../customwidgets/custom_drawer.dart';
import '../explor%20pages/explore_page.dart';
import 'pressReleaseScreen.dart';
import 'profilescreen.dart';

import '../schedule_page.dart';
import '../api/api_helper.dart';
import '../customwidgets/customColor.dart';
import 'homescreen.dart';


class BottomBarScreen extends StatefulWidget {
  BottomBarScreen({Key? key, this.selected = 0,this.token =""}) : super(key: key);
  int selected;
  String token;
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> with TickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> screens = <Widget>[];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, initialIndex: widget.selected, vsync: this);
    if(widget.token.trim().isNotEmpty){
      print(widget.token);
      ApiHelper.getUserDetailCall(token: widget.token);
    }else{
      print("Empty token");
    }
    screens = [
      const HomeScreen(),
      const SchedulePage(),
      const ExplorePage(),
      const PressReleaseScreen(),
      const ProfileScreen()
    ];
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void selectedPage(int index) {
    setState(() {
      widget.selected = index;
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool close = false;
        if (widget.selected == 0) {
          close = await BackPressedDialog("Do You Want To Exit", context);
        } else {
          widget.selected = 0;
          _tabController.index = 0;
          setState(() {});
        }
        return close;
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustDrawer(context: context, scaffoldKey: _scaffoldKey),
        body: TabBarView(
physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: screens,
        ),
        bottomNavigationBar: Material(
          elevation: 4,
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            indicator: const BoxDecoration(
              border: Border(
                top: BorderSide(color: textColor,width: 4,),
              ),
            ),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelPadding: const EdgeInsets.all(0),
            indicatorColor: textColor,
            labelColor: textColor,
            unselectedLabelColor: botomTextColor,
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: false,
            tabs: [
              Tab(

                icon: SvgPicture.asset(
                  "assets/icons/home${_tabController.index == 0 ?"_active":""}.svg",
                  height: 20,

                ),
                text: 'Home',
              ),
              Tab(
                icon: SvgPicture.asset(
                  "assets/icons/schedule${_tabController.index== 1 ?"_active":""}.svg",
                  height: 20,

                ),
                text: 'Schedule',
              ),
              Tab(
                icon: SvgPicture.asset(
                  "assets/icons/explore${_tabController.index == 2 ?"_active":""}.svg",
                  height: 20,

                ),
                text: 'Explore',
              ),
              Tab(
                icon: SvgPicture.asset(
                  "assets/icons/press.svg",
                  height: 20,
                  color: widget.selected == 3 ? textColor : botomTextColor,
                ),
                text: 'Release',
              ),
              Tab(
                icon: SvgPicture.asset(
                  "assets/icons/profile.svg",
                  height: 20,
                  color: widget.selected == 4 ? textColor : botomTextColor,
                ),
                text: 'Profile',
              ),
            ],
            onTap: selectedPage,
          ),
        ),
      ),
    );
  }
}