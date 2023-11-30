import 'package:flutter/material.dart';

class PressReleaseScreen extends StatefulWidget {
  const PressReleaseScreen({Key? key}) : super(key: key);

  @override
  State<PressReleaseScreen> createState() => _PressReleaseScreenState();
}

class _PressReleaseScreenState extends State<PressReleaseScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Press Release Screen"),
      ),
    );
  }
}
