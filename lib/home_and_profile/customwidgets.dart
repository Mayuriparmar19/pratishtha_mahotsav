import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../customwidgets/customColor.dart';

customFonts(
    {required double fSize, Color? color, String family = "Droid-Bold"}) {
  return TextStyle(
    fontFamily: family,
    fontSize: fSize,
    color: color ?? textColor,
  );
}

timerCols({required String head, required String subtitle}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        head,
        style: customFonts(fSize: 20),
      ),
      Text(
        subtitle,
        style: customFonts(fSize: 14, family: "Roboto-R"),
      )
    ],
  );
}

customGrid(
    {required Size size,
    required String icon,
    required String title,
    required  final GestureTapCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(top: 2),
      height: size.height * 0.17,
      width: size.width * 0.28,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: containerBackColor.withOpacity(0.3),
              radius: 40,
              child: SvgPicture.asset(
                icon,
                height: 35,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: customFonts(fSize: 15,family: "Roboto-M",color: textColor),
            )
          ],
        ),
      ),
    ),
  );
}

customTextField({required String label, required String mainText,int? maxLine}) {
  TextEditingController control = TextEditingController(text: mainText);
  return TextField(
    controller: control,
    enabled: false,
    maxLines: maxLine,
    textAlignVertical: TextAlignVertical.center,
    style: customFonts(fSize: 16,family: "Roboto-M",color: aboutColor),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 30),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: labelColor)
      ),
      labelText: label,
      labelStyle: customFonts(fSize: 16, family: "Roboto-R", color: labelColor),
    ),
  );
}


customTextFormField(
    {required validate,
      Widget? suffix,
      required Widget prefix,
      required String hint,
      required TextEditingController controller,
      TextInputType type = TextInputType.text,
      bool visible = false}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: visible,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      prefixIcon: prefix,
      suffixIcon: suffix,
      hintText: hint,
      hintMaxLines: 2,
      hintStyle: customFonts(fSize: 16, family: "Roboto-R", color: labelColor),
    ),
    validator: validate,
  );
}