import 'package:flutter/material.dart';
Future<bool> BackPressedDialog(String msg, BuildContext context,) async {
  bool close = false;
  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Alert"),
        content: Text(msg),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                close = true;
              },
              child: const Text(
                "Yes",
                style: TextStyle(
                    color: Color(0xFF8D4600),
                    fontSize: 16,
                    fontFamily: "Roboto-M"),
              )),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                close = false;
              },
              child: const Text(
                "No",
                style: TextStyle(
                    color: Color(0xFF8D4600),
                    fontSize: 16,
                    fontFamily: "Roboto-M"),
              ))
        ],
      );
    },
  );
  return close;
}
