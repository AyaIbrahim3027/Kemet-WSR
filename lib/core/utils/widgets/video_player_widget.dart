import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      autoPlay: false,
      videoPlayerController:
          VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl)),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(flickManager: flickManager);
    // return FittedBox(
    //   fit: BoxFit.scaleDown,
    //   child: SizedBox(
    //     height: MediaQuery.of(context).size.height * 0.3,
    //     child: FlickVideoPlayer(flickManager: flickManager),
    //   ),
    // );
  }
}
