import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'video_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: const Color.fromRGBO(141, 70, 0, .1),
      100: const Color.fromRGBO(141, 70, 0, .2),
      200: const Color.fromRGBO(141, 70, 0, .3),
      300: const Color.fromRGBO(141, 70, 0, .4),
      400: const Color.fromRGBO(141, 70, 0, .5),
      500: const Color.fromRGBO(141, 70, 0, .6),
      600: const Color.fromRGBO(141, 70, 0, .7),
      700: const Color.fromRGBO(141, 70, 0, .8),
      800: const Color.fromRGBO(141, 70, 0, .9),
      900: const Color.fromRGBO(141, 70, 0, 1),
    };
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
          child: child!,
        );
      },
      title: 'Pratishtha Mahotsav',
      debugShowCheckedModeBanner: false,
      home: const InitialVideoScreen(),
      scrollBehavior: const CupertinoScrollBehavior(),
      theme: ThemeData(
          dialogTheme: const DialogTheme(surfaceTintColor: Color(0xFF8D4600)),
          unselectedWidgetColor: const Color(0xFF707070),
          primarySwatch: MaterialColor(0xFF8D4600, color),
          primaryColor: const Color(0xFF8D4600),
          useMaterial3: true,
          radioTheme: RadioThemeData(
            fillColor: MaterialStateColor.resolveWith(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return const Color(0xFF8D4600);
                }
                return Colors.grey;
              },
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            backgroundColor: const Color(0xFF8D4600),
            foregroundColor: const Color(0xFFFFFFFF),
          )),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            hintStyle: const TextStyle(
              color: Color(0xFFC1C1C1),
              fontSize: 16,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    const BorderSide(color: Color(0xFFCCCCCC), width: 1)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 6)),
          )),
    );
  }
}
