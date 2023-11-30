import 'package:flutter/material.dart';
import 'home_and_profile/btm_bar.dart';
import 'sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class InitialVideoScreen extends StatefulWidget {
  const InitialVideoScreen({Key? key}) : super(key: key);

  @override
  State<InitialVideoScreen> createState() => _InitialVideoScreenState();
}

class _InitialVideoScreenState extends State<InitialVideoScreen> {
  late VideoPlayerController videoController;
  late Future<void> _initializedVideoPlayer;
  String token = "";
  bool startedPlaying = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    remembered();
    videoController = VideoPlayerController.asset(
      "assets/videos/Video.mp4",
    );
    _initializedVideoPlayer = videoController.initialize().then((value) {
      return videoController.play();
    });
    videoController.addListener(() {
      if (videoController.value.position == videoController.value.duration) {
        if (token.trim().isEmpty) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SignInPage()));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomBarScreen(
                        token: token.toString(),
                      )));
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoController.dispose();
  }

  void remembered() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    token = prefer.getString("token") ?? "";
    print(prefer.getString("token"));
    print("Hello token $token");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _initializedVideoPlayer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              FlutterNativeSplash.remove();
              return Stack(alignment: Alignment.bottomCenter, children: [
                SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: VideoPlayer(videoController)),
                ElevatedButton(
                    onPressed: () {
                      if (token.trim().isEmpty) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()));
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomBarScreen(
                                      token: token,
                                    )));
                      }
                    },
                    child: const Text("Skip"))
              ]);
            } else {
              return Container();
            }
          }),
    );
  }
}
