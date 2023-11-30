import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoGallery extends StatefulWidget {
  final String videoId;
  const VideoGallery({super.key, required this.videoId});

  @override
  State<VideoGallery> createState() => _VideoGalleryState();
}

class _VideoGalleryState extends State<VideoGallery> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoId =
        YoutubePlayer.convertUrlToId("https://youtu.be/${widget.videoId}");
    _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));

    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () => debugPrint('ready'),
          bottomActions: [
            ProgressBar(
              isExpanded: true,
              colors: const ProgressBarColors(
                  playedColor: Colors.blueGrey, handleColor: Colors.blue),
            ),
            const PlaybackSpeedButton(),
            FullScreenButton(),
            RemainingDuration(),
          ],
        ),
      ),
    );
  }
}
