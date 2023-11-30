import 'package:flutter/material.dart';

class CustomTextFormFieldLabel extends StatelessWidget {
  const CustomTextFormFieldLabel(
      {Key? key, required this.title, required this.isRequired})
      : super(key: key);
  final String title;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 26,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: title,
              style: const TextStyle(
                fontSize: 16,
               fontWeight: FontWeight.normal,
                color: Color(0xFF323232),
                fontFamily: "Roboto"
              ),
            ),
            isRequired
                ? const TextSpan(
                    text: "*",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFFFF0000),
                      fontFamily: "Roboto"
                    ),
                  )
                : const TextSpan(),
          ]),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
