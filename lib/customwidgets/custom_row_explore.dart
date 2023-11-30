import 'package:flutter/material.dart';

import '../home_and_profile/customwidgets.dart';
import 'customColor.dart';

class ExploreHeaderRow extends StatelessWidget {
  const ExploreHeaderRow({Key? key, required this.headertext}) : super(key: key);

  final String headertext;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:
      EdgeInsets.symmetric(vertical: size.height * 0.015),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xff8E0B0B),
            radius: 4,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            headertext,
            style: customFonts(
                fSize: 16,
                family: "Roboto-M",
                color: drawerColor),
          )
        ],
      ),
    );
  }
}
